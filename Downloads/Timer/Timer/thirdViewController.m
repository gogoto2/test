//
//  SecondViewController.m
//  Timer
//
//  Created by jiang  hao on 2016/10/27.
//  Copyright © 2016年 jiang  hao. All rights reserved.
//

#import "thirdViewController.h"
#import "NSTimer+ZBBlockSupport.h"
static int i = 0;
@interface thirdViewController()

@property (strong,nonatomic) NSTimer *timer;
@property (strong,nonatomic) CADisplayLink *displayLink;

@end

@implementation thirdViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@" self Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    //强引用  NSRunloop ---> NSTimer ---> self
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(sayHello) userInfo:nil repeats:YES];
    //     NSLog(@"timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self.timer));
    NSLog(@"timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)_timer));
    NSLog(@" self Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

    CFRunLoopRef xmppRunLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];

 
    CFArrayRef arrayRef =  CFRunLoopCopyAllModes(xmppRunLoop);
    NSArray *array = (__bridge NSArray *)arrayRef;
    
    //     NSLog(@"timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self.timer));
    NSLog(@"timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)_timer));
    
    //使用分类的方法,利用block
    //    __weak typeof(self)  weakSelf = self;
    //    self.timer = [NSTimer zb_timerWithTimeInterval:1 block:^{
    //        [weakSelf sayHello];
    //    }
    //                                           repeats:YES];
    //    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //使用iOS10的新方法,看样子iOS10,苹果爸爸给我们封装好了方法,不会再强引用self了
    //    if ([UIDevice currentDevice].systemVersion.floatValue == 10.0) {
    //        __weak typeof(self)  weakSelf = self;
    //        self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
    //            [weakSelf sayHello];
    //        }];
    //        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    //    }
    
}

- (void)sayHello{
    NSLog(@"hello%d",i++);
}

- (void)dealloc{
    NSLog(@"%@%s",NSStringFromClass([self class]),__func__);
    NSLog(@"timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)_timer));
    NSLog(@" self Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    [self.timer invalidate];
}

- (IBAction)invalidTimer:(UIButton *)sender {
    [self.timer invalidate];
    NSLog(@"invalidTimer  timer Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)_timer));
    NSLog(@" self Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)self));
}


@end
