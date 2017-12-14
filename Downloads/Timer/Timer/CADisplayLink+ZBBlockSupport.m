//
//  CADisplayLink+ZBBlockSupport.m
//  Wave
//
//  Created by jiang  hao on 2016/10/27.
//  Copyright © 2016年 jiang  hao. All rights reserved.
//

#import "CADisplayLink+ZBBlockSupport.h"

static void(^diaplayBlock)(CADisplayLink *displayLink) = nil;

@implementation CADisplayLink (ZBBlockSupport)

+ (instancetype)zb_displayLinkWithBlock:(void (^)(CADisplayLink *displayLink))block{
    diaplayBlock = [block copy];
    return [self displayLinkWithTarget:self selector:@selector(blockInvoke:)];
}

+ (void)blockInvoke:(CADisplayLink *)displayLink{
    if (diaplayBlock) {
        diaplayBlock(displayLink);
    }
}

@end
