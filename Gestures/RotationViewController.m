//
//  RotationViewController.m
//  Gestures
//
//  Created by Alex Lee on 2017-06-08.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - width/2, width, width);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateHandle:)];
    
    [view addGestureRecognizer:rotateGesture];
}

- (void)rotateHandle:(UIRotationGestureRecognizer *)sender;
{
    [sender.view setTransform:CGAffineTransformMakeRotation(sender.rotation)];
}


@end
