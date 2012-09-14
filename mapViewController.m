//
//  mapViewController.m
//  machiapp_top
//
//  Created by techcamp on 12/09/13.
//  Copyright (c) 2012年 techcamp. All rights reserved.

#import "mapViewController.h"

@interface mapViewController ()

@end

@implementation mapViewController
@synthesize createmap;

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
    
    MKCoordinateRegion region = self.createmap.region;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;
    [self.createmap setRegion:region animated:YES];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    
    
    }

- (void)locationManager:(CLLocationManager *)manager
    didUpdatetolocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    
    
    CLLocationCoordinate2D coordinate;
    coordinate = newLocation.coordinate;
    
    MKCoordinateRegion region = createmap.region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude = newLocation.coordinate.longitude;
    region.span.latitudeDelta = 0.01;
    region.span.longitudeDelta = 0.01;

    [createmap setRegion:region animated:YES];
    [self.createmap setCenterCoordinate:newLocation.coordinate animated:YES];
    
}

- (void)viewDidUnload
{
    [self setCreatemap:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
