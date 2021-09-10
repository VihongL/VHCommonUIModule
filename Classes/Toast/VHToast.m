//
//  VHToast.m
//  VHCommonUIModule_Example
//
//  Created by Logan on 2021/9/9.
//  Copyright © 2021 375074110. All rights reserved.
//

#import "VHToast.h"

@interface VHToast ()
@property (nonatomic, strong) MASConstraint                 *orientationConstraint;
@end

@implementation VHToast

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"888888" alpha:0.7];
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void) layoutSubviews {
    self.layer.cornerRadius = self.bounds.size.height/2;
}

+ (void)toast:(NSString *)msg view:(UIView *)view{
    VHToast *toast = [VHToast new];
    UIView *superview = view;//[[UIApplication sharedApplication] keyWindow];
    [superview addSubview:toast];
    
    UILabel *label = [UILabel new];
    NSDictionary *attr = @{NSFontAttributeName : [UIFont systemFontOfSize:15],
                           NSForegroundColorAttributeName : VHForegroundColor};
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:msg attributes:attr];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, msg.length)];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    [toast addSubview:label];
    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(toast).with.insets(UIEdgeInsetsMake(7, 5, 5, 5));
        make.height.greaterThanOrEqualTo(@(label.intrinsicContentSize.height));
        make.width.lessThanOrEqualTo(superview/*[[UIApplication sharedApplication] keyWindow]*/).multipliedBy(0.8);
        make.width.greaterThanOrEqualTo(superview/*[UIApplication sharedApplication].keyWindow*/).multipliedBy(0.3);
    }];
    
    [toast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superview);
        toast.orientationConstraint = make.top.equalTo(superview.mas_bottom);
    }];
    [toast startAnimation];
}

- (void)startAnimation {
    [self.superview layoutIfNeeded];
    [self.orientationConstraint uninstall];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.65 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.superview).with.offset(-100);
        }];
        [self.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

- (CGSize)intrinsicContentSize {
    return CGSizeZero;
}

@end
