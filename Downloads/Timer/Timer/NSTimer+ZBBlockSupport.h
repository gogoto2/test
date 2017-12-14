//
//  NSTimer+ZBBlockSupport.h
//  Timer
//
//  Created by jiang  hao on 2016/10/27.
//  Copyright © 2016年 jiang  hao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (ZBBlockSupport)

+ (instancetype)zb_timerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)())timeBlock repeats:(BOOL)repeats;

@end
