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
{  createmap = [[MKMapView alloc] init];
       createmap.frame = self.view.bounds;
        createmap.mapType = MKMapTypeStandard;
        createmap.showsUserLocation = YES;
        [self.view addSubview:createmap];
        [createmap.userLocation addObserver:self
                                      forKeyPath:@"location"
                                         options:0
                                         context:NULL];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
createmap.centerCoordinate = createmap.userLocation.location.coordinate;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.0005, 0.0005);
    MKCoordinateRegion region = MKCoordinateRegionMake(createmap.userLocation.coordinate, span);
     [createmap setRegion:region animated:YES];
    [createmap.userLocation removeObserver:self forKeyPath:@"location"];
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
