//
//  PlanAccesVC.m
//  CINOV
//
//  Created by Jean Pierron on 4/19/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import "PlanAccesVC.h"
#define METERS_PER_MILE 1609.344
#define _HEIGHT_ ((int)([[UIScreen mainScreen] bounds].size.height))

@interface PlanAccesVC ()

@end

@implementation PlanAccesVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 45.7853473;
    zoomLocation.longitude= 4.8545194;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    self.cinovPoint = [[MKPointAnnotation alloc] init];
    self.cinovPoint.coordinate = zoomLocation;
    self.cinovPoint.title = @"Cité Internationale";
    self.cinovPoint.subtitle = @"site du congrès CINOV 2013";
	[self.mapView addAnnotation:self.cinovPoint];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
    [_mapView setUserTrackingMode:true];
    UIColor *background;
    switch (_HEIGHT_)
    {
        case 480:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2@2x.png"]];
        case 568:
            background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background2-568h@2x.png"]];
    }
    self.view.backgroundColor = background;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    MKPointAnnotation *newPoint = view.annotation;
	NSString *url=[NSString stringWithFormat:@"http://maps.google.com/maps?daddr=%f,%f&saddr=%f,%f",
					newPoint.coordinate.latitude,
					newPoint.coordinate.longitude,
					mapView.userLocation.location.coordinate.latitude,
					mapView.userLocation.location.coordinate.longitude];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	
}
@end
