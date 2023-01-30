//
//  BaseWebVC.m
//  BaseProject
//
//  Created by dongchao on 2022/4/13.
//

#import "BaseWebVC.h"
#import <WebKit/WebKit.h>
#import <CommonCrypto/CommonCryptor.h>

@interface BaseWebVC ()

@property (nonatomic, strong)WKWebView *webView;


@end

@implementation BaseWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.customNavBar tt_setTintColor:UIColor.blackColor];
    
    [self buildView];
    [self loadData];
}

- (void)buildView{
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.customNavBar.mas_bottom);
    }];
}

- (void)setTitleLabTitle:(NSString *)title{
    if (title.length) {
        [self.customNavBar setTitle:title];
    }
    
}

- (void)loadData{
    NSString *token = [PBUserInfo userInfoFromSandbox].token;
    NSString *code = [self encrypt:token key:@"zcdtzcdtzcdtzcdt"];
//    code = [self hexStringFromString:code];
    
    self.urlStr = [NSString stringWithFormat:@"%@%@%@&type=%@",DCBaseUrl, @"/zcdt/loadingApp?token=",code,self.type];
    // https://poletest.shujijian.com:88/zcdt/loadingApp?token=35wxqx7c0KQh2FjLqVypiN5KJ%2FghdjHab%2BFPyTXGTdXHdDWwdKozlnpwk9yfgApu&type=1
    
    // /zcdt/loadingApp?token=2fb1aa2fe632d98eff2f1b2db9223ab63bc1fb343c1d301b898f6479b5a6ff538d475715af9b25d3b33ecf242fbf3631&type=2
    
    NSURL *url = [NSURL URLWithString:[self.urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - GGWkWebViewDelegate
- (NSDictionary *)webviewSetAppCookieKeyAndValue
{
    NSString *token = [PBUserInfo userInfoFromSandbox].token;
    NSString *code = [self encrypt:token key:@"zcdtzcdtzcdtzcdt"];
    return @{@"type": self.type,@"token":code};
    
    // return @{@"map-dg-settlement-token": [PBUserInfo userInfoFromSandbox].token,@"mobile-token-name":[PBUserInfo userInfoFromSandbox].token};
}

-(WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.opaque = NO;
    }
    return _webView;
}

- (NSString *)encrypt:(NSString *)text key:(NSString *)key {
    
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    const void *bytesOfData = data.bytes;
    NSUInteger lengthOfData = data.length;
    
    size_t bufferSize = lengthOfData + kCCBlockSizeAES128;
    unsigned char *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionECBMode | kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCKeySizeAES128,
                                          NULL,
                                          bytesOfData,
                                          lengthOfData,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if (cryptStatus == kCCSuccess) {
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        return [self convertDataToHexStr:resultData];
//        return [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    
    free(buffer);
    
    return @"";
}

- (NSString *)hexStringFromString:(NSString *)string {
    NSData *myData = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myData bytes];
    NSString *hexStr = @"";
    for (int i=0;i<[myData length];i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];
        if ([newHexStr length] == 1) {
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }else {
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
        }
    }
    return hexStr;
}

- (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString*hexStr= [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if([hexStr length] == 2){
                [string appendString:hexStr];
            } else{
                [string appendFormat:@"0%@", hexStr];
                
            }
            
        }
    }];
    return string;
}

- (NSString*) serializeDeviceToken:(NSData*) deviceToken{
    NSMutableString *str = [NSMutableString stringWithCapacity:64];
    int length = [deviceToken length];
    char *bytes = malloc(sizeof(char) * length);
    [deviceToken getBytes:bytes length:length];
    for (int i = 0; i < length; i++){
        [str appendFormat:@"%02.2hhX", bytes[i]];
    }
    free(bytes);
    return str;
}

@end
