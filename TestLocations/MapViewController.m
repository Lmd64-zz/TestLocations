//
//  ViewController.m
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import "MapViewController.h"
#import "CircleOverlay.h"
#import "PointOverlay.h"

@interface MapViewController (){
    MKCoordinateSpan viewSpan;
    CLLocationCoordinate2D startCoordinate;
    CLLocationCoordinate2D centerCoordinate;
    CLLocationCoordinate2D endCoordinate;
}
@property (nonatomic,strong) CircleOverlay *circle;
@end

@implementation MapViewController

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    viewSpan = MKCoordinateSpanMake(0.002,0.002);
    startCoordinate = CLLocationCoordinate2DMake(53.341193,-6.263143);
    centerCoordinate = CLLocationCoordinate2DMake(53.340948,-6.262550);
    endCoordinate =   CLLocationCoordinate2DMake(53.340908,-6.261921);
    
    [self.mapview setDelegate:self];
    [self.mapview setShowsUserLocation:YES];
    [self.mapview setUserTrackingMode:MKUserTrackingModeNone];
    [self.mapview setRegion:MKCoordinateRegionMake(startCoordinate, viewSpan)];
    
    MapPinAnnotation *startAnnotation = [[MapPinAnnotation alloc] initWithCoordinates:startCoordinate placeName:@"Start" description:@"Start location"];
    [self.mapview addAnnotation:startAnnotation];
    
    MapPinAnnotation *endAnnotation = [[MapPinAnnotation alloc] initWithCoordinates:endCoordinate placeName:@"End" description:@"End location"];
    [self.mapview addAnnotation:endAnnotation];
    
    self.circle = (CircleOverlay*)[CircleOverlay circleWithCenterCoordinate:centerCoordinate radius:20];
    [self.mapview addOverlay:(id<MKOverlay>)self.circle level:MKOverlayLevelAboveRoads];
    
    PointOverlay *point = (PointOverlay*)[PointOverlay circleWithCenterCoordinate:centerCoordinate radius:4];
    [self.mapview addOverlay:(id<MKOverlay>)point level:MKOverlayLevelAboveLabels];
    
}

- (IBAction)startButtonTapped:(id)sender {
    [self.mapview setRegion:MKCoordinateRegionMake(startCoordinate, viewSpan)];
    [self.mapview setCenterCoordinate:startCoordinate animated:YES];
}

- (IBAction)endButtonTapped:(id)sender {
    [self.mapview setRegion:MKCoordinateRegionMake(endCoordinate, viewSpan)];
    [self.mapview setCenterCoordinate:endCoordinate animated:YES];
}

- (IBAction)playRouteButtonTapped:(id)sender {
    
}

- (MKOverlayView *)mapView:(MKMapView *)map viewForOverlay:(id <MKOverlay>)overlay{
    UIColor *color = [UIColor colorWithHue:198.0/360.0 saturation:0.34 brightness:0.84 alpha:1.0];
    if ([overlay isKindOfClass:[CircleOverlay class]]){
        CircleOverlayView *view = [[CircleOverlayView alloc] initWithOverlay:overlay andColor:color];
        return view;
        
    } else if ([overlay isKindOfClass:[PointOverlay class]]){
        PointOverlayView *view = [[PointOverlayView alloc] initWithOverlay:overlay andColor:color];
        return view;
        
    }
    return nil;
}
//- (MKOverlayView *)mapView:(MKMapView *)map viewForAnnotation:(id<MKAnnotation>)annotation{
//    UIColor *color = [UIColor colorWithHue:198.0/360.0 saturation:0.34 brightness:0.84 alpha:1.0];
//    if ([annotation isKindOfClass:[CircleOverlay class]]){
//        CircleOverlayView *view = [[CircleOverlayView alloc] initWithOverlay:overlay andColor:color];
//        return view;
//        
//    } else if ([overlay isKindOfClass:[PointOverlay class]]){
//        PointOverlayView *view = [[PointOverlayView alloc] initWithOverlay:overlay andColor:color];
//        return view;
//        
//    }
//    return nil;
//}
//- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
//    UIColor *color = [UIColor colorWithHue:198.0/360.0 saturation:0.34 brightness:0.84 alpha:1.0];
//    if ([overlay isKindOfClass:[MKCircleCircle class]]){
//        MKOverlayCircleRenderer *renderer = [[MKOverlayCircleRenderer alloc] initWithOverlay:overlay andColor:color];
//        return renderer;
//
//    } else if ([overlay isKindOfClass:[MKCirclePoint class]]){
//        MKOverlayPointRenderer *renderer = [[MKOverlayPointRenderer alloc] initWithOverlay:overlay andColor:color];
//        return renderer;
//    }
//    
//    return nil;
//}

@end
