//
//  AppDelegate.h
//  Low Battery Yup
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShortcutView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSWindow *window;
	IBOutlet ShortcutView *_shortcut_view;
}

@end
