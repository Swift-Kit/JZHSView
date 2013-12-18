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
    [self shakeLabel:self.titleLabel withMagnitude: 3];
    [self bounceLabel:self.label1 withMagnitude:5];
    [self zoomLabel:self.label2 withMagnitude:2];
    [self bounceLabel:self.label3 withMagnitude:7];
    [self shakeLabel:self.label4 withMagnitude:4];
    [self bounceLabel:self.label5 withMagnitude:3];
    [self shakeLabel:self.label6 withMagnitude:7];


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

- (void) shakeLabel: (UILabel *)labelToShake
      withMagnitude: (CGFloat) t
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    labelToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:20.0];
        labelToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                labelToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];

}

- (void) bounceLabel: (UILabel *)labelToShake
withMagnitude: (CGFloat) t
{
    if(!t)
        t = 2.0;
    CGAffineTransform translateUp  = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, t);
    CGAffineTransform translateDown = CGAffineTransformTranslate(CGAffineTransformIdentity, 0.0, -t);
    
    labelToShake.transform = translateUp;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:20.0];
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
{
    if(!t)
        t= 2.0;
    CGAffineTransform zoomOut = CGAffineTransformScale(CGAffineTransformIdentity, t, t);
    CGAffineTransform zoomIn = CGAffineTransformScale(CGAffineTransformIdentity, 1/t, 1/t);
    label.transform = zoomOut;
    
    [UIView animateKeyframesWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAutoreverse| UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:20.0];
        label.transform = zoomIn;
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
