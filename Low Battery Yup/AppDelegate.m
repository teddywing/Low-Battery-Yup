//
//  AppDelegate.m
//  Low Battery Yup
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "AppDelegate.h"

static NSString *const kPreferenceGlobalShortcut = @"GlobalShortcut";
static void *AppObservingContext = &AppObservingContext;

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	[_shortcut_view setAssociatedUserDefaultsKey:kPreferenceGlobalShortcut];

//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	[_shortcut_view bind:@"shortcutValue" toObject:defaults withKeyPath:@"thisisatest" options:nil];

//	[defaults addObserver:self forKeyPath:@"thisisatest" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:AppObservingContext];

//	[[MASShortcutBinder sharedBinder]
//		bindShortcutWithDefaultsKey:kPreferenceGlobalShortcut
//		toAction:^{NSLog(@"dudebro");}];
	
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	NSLog(@"OBSERVED");
	NSLog(@"%@", change);
}

- (IBAction)logDefaults:(id)sender
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSLog(@"%@", [defaults objectForKey:[@"values." stringByAppendingString:kPreferenceGlobalShortcut]]);
//	NSLog(@"%@", [defaults objectForKey:kPreferenceGlobalShortcut]);
//	NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
	
//	NSLog(@"%@", [_shortcut_view shortcutValue]);
//	NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"thisisatest"]);
//	[[NSUserDefaults standardUserDefaults] setObject:@"dude come on" forKey:@"thisisatest"];
}

@end
