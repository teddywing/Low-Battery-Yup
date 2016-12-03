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

	size_t height = CGDisplayPixelsHigh(_current_display);

	point.x = _fake_alert_frame.origin.x + 420;
	point.y = height - _fake_alert_frame.origin.y - 30;

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
