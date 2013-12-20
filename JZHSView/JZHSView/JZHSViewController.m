//
//  JZHSViewController.m
//  JZHSView
//
//  Created by z on 12/17/13.
//  Copyright (c) 2013 joeyzhou. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "JZHSViewController.h"
@interface JZHSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;
@property (weak, nonatomic) IBOutlet UILabel *label10;
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;

@end

@implementation JZHSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //start a background sound
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"HarlemShake" ofType: @"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    myAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    myAudioPlayer.numberOfLoops = 0;
    
    
    [self startMusic:self];
    //    [self zoomView:self.view];
    [self shakeTitleLabel:self.titleLabel withMagnitude: 5 withDuration:0.4];
    
    //    [self randomLabel:self.titleLabel];
    
    double delayInSeconds = 14.8;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self everybodyHarlemShake];
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pauseMusic
{
    NSLog(@"JKJKJKJKJKK CANT STOP THE HARLEM SHAKE");
}

- (IBAction)startMusic:(id)sender
{
    NSLog(@"Start music");
    [myAudioPlayer play];
}

- (void) everybodyHarlemShake
{
    [self bounceLabel:self.label1 withMagnitude:5 withDuration:0.2];
    [self zoomLabel:self.label2 withMagnitude:2 withDuration:0.1];
    [self bounceLabel:self.label3 withMagnitude:7 withDuration:0.07];
    [self shakeLabel:self.label4 withMagnitude:4 withDuration:0.2];
    [self bounceLabel:self.label5 withMagnitude:3 withDuration:0.15];
    [self shakeLabel:self.label6 withMagnitude:7 withDuration:0.1];
    [self diagonalLabel2:self.label7 withMagnitude:9 withDuration:0.11];
    [self diagonalLabel:self.label8 withMagnitude:13 withDuration:0.22];
    [self rotateLabel:self.label9 withMagnitude:9 withDuration:0.33 withAngle:155];
    [self rotateLabel:self.label10 withMagnitude:2 withDuration:0.3 withAngle:-270];
    [self circleLabel:self.label11 withMagnitude:3 withDuration:0.3];
    
    //imageviews
    self.image1.hidden = false;
    self.image2.hidden = false;
    self.image3.hidden = false;
    self.image4.hidden = false;
    
    [self zoomView:self.image1 withMagnitude:0.55 withDuration:0.2];
    [self zoomView:self.image2 withMagnitude:1.2 withDuration:0.02];
    [self diagonalView:self.image3 withMagnitude:1.1 withDuration:0.29];
    [self bounceView:self.image4 withMagnitude:0.7 withDuration:0.1];
    
}

- (void) shakeTitleLabel: (UILabel *)label
           withMagnitude: (CGFloat) t
            withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    label.transform = translateLeft;
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:30.67/d/2];
        label.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}

- (void) shakeLabel: (UILabel *)label
      withMagnitude: (CGFloat) t
       withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    label.transform = translateLeft;
    
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}

- (void) bounceLabel: (UILabel *)label
       withMagnitude: (CGFloat) t
        withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    
    label.transform = translateUp;
    
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = translateDown;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}

