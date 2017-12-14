//
//  NSTimer+ZBBlockSupport.m
//  Timer
//
//  Created by jiang  hao on 2016/10/27.
//  Copyright © 2016年 jiang  hao. All rights reserved.
//

#import "NSTimer+ZBBlockSupport.h"

@implementation NSTimer (ZBBlockSupport)

+ (instancetype)zb_timerWithTimeInterval:(NSTimeInterval)timeInterval
                                   block:(void (^)())timeBlock
                                 repeats:(BOOL)repeats{
    return [self timerWithTimeInterval:timeInterval
                                target:self
                              selector:@selector(zb_blockInvoke:)
                              userInfo:[timeBlock copy]
                               repeats:repeats
            ];
}

+ (void)zb_blockInvoke:(NSTimer *)timer{
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
}


@end
