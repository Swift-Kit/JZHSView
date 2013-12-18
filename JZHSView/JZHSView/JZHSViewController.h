//
//  JZHSViewController.h
//  JZHSView
//
//  Created by z on 12/17/13.
//  Copyright (c) 2013 joeyzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>

@interface JZHSViewController : UIViewController {
    AVAudioPlayer *myAudioPlayer;
}
@property (nonatomic, retain) AVAudioPlayer *myAudioPlayer;

@end
