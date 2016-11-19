//
//  AppDelegate.h
//  Low Battery Yup.d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

- (void)dismissLowBatteryWarning:(NSEvent *)hotKeyEvent;

@end
