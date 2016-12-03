//
//  AppDelegate.m
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

#import "AppDelegate.h"
#import "Constants.h"

@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        _launchagent = [[LaunchAgentManager alloc] init];
		_daemon_launcher = [[DaemonLauncher alloc] init];
    }
    return self;
}

- (void)dealloc
{
	[_launchagent release];
	[_daemon_launcher release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self initializeShortcutView];
	[self performStartAtLogin:self];
	[_launch_app setState:[_daemon_launcher isRunning]];
}

- (void)initializeShortcutView
{
	NSDictionary *saved_shortcut;
	if ((saved_shortcut = [[NSUserDefaults standardUserDefaults] objectForKey:kPreferenceGlobalShortcut])) {
		MASShortcut *shortcut = [MASShortcut
			shortcutWithKeyCode:[[saved_shortcut objectForKey:@"keyCode"] unsignedIntegerValue]
			modifierFlags:[[saved_shortcut objectForKey:@"modifierFlags"] unsignedIntegerValue]];

		[_shortcut_view setShortcutValue:shortcut];
	}
}

- (IBAction)performStartAtLogin:(id)sender
{
	if ([_start_at_login state] == NSOnState) {
		[_launchagent install];
	}
	else {
		[_launchagent uninstall];
	}
}

- (IBAction)launchOrQuitDaemon:(id)sender
{
	if ([_launch_app state]) {
		[_daemon_launcher launch];
	}
	else {
		[_daemon_launcher quit];
	}
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
	return YES;
}

@end
