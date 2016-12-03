//
//  Mouse.h
//  Low Battery Yup.d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FakeAlert.h"

@interface Mouse : NSObject {
	CGDirectDisplayID _current_display;
	CGPoint _cursor_position;

	FakeAlert *_fake_alert;
	NSRect _fake_alert_frame;
}

- (void)moveToPoint:(CGPoint)point;
- (void)moveToLowBatteryOK;
- (void)click;

@end
