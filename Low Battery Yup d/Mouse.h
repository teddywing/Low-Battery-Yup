//
//  Mouse.h
//  Low Battery Yup d
//
//  Created by TW on 11/16/16.
//  Copyright (c) 2016 TW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mouse : NSObject {
	CGDirectDisplayID _current_display;
	CGPoint _cursor_position;
}

- (CGPoint)centerPoint;
- (void)moveToPoint:(CGPoint)point;
- (void)moveToCenter;
- (void)click;

@end