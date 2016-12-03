//
//  ShortcutView.m
//  Low Battery Yup.d
//
//  Created by Teddy Wing on 12/1/16.
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
