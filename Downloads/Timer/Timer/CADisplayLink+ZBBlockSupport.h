//
//  CADisplayLink+ZBBlockSupport.h
//  Wave
//
//  Created by jiang  hao on 2016/10/27.
//  Copyright © 2016年 jiang  hao. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CADisplayLink (ZBBlockSupport)

+ (instancetype)zb_displayLinkWithBlock:(void(^)(CADisplayLink *displayLink))block;
@end
