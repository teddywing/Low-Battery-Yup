//
//  LaunchAgentManager.h
//  Low Battery Yup.d
//
//  Created by TW on 12/2/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LAUNCH_AGENTS_PATH @"~/Library/LaunchAgents"

@interface LaunchAgentManager : NSObject {
	NSFileManager *_file_manager;
}

- (BOOL)install;
- (BOOL)uninstall;

@end
