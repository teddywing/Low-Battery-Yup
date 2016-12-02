//
//  AppDelegate.m
//  Low Battery Yup
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"

@implementation AppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        _launchagent = [[LaunchAgentManager alloc] init];
    }
    return self;
}

- (void)dealloc
{
	[_launchagent release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[self initializeShortcutView];
	[self performStartAtLogin:self];
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

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
	return YES;
}

@end
