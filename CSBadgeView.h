//
//  Badge.h
//  CSBadgeView
//
//  Created by Dana Buehre on 1/23/20.
//  Copyright © 2020 CreatureCoding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSBadgeView : UILabel
@property (nonatomic, assign) CGFloat height;

+ (instancetype)badgeWithColor:(UIColor *)color height:(CGFloat)height;
+ (instancetype)badgeWithColor:(UIColor *)color height:(CGFloat)height text:(NSString *)text;
- (instancetype)initWithColor:(UIColor *)color height:(CGFloat)height text:(NSString *)text;

@end
