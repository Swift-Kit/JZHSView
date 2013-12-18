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
    [self shakeLabel:self.titleLabel];
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
{
    CGFloat t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    labelToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.5x delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:20.0];
        labelToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                labelToShake.transform = CGAffineTransformIdentity;
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
