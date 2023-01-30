//
//  MapManager.m
//  BaseProject
//
//  Created by dongchao on 2022/5/24.
//

#import "MapManager.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapManager ()

@property (nonatomic, strong)CLGeocoder *geocoder;

@end

@implementation MapManager

+ (MapManager *)sharedInstance{
    static MapManager *_mapManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mapManager = [[self alloc] init];
    });
    return _mapManager;
}


- (CLGeocoder *)geocoder{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}

- (void)openMapWithLocation:(NSString *)address{
    
    if (!address) {
        address = @"中国北京市大兴区宏达中路与运成街交叉口东南100米";
    }
    
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error != nil) {
            return;
        }
        
        CLPlacemark *placemark = placemarks.lastObject;
        MKPlacemark *pmk = [[MKPlacemark alloc]initWithPlacemark:placemark];
        MKMapItem * currentItem = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *item = [[MKMapItem alloc]initWithPlacemark:pmk];

        NSDictionary * dict = @{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsMapTypeKey:
        @(MKMapTypeHybrid),MKLaunchOptionsShowsTrafficKey:@(YES)};

        [MKMapItem openMapsWithItems:@[currentItem,item] launchOptions:dict];
        
//        CLPlacemark *placemark = placemarks.lastObject;
//        CLLocation *location = placemark.location;
//        CLLocationCoordinate2D center = location.coordinate;

    }];
}

@end
