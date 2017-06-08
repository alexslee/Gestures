//
//  PanViewController.m
//  Gestures
//
//  Created by Alex Lee on 2017-06-08.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {
    
    CGPoint translation = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    
    CGPoint newCenter = CGPointMake(oldCenter.x + translation.x,oldCenter.y + translation.y);
    
    sender.view.center = newCenter;
    
    [sender setTranslation:CGPointZero inView:self.view];
}


@end
