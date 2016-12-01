//
//  ShortcutView.m
//  Low Battery Yup.d
//
//  Created by TW on 12/1/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "ShortcutView.h"
#import "Constants.h"

@implementation ShortcutView

- (void)setShortcutValue:(MASShortcut *)shortcutValue
{
	[super setShortcutValue:shortcutValue];

	NSDictionary *shortcut = [NSDictionary dictionaryWithObjectsAndKeys:
		[NSNumber numberWithInteger:[shortcutValue keyCode]], @"keyCode",
		[NSNumber numberWithInteger:[shortcutValue modifierFlags]], @"modifierFlags",
		nil];

	[[NSUserDefaults standardUserDefaults] setObject:shortcut forKey:kPreferenceGlobalShortcut];
}

@end
