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

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSDictionary *saved_shortcut;
	if ((saved_shortcut = [[NSUserDefaults standardUserDefaults] objectForKey:kPreferenceGlobalShortcut])) {
		MASShortcut *shortcut = [MASShortcut
			shortcutWithKeyCode:[[saved_shortcut objectForKey:@"keyCode"] unsignedIntegerValue]
			modifierFlags:[[saved_shortcut objectForKey:@"modifierFlags"] unsignedIntegerValue]];

		[_shortcut_view setShortcutValue:shortcut];
	}
}

@end
