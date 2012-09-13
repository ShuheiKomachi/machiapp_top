//
//  mapViewController.m
//  machiapp_top
//
//  Created by techcamp on 12/09/12.
//  Copyright (c) 2012年 techcamp. All rights reserved.
//

#import "mapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface mapViewController ()

@end

@implementation mapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    lm = [[CLLocationManager alloc] init];
    if ([lm locationServicesEnabled]) {
        lm.delegate = self;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
        lm.distanceFilter = 1000.0f;
        [lm startUpdatingLocation];
    }
   
}


- (void) locationManager: (CLLocationManager *) manager
     didUpdateToLocation: (CLLocation *) newLocation
            fromLocation: (CLLocation *) oldLocation{
    NSString *lat = [[NSString alloc] initWithFormat:@"%g",
                     newLocation.coordinate.latitude];
    
    NSString *lng = [[NSString alloc] initWithFormat:@"%g",
                     newLocation.coordinate.longitude];
  
    NSString *acc = [[NSString alloc] initWithFormat:@"%g",
                     newLocation.horizontalAccuracy];
   
    
    //[acc release];
    //[lat release];
    //[lng release];
    MKCoordinateSpan span;
    span.latitudeDelta=.005;
    span.longitudeDelta=.005;
    
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
    region.span=span;
}

- (void) locationManager: (CLLocationManager *) manager
        didFailWithError: (NSError *) error {
   
    NSString *msg = @"Error obtaining location";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error"
                          message:msg
                          delegate:nil
                          cancelButtonTitle: @"Done"
                          otherButtonTitles:nil];
    [alert show];
   // [msg release];
   // [alert release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
