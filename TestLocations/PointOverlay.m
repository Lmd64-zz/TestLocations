//
//  MKCircle+Point.m
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import "PointOverlay.h"

@implementation PointOverlay
@end

@implementation PointOverlayView
- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color{
    self = [super initWithOverlay:overlay];
    if (self) {
        self.strokeColor = [UIColor whiteColor];
        self.fillColor = color;
        self.lineWidth = 5.0;
    }
    return self;
}
@end

//@implementation MKOverlayPointRenderer
//- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color{
//    self = [super initWithOverlay:overlay];
//    if (self) {
//        self.strokeColor = [UIColor whiteColor];
//        self.fillColor = color;
//        self.lineWidth = 3.0;
//    }
//    return self;
//}
//@end
