//
//  PlanAccesVC.h
//  CINOV
//
//  Created by Jean Pierron on 4/19/13.
//  Copyright (c) 2013 Jean Pierron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PlanAccesVC : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation *cinovPoint;

@end
