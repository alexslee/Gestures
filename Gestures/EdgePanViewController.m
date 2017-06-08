//
//  EdgePanViewController.m
//  Gestures
//
//  Created by Alex Lee on 2017-06-08.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "EdgePanViewController.h"

@interface EdgePanViewController ()

@property (nonatomic) BOOL visible;
@property (strong,nonatomic) UIScreenEdgePanGestureRecognizer *edgeGesture;
@property (strong,nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation EdgePanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = self.view.bounds.size.width / 3 * 2;
    CGFloat height = self.view.bounds.size.height / 2;
    CGRect frame = CGRectMake(self.view.frame.size.width - 10, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    self.visible = NO;
    
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanHandle:)];
    edgePanGesture.edges = UIRectEdgeRight;
    [view addGestureRecognizer:edgePanGesture];
    self.edgeGesture = edgePanGesture;
    
    UIPanGestureRecognizer *regularPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panhandler:)];
    regularPan.enabled = NO;
    [view addGestureRecognizer:regularPan];
    self.panGesture = regularPan;
    
    
}

- (void)edgePanHandle:(UIScreenEdgePanGestureRecognizer *)sender;
{
    if (!self.visible) {
        if(sender.view.frame.origin.x <= self.view.frame.size.width * 0.66) {
            CGPoint translation = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translation.x,oldCenter.y);
            sender.view.center = newCenter;
            
            [sender setTranslation:CGPointZero inView:self.view];
            
        } else {
//            NSLog(@"nah over here");
            self.panGesture.enabled = YES;
            self.edgeGesture.enabled = NO;
            self.visible = YES;
            CGRect frame = sender.view.frame;
            frame.origin.x = CGRectGetMidX(self.view.frame);
            sender.view.frame = frame;
        }
    }
}

- (void)panhandler:(UIPanGestureRecognizer *)sender;
{
    if (self.visible) {
        if (sender.view.frame.origin.x >= self.view.frame.size.width * 0.75) {
//            NSLog(@"why over here");
            CGFloat height = sender.view.frame.size.height;
            CGFloat width = sender.view.frame.size.width;
            CGRect frame = CGRectMake(self.view.frame.size.width - 10, CGRectGetMidY(self.view.bounds) - height/2, width, height);
            frame.origin.x = self.view.frame.size.width-10;
            self.panGesture.enabled = NO;
            self.edgeGesture.enabled = YES;
            self.visible = NO;
        } else {
//            NSLog(@"why tho over here");
            CGPoint translation = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translation.x,oldCenter.y);
            sender.view.center = newCenter;
            
            [sender setTranslation:CGPointZero inView:self.view];
        }
    }
}

@end
