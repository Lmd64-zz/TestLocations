//
//  ViewController.h
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapPinAnnotation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
- (IBAction)startButtonTapped:(id)sender;
- (IBAction)endButtonTapped:(id)sender;
- (IBAction)playRouteButtonTapped:(id)sender;

@end
