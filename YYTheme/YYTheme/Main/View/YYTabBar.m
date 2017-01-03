//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYTabBar.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYTabBar.h"
#import "UIView+YYExtension.h"
#import "NSObject+YYThemeExtension.h"
#define kControllerCount 4
#define kTabBarHeight 49

@interface YYTabBar()
@property (nonatomic, strong) UIView *addButton;
@end


@implementation YYTabBar
@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        // 添加中间add按钮
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setImage:[[UIImage imageNamed:@"tab_publish_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        self.addButton = addBtn;
        [self addSubview:addBtn];
        [self yy_addToThemeColorPool:@"tintColor"];
    }
    return self;
}

- (void)addClick {
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickAddItem:)]) {
        [self.delegate tabBarDidClickAddItem:self];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.yy_width / (kControllerCount + 1);
    self.addButton.yy_width = width;
    self.addButton.yy_height = kTabBarHeight;
    self.addButton.yy_x = ([UIScreen mainScreen].bounds.size.width - width) * 0.5;
    self.addButton.yy_y = 0;
    // 下标
    NSUInteger index = 0;
    // 判断是否为控制器按钮
    for (UIView *view in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view.class isSubclassOfClass:class]) {
            view.yy_x = index * width;
            view.yy_width = width;
            index ++;
            if (index == 2) {
                index ++;
            }
        }
    }
}

+ (instancetype)tabBar {
    return [[self alloc] init];
}

@end
