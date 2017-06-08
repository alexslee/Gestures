//
//  SwipeViewController.m
//  Gestures
//
//  Created by Alex Lee on 2017-06-08.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic)BOOL swiped;

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.swiped = NO;
    
    CGFloat width = self.view.bounds.size.width - 10;
    CGFloat height = 30;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *brownView = [[UIView alloc] initWithFrame:frame];
    brownView.backgroundColor = [UIColor brownColor];
    brownView.clipsToBounds = YES;
    
    [self.view addSubview:brownView];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    [brownView addSubview:whiteView];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    [brownView addGestureRecognizer:swipeLeftGesture];
    [brownView addGestureRecognizer:swipeRightGesture];
    
    [brownView bringSubviewToFront:whiteView];
    
}

- (void)swipeHandle:(UISwipeGestureRecognizer *)sender;
{
    //separate animations for right and left
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        CGRect newFrame = CGRectMake(sender.view.frame.origin.x + 50, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:0
                         animations:^(void){sender.view.frame = newFrame;}
                         completion:nil];
        
    } else {
        CGRect newFrame = CGRectMake(sender.view.frame.origin.x - 50, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);
        
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:0
                         animations:^(void){sender.view.frame = newFrame;}
                         completion:nil];
        
    }
}

@end
