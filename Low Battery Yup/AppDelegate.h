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
#import "DaemonLauncher.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSWindow *window;
	IBOutlet ShortcutView *_shortcut_view;
	IBOutlet NSButton *_start_at_login;
	IBOutlet NSButton *_launch_app;

	LaunchAgentManager *_launchagent;
	DaemonLauncher *_daemon_launcher;
}

- (void)initializeShortcutView;
- (IBAction)performStartAtLogin:(id)sender;
- (IBAction)launchOrQuitDaemon:(id)sender;

@end
