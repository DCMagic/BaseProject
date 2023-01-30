//
//  PBUser.m
//  PartyMemberPocketBook
//
//  Created by 刘涛 on 2019/1/18.
//  Copyright © 2019 dongchao. All rights reserved.
//

#import "PBUser.h"

@implementation PBUser


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
////        for (NSString *memberNameStr in self.tt_propertyKeys) {
////
////            [self setValue:@"" forKey:memberNameStr];
////        }
////        _learningFraction = @"--";
////        _partyBranchRanking = @"--";
////        _integral = @"--";
////        _medalNum = @"--";
//    }
//    return self;
//}


- (void)update:(PBUser *)user {
    
    for (NSString *memberNameStr in self.tt_propertyKeys) {
        NSDictionary *propertyDict = user.tt_propertyDictionary;
        id value = propertyDict[memberNameStr];
        
        if ([value isKindOfClass:[NSString class]]) {
            NSString *valueStr = (NSString *)value;
            if (valueStr != nil && valueStr.length > 0) {
                [self setValue:valueStr forKey:memberNameStr];
            }
        }else if ([value isKindOfClass:[NSNumber class]])  {
            NSNumber *number = (NSNumber *)value;
            if (number != nil && number > 0) {
                [self setValue:number forKey:memberNameStr];
            }
        }
        

    }
    
}



+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userID" : @"id"};
}



@end
