//
//  JZHSAppDelegate.h
//  JZHSView
//
//  Created by z on 12/17/13.
//  Copyright (c) 2013 joeyzhou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include <AudioToolbox/AudioToolbox.h>

@interface JZHSAppDelegate : UIResponder <UIApplicationDelegate>{
    AVAudioPlayer *myAudioPlayer;
}
@property (nonatomic, retain) AVAudioPlayer *myAudioPlayer;

@property (strong, nonatomic) UIWindow *window;

@end
