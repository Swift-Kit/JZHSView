//
//  JZHSViewController.m
//  JZHSView
//
//  Created by z on 12/17/13.
//  Copyright (c) 2013 joeyzhou. All rights reserved.
//

#import "JZHSViewController.h"
@interface JZHSViewController ()

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
@end
