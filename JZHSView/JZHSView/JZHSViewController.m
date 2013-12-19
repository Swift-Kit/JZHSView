//
//  JZHSViewController.m
//  JZHSView
//
//  Created by z on 12/17/13.
//  Copyright (c) 2013 joeyzhou. All rights reserved.
//

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

@end

@implementation JZHSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //start a background sound
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"HarlemShake" ofType: @"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    myAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    myAudioPlayer.numberOfLoops = 1;
    
    
    [self startMusic:self];
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
    NSLog(@"Pause music");
    [myAudioPlayer stop];
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
    [self rotateLabel:self.label9 withMagnitude:9 withDuration:0.33 withAngle:180];
    [self rotateLabel:self.label10 withMagnitude:2 withDuration:0.3 withAngle:-270];
    
}

- (void) shakeTitleLabel: (UILabel *)labelToShake
           withMagnitude: (CGFloat) t
            withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    labelToShake.transform = translateLeft;
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:30.67/d];
        labelToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                labelToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}

- (void) shakeLabel: (UILabel *)labelToShake
      withMagnitude: (CGFloat) t
       withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    labelToShake.transform = translateLeft;
    
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d];
        labelToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                labelToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
    
}

- (void) bounceLabel: (UILabel *)labelToShake
       withMagnitude: (CGFloat) t
        withDuration: (NSTimeInterval) d
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    
    labelToShake.transform = translateUp;
    
    [UIView animateWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d];
        labelToShake.transform = translateDown;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                labelToShake.transform = CGAffineTransformIdentity;
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
        [UIView setAnimationRepeatCount:15.87/d];
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
        [UIView setAnimationRepeatCount:15.87/d];
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
        [UIView setAnimationRepeatCount:15.87/d];
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
        
    CGAffineTransform rotateLeft = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
    CGAffineTransform rotateRight = CGAffineTransformRotate(CGAffineTransformIdentity, 0-angle);
    label.transform = rotateLeft;
    [UIView animateKeyframesWithDuration:d delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:15.87/d];
        label.transform = rotateRight;
    }completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                label.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void)shakeView:(UIView *)viewToShake
{
    CGFloat t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}
@end
