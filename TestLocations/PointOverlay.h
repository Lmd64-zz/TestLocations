//
//  MKCircle+Point.h
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface PointOverlay : MKCircle
@end

@interface PointOverlayView : MKCircleView
- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color;
@end

//@interface MKOverlayPointRenderer : MKCircleRenderer
//- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color;
//@end
