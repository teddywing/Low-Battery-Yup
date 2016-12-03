//
//  Mouse.m
//  Low Battery Yup.d
//
//  Created by Teddy Wing on 11/16/16.
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
