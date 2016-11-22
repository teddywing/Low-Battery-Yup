//
//  main.m
//  Low Battery Yup d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
	AppDelegate *delegate = [[AppDelegate alloc] init];
	[[NSApplication sharedApplication] setDelegate:delegate];
	[NSApp run];
	return EXIT_SUCCESS;
}
