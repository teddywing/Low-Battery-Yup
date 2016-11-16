//
//  Mouse.m
//  Low Battery Yup d
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
    }
    return self;
}

- (void)moveToPoint:(CGPoint)point
{
	CGDisplayMoveCursorToPoint(_current_display, point);
}

- (void)moveToCenter
{
	CGPoint point;

	size_t width = CGDisplayPixelsWide(_current_display);
	size_t height = CGDisplayPixelsHigh(_current_display);

	point.x = width / 2;
	point.y = height / 2;

	[self moveToPoint:point];
}

- (void)click
{
}

@end
