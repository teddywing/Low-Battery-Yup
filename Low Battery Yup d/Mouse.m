//
//  Mouse.m
//  Low Battery Yup.d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import "Mouse.h"

@implementation Mouse

- (id)init
{
    self = [super init];
    if (self) {
        _current_display = CGMainDisplayID();
		_cursor_position = CGPointMake(0, 0);
		_fake_alert = [[FakeAlert alloc] init];
		_fake_alert_frame = [_fake_alert frame];
    }
    return self;
}

- (void)dealloc
{
    [_fake_alert release];
    [super dealloc];
}

- (void)moveToPoint:(CGPoint)point
{
	_cursor_position = point;
	CGDisplayMoveCursorToPoint(_current_display, point);
}

- (void)moveToLowBatteryOK
{
	if (_current_display != CGMainDisplayID()) {
		_current_display = CGMainDisplayID();
		_fake_alert_frame = [_fake_alert frame];
	}

	CGPoint point;

	size_t width = CGDisplayPixelsWide(_current_display);
	size_t height = CGDisplayPixelsHigh(_current_display);

	point.x = width / 2 + 182;
	point.y = height / 2 - 116; // 1440x900  | 450 - 116 = 334 | 900  / 334 | 3340 / 900  = 3.7111
//	point.y = height / 2 - 292; // 2560x1600 | 800 - 292 = 508 | 1600 / 508 | 5080 / 1600 = 3.175

	// x + 420
	// y + 30
	point.x = _fake_alert_frame.origin.x + 420;
	point.y = height - _fake_alert_frame.origin.y - 30;
	NSLog(@"%f, %f, %f, %f", _fake_alert_frame.origin.x, _fake_alert_frame.origin.y, _fake_alert_frame.size.width, _fake_alert_frame.size.height);

	[self moveToPoint:point];
}

void post_mouse_event (CGEventType type, CGMouseButton button, CGPoint point) {
	CGEventSourceRef ref = CGEventSourceCreate(kCGEventSourceStatePrivate);
	CGEventRef event = CGEventCreateMouseEvent(ref, type, point, button);
	CGEventPost(kCGHIDEventTap, event);
	CFRelease(event);
	CFRelease(ref);
}

- (void)click
{
	post_mouse_event(kCGEventLeftMouseDown, kCGMouseButtonLeft, _cursor_position);
	post_mouse_event(kCGEventLeftMouseUp, kCGMouseButtonLeft, _cursor_position);
}

@end
