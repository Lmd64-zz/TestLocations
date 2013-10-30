//
//  MapPinAnnotation.m
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import "MapPinAnnotation.h"

@implementation MapPinAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
- (id)initWithCoordinates:(CLLocationCoordinate2D)location placeName:(NSString *)placeName description:(NSString *)description;{
    self = [super init];
    if (self)
    {
        coordinate = location;
        title = placeName;
        subtitle = description;
    }
    
    return self;
}
@end

