//
//  AppDelegate.h
//  Low Battery Yup
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MASShortcut/MASShortcut.h>
#import "ShortcutView.h"
#import "LaunchAgentManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSWindow *window;
	IBOutlet ShortcutView *_shortcut_view;
	IBOutlet NSButton *_start_at_login;

	LaunchAgentManager *_launchagent;
}

- (void)initializeShortcutView;
- (IBAction)performStartAtLogin:(id)sender;

@end
