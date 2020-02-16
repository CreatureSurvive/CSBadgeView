//
//  Badge.m
//  CSBadgeView
//
//  Created by Dana Buehre on 1/23/20.
//  Copyright © 2020 CreatureCoding. All rights reserved.
//

#import "CSBadgeView.h"

@implementation CSBadgeView

#pragma mark - Initialization

+ (instancetype)badgeWithColor:(UIColor *)color height:(CGFloat)height {
    return [[CSBadgeView alloc] initWithColor:color height:height text:nil];
}

+ (instancetype)badgeWithColor:(UIColor *)color height:(CGFloat)height text:(NSString *)text {
    return [[CSBadgeView alloc] initWithColor:color height:height text:text];
}

- (instancetype)init {
    
    if (self = [super init]) {
        [self _configureWithColor:UIColor.systemRedColor height:22 text:@""];
    }
    
    return self;
}

- (instancetype)initWithColor:(UIColor *)color height:(CGFloat)height text:(NSString *)text {
    
    height = height < 15 ? 15 : height;
    
    if (self = [super initWithFrame:CGRectMake(0, 0, height, height)]) {
        [self _configureWithColor:color height:height text:text];
    }
    
    return self;
}

#pragma mark - Private Methods

- (void)_configureWithColor:(UIColor *)color height:(CGFloat)height text:(NSString *)text {
    [self setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightSemibold]];
    [self setBackgroundColor:color ? : UIColor.systemRedColor];
    [self setTextColor:UIColor.whiteColor];
    [self setTextAlignment:NSTextAlignmentCenter];
    [self setText:text];
    [self.layer setMasksToBounds:YES];
    self.height = height;

    while ([text ? : @"0" sizeWithAttributes:@{NSFontAttributeName: self.font}].height > (height * 0.8)) {
        [self setFont:[UIFont systemFontOfSize:self.font.pointSize - 1 weight:UIFontWeightSemibold]];
    }

    [self setNeedsLayout];
}

#pragma mark - Property Setters

- (void)setHeight:(CGFloat)height {
    _height = height;
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsLayout];
}

#pragma mark - Layout

- (void)layoutSubviews {
    CGSize stringSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    self.bounds = CGRectMake(0, 0, stringSize.width > _height * 0.5 ? (stringSize.width + _height * 0.5) : _height, _height);
    self.layer.cornerRadius = self.bounds.size.height * 0.5;
    [super layoutSubviews];
}

@end
