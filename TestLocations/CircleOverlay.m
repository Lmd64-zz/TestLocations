//
//  MKCircle+Circle.m
//  TestLocations
//
//  Created by Liam Dunne on 28/10/2013.
//  Copyright (c) 2013 Liam Dunne. All rights reserved.
//

#import "CircleOverlay.h"

#define MAX_RATIO 1.1
#define MIN_RATIO 0.9
#define MAX_OPACITY 0.666
#define MIN_OPACITY 0.333
#define ANIMATION_DURATION 1.0
#define ANIMATION_REPEAT HUGE_VALF

@implementation CircleOverlay
@end

@implementation CircleOverlayView
- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color{
    self = [super initWithOverlay:overlay];
    if (self) {
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self.backgroundView setBackgroundColor:color];
        [self.backgroundView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.backgroundView.layer setMasksToBounds:YES];
        [self addSubview:self.backgroundView];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[background]|" options:0 metrics:nil views:@{@"background":self.backgroundView}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[background]|" options:0 metrics:nil views:@{@"background":self.backgroundView}]];
        [self start];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.backgroundView.layer setCornerRadius:CGRectGetWidth(self.frame)/2.0];
}

- (void)removeExistingAnimation{
    [self.layer removeAllAnimations];
}

- (void)stop{
    [self removeExistingAnimation];
}
- (void)start{
    
    [self removeExistingAnimation];

    //opacity animation setup
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = ANIMATION_DURATION;
    opacityAnimation.repeatCount = ANIMATION_REPEAT;
    //opacityAnimation.autoreverses = YES;
    opacityAnimation.fromValue = [NSNumber numberWithFloat:MAX_OPACITY];
    opacityAnimation.toValue = [NSNumber numberWithFloat:MIN_OPACITY];
    
    //resize animation setup
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    transformAnimation.duration = ANIMATION_DURATION;
    transformAnimation.repeatCount = ANIMATION_REPEAT;
    //transformAnimation.autoreverses=YES;
    transformAnimation.fromValue = [NSNumber numberWithFloat:MIN_RATIO];
    transformAnimation.toValue = [NSNumber numberWithFloat:MAX_RATIO];
    
    
    //group the two animation
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    group.repeatCount = ANIMATION_REPEAT;
    [group setAnimations:@[opacityAnimation, transformAnimation]];
    group.duration = ANIMATION_DURATION;
    
    //apply the grouped animation
    [self.backgroundView.layer addAnimation:group forKey:@"groupAnimation"];
}

@end

//@implementation MKOverlayCircleRenderer
//- (id)initWithOverlay:(id<MKOverlay>)overlay andColor:(UIColor*)color{
//    self = [super initWithOverlay:overlay];
//    if (self) {
//        self.fillColor = [color colorWithAlphaComponent:0.5];
//        double delayInSeconds = 2.0;
//        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//            [self startAnimating];
//        });
//    }
//    return self;
//}
////- (void)startAnimating{
////    UIColor *fillColor = self.fillColor;
////
////    [UIView animateWithDuration:0.5 delay:0.0 options:(UIViewAnimationOptionRepeat|UIViewAnimationOptionAllowUserInteraction)
////                     animations:^{
////                         self.fillColor = [self.fillColor colorWithAlphaComponent:0.1];
////                         NSLog(@"%@",self.fillColor);
////                     } completion:nil];
////    
////    //opacity animation setup
////    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
////    opacityAnimation.duration = ANIMATION_DURATION;
////    opacityAnimation.repeatCount = ANIMATION_REPEAT;
////    opacityAnimation.fromValue = self.fillColor;
////    opacityAnimation.toValue = [self.fillColor colorWithAlphaComponent:0.5];
////
////////    //resize animation setup
////////    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
////////    transformAnimation.duration = ANIMATION_DURATION;
////////    transformAnimation.repeatCount = ANIMATION_REPEAT;
////////    //transformAnimation.autoreverses=YES;
////////    transformAnimation.fromValue = [NSNumber numberWithFloat:MIN_RATIO];
////////    transformAnimation.toValue = [NSNumber numberWithFloat:MAX_RATIO];
//////
//////    
//////    //group the two animation
//////    CAAnimationGroup *group = [CAAnimationGroup animation];
//////    
//////    group.repeatCount = ANIMATION_REPEAT;
////////    [group setAnimations:[NSArray arrayWithObjects:opacityAnimation, transformAnimation, nil]];
//////    [group setAnimations:[NSArray arrayWithObjects:opacityAnimation, nil]];
//////    group.duration = ANIMATION_DURATION;
//////    
//////    //apply the grouped animation
////    [self addAnimation:group forKey:@"groupAnimation"];
////}
//
//@end

