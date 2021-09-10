//
//  VHBundle.h
//  VHCommonUIModule_Example
//
//  Created by Logan on 2021/9/10.
//  Copyright © 2021 375074110. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VHBundle : NSBundle

+ (NSBundle *)vhBundle;

+ (UIImage *)vb_imageNamed:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
