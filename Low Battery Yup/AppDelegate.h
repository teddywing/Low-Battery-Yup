//
//  AppDelegate.h
//  Low Battery Yup
//
//  Created by Teddy Wing on 11/16/16.
//  Copyright (c) 2016 Teddy Wing. All rights reserved.
//
//  This file is part of Low Battery Yup.
//
//  Low Battery Yup is free software: you can redistribute it and/or
//  modify it under the terms of the GNU General Public License as
//  published by the Free Software Foundation, either version 3 of the
//  License, or (at your option) any later version.
//
//  Low Battery Yup  is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
//  General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Low Battery Yup. If not, see
//  <http://www.gnu.org/licenses/>.
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
