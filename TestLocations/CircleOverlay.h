//
//  MKCircle+Circle.h
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CircleOverlay : MKCircle
@end

@interface CircleOverlayView : MKCircleView
@property (nonatomic,strong) UIView *backgroundView;
- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color;
@end

//@interface MKOverlayCircleRenderer : MKCircleRenderer
//- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color;
//- (void)startAnimating;
//@end
