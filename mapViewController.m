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
    
    createmap = [[MKMapView alloc] init];
    createmap.frame = self.view.bounds;
    createmap.mapType = MKMapTypeStandard;
    createmap.showsUserLocation = YES;
    [self.view addSubview:createmap];
    [createmap.userLocation addObserver:self
                            forKeyPath:@"location"
                               options:0
                               context:NULL];
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    // 地図の中心座標に現在地を設定
    createmap.centerCoordinate = createmap.userLocation.location.coordinate;
    
    // 表示倍率の設定
    MKCoordinateSpan span = MKCoordinateSpanMake(0.0005, 0.0005);
    MKCoordinateRegion region = MKCoordinateRegionMake(createmap.userLocation.coordinate, span);
    [createmap setRegion:region animated:YES];
    
    // 一度しか更新しない場合はremoveする必要がある
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
