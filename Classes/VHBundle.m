//
//  VHBundle.m
//  VHCommonUIModule_Example
//
//  Created by Logan on 2021/9/10.
//  Copyright © 2021 375074110. All rights reserved.
//

#import "VHBundle.h"

@implementation VHBundle

+ (NSBundle *)vhBundle {
    //定位到我们需要访问资源的bundle
    NSBundle * bundle = [NSBundle bundleForClass:[self class]];
    //获取我们自己手动创建的bundle资源文件路径
    NSURL * bundleUrl = [bundle URLForResource:@"VHCommonUIModuleBundle" withExtension:@"bundle"];
    return [NSBundle bundleWithURL:bundleUrl];
}

+ (UIImage *)vb_imageNamed:(NSString *)imageName {
    NSBundle * bu = [self vhBundle];
    return [UIImage imageNamed:imageName inBundle:bu compatibleWithTraitCollection:nil];
}

@end
