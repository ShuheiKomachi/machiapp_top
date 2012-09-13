//
//  mapViewController.h
//  machiapp_top
//
//  Created by techcamp on 12/09/12.
//  Copyright (c) 2012年 techcamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface mapViewController : UIViewController
<CLLocationManagerDelegate> {
    CLLocationManager *lm;
}


@end
