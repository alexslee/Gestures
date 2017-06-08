//
//  TapViewController.m
//  Gestures
//
//  Created by Alex Lee on 2017-06-08.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad;
{
    CGFloat width = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - width/2, width, width);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    
    view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    
    [view addGestureRecognizer:tapGesture];
}

- (void)tapHandler:(UITapGestureRecognizer *)sender;
{
    sender.view.backgroundColor = ([sender.view.backgroundColor isEqual:[UIColor purpleColor]]) ? [UIColor orangeColor] : [UIColor purpleColor];
}

@end
