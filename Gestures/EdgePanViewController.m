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
    
    CGFloat width = self.view.bounds.size.width;
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
        if(sender.view.frame.origin.x >= self.view.frame.size.width * 0.70) {
            CGPoint translation = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translation.x,oldCenter.y);
            sender.view.center = newCenter;
            
            [sender setTranslation:CGPointZero inView:self.view];
            
        } else {
            
            self.panGesture.enabled = YES;
            self.edgeGesture.enabled = NO;
            self.visible = YES;
            CGRect frame = sender.view.frame;
            frame.origin.x = CGRectGetMidX(self.view.frame);
            [UIView animateWithDuration:0.1
                                  delay:0.0
                                options:0
                             animations:^(void){sender.view.frame = frame;}
                             completion:nil];
            
        }
    }
}

- (void)panhandler:(UIPanGestureRecognizer *)sender;
{
    if (self.visible) {
        if (sender.view.frame.origin.x >= self.view.frame.size.width * 0.70) {
            CGFloat height = sender.view.frame.size.height;
            CGFloat width = sender.view.frame.size.width;
            CGRect frame = CGRectMake(self.view.frame.size.width - 10, CGRectGetMidY(self.view.bounds) - height/2, width, height);
            [UIView animateWithDuration:0.1
                                  delay:0.0
                                options:0
                             animations:^(void){sender.view.frame = frame;}
                             completion:nil];
            self.panGesture.enabled = NO;
            self.edgeGesture.enabled = YES;
            self.visible = NO;
        } else {
            CGPoint translation = [sender translationInView:self.view];
            CGPoint oldCenter = sender.view.center;
            CGPoint newCenter = CGPointMake(oldCenter.x + translation.x,oldCenter.y);
            sender.view.center = newCenter;
            
            [sender setTranslation:CGPointZero inView:self.view];
        }
    }
}

@end