- (void) zoomLabel: (UILabel *)label
     withMagnitude: (CGFloat) t
      withDuration: (NSTimeInterval) d
{
    if(!t)
        t= 2.0;
    CGAffineTransform zoomOut = CGAffineTransformScale(CGAffineTransformIdentity, t, t);
    CGAffineTransform zoomIn = CGAffineTransformScale(CGAffineTransformIdentity, 1/t, 1/t);
    label.transform = zoomOut;
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = zoomIn;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void) diagonalLabel: (UILabel *)label
         withMagnitude: (CGFloat) t
          withDuration: (NSTimeInterval) d
{
    if(!t)
        t= 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    CGAffineTransform random1 = CGAffineTransformConcat(translateRight, translateDown);
    CGAffineTransform random2 = CGAffineTransformConcat(translateLeft, translateUp);
    label.transform = random1;
    
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = random2;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void) diagonalLabel2: (UILabel *)label
          withMagnitude: (CGFloat) t
           withDuration: (NSTimeInterval) d
{
    if(!t)
        t= 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    CGAffineTransform random1 = CGAffineTransformConcat(translateRight, translateUp);
    CGAffineTransform random2 = CGAffineTransformConcat(translateLeft, translateDown);
    label.transform = random2;
    
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = random1;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}
- (void) rotateLabel: (UILabel *)label
       withMagnitude: (CGFloat) t
        withDuration: (NSTimeInterval) d
           withAngle: (CGFloat)angle
{
    if(!t)
        t= 2.0;
    angle = GLKMathDegreesToRadians(angle);
    CGAffineTransform rotateLeft = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
    CGAffineTransform rotateRight = CGAffineTransformRotate(CGAffineTransformIdentity, 0-angle);
    label.transform = rotateLeft;
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        label.transform = rotateRight;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void)circleLabel: (UILabel*) label
      withMagnitude: (CGFloat) t
       withDuration: (NSTimeInterval) d

{
    CAShapeLayer* circle = [[CAShapeLayer alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect textRect = CGRectMake(self.view.bounds.size.width/4, (self.view.bounds.size.height-self.view.bounds.size.width/2)/2, self.view.bounds.size.width/2, self.view.bounds.size.width/2);
    float midX = CGRectGetMidX(textRect);
    float midY = CGRectGetMidY(textRect);
    CGAffineTransform transform = CGAffineTransformConcat(
                                                          CGAffineTransformConcat(
                                                                                  CGAffineTransformMakeTranslation(-midX, -midY),
                                                                                  CGAffineTransformMakeRotation(-1.57079633/0.99)),
                                                          CGAffineTransformMakeTranslation(midX, midY));
    CGPathAddEllipseInRect(path, &transform, textRect);
    circle.path = path;
    //    circle.frame = self.view.bounds;
    //    circle.fillColor = [UIColor clearColor].CGColor;
    //    circle.strokeColor = [UIColor blackColor].CGColor;
    //    circle.lineWidth = 60.0f;
    //    [self.view.layer addSublayer:circle];
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 15.0f;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [circle addAnimation:animation forKey:@"strokeEnd"];
    
    label.transform = CGAffineTransformMakeRotation(1.57079633);
    [label sizeToFit];
    [self.view.layer addSublayer:label.layer];
    
    CAKeyframeAnimation* textAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    textAnimation.duration = 15.0f;
    textAnimation.path = path;
    textAnimation.rotationMode = kCAAnimationRotateAuto;
    textAnimation.calculationMode = kCAAnimationCubicPaced;
    textAnimation.removedOnCompletion = NO;
    [label.layer addAnimation:textAnimation forKey:@"position"];
}

- (void)zoomView:(UIView *)view
   withMagnitude: (CGFloat) t
    withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    if(!d)
        d=3.0;
    CGAffineTransform zoomOut = CGAffineTransformScale(CGAffineTransformIdentity, t, t);
    CGAffineTransform zoomIn = CGAffineTransformScale(CGAffineTransformIdentity, 1/t, 1/t);
    view.transform = zoomIn;
    
    [UIView animateWithDuration:d delay:0.0 options:
     UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
         [UIView setAnimationRepeatCount:15.87/d/2];
         view.transform = zoomOut;
     } completion:^(BOOL finished) {
         if (finished) {
             [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                 view.transform = CGAffineTransformIdentity;
             } completion:NULL];
         }
     }];
}

- (void) diagonalView: (UIView *)view
        withMagnitude: (CGFloat) t
         withDuration: (NSTimeInterval) d
{
    if(!t)
        t= 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    CGAffineTransform random1 = CGAffineTransformConcat(translateRight, translateUp);
    CGAffineTransform random2 = CGAffineTransformConcat(translateLeft, translateDown);
    view.transform = random2;
    
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        view.transform = random1;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                view.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void) bounceView: (UIView *)view
      withMagnitude: (CGFloat) t
       withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    
    view.transform = translateUp;
    
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d/2];
        view.transform = translateDown;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                view.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}
@end
