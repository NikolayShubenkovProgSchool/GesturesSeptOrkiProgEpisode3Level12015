//
//  ViewController.m
//  GesturesSeptOrkiProgEpisode3Level12015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *experimentalView;

@property (nonatomic) float redComponent;
@property (nonatomic) float greenComponent;
@property (nonatomic) float blueComponent;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width;


@end

@implementation ViewController

- (IBAction)redComponentChanged:(UIPanGestureRecognizer *)sender {
    
    CGPoint translation = [sender translationInView:sender.view];
    NSLog(@"translation %@",NSStringFromCGPoint(translation));
    
    
    if (sender.state == UIGestureRecognizerStateBegan ||
        sender.state == UIGestureRecognizerStateChanged){
        
        self.redComponent -= translation.y / 100;
        [sender setTranslation:CGPointMake(0, 0)
                        inView:sender.view];
        
        [self updateView];
    }
}

- (IBAction)rotateView:(UIRotationGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan ||
        sender.state == UIGestureRecognizerStateChanged){
        
        float rotation = sender.rotation;
        
        CGAffineTransform transform = self.experimentalView.transform;
        
        transform = CGAffineTransformRotate(transform, rotation);
        NSLog(@"%@",NSStringFromCGAffineTransform(transform));
        self.experimentalView.transform = transform;
        
        sender.rotation = 0;
    }
}


- (IBAction)zoomView:(UIPinchGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan ||
        sender.state == UIGestureRecognizerStateChanged){
        
        float scale = sender.scale;
        self.width.constant = self.width.constant * scale;
        
        //
        sender.scale = 1;
    }
}

- (void)updateView {
    UIColor *color = [UIColor colorWithRed:self.redComponent green:self.greenComponent blue:self.blueComponent alpha:1];
    self.experimentalView.backgroundColor = color;
}

@end
