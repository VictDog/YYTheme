//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYTabBar.h
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYTabBar;

@protocol YYTabBarDelegate <UITabBarDelegate>
@optional
#pragma mark - 点击中间加号的代理（可选）
- (void)tabBarDidClickAddItem: (YYTabBar *)tabBar;
@end

@interface YYTabBar : UITabBar

@property (nonatomic, weak) id<YYTabBarDelegate> delegate;

+ (instancetype)tabBar;

@end
