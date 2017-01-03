//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  NSObject+YYThemeExtension.h
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

// 主题色
#define YYTHEME_THEME_COLOR @"YYTHEME_THEME_COLOR"
/** 设置主题图片前调用此block */
typedef void (^YYThemeImageSettingBlock)(const NSArray<id> *objects);

@interface NSObject (YYThemeExtension)

/**
 * 添加到主题色池
 * selector : 执行方法
 * objects : 方法参数数组
 * 注意：方法参数必须按顺序一一对应，如果涉及到的主题色设置使用 YYTHEME_THEME_COLOR 宏定义代替
 * 如果数组中某个参数为nil，需包装为 [NSNull null] 对象再添加到数组中
 */
- (void)yy_addToThemeColorPoolWithSelector:(SEL)selector objects:(NSArray<id> *)objects;
/**
 * 从主题色池移除
 * selector : 执行方法
 */
- (void)yy_removeFromThemeColorPoolWithSelector:(SEL)selector;
/**
 * 添加到主题色池
 * propertyName : 属性名
 */
- (void)yy_addToThemeColorPool:(NSString *)propertyName;
/**
 * 从主题色池移除
 * propertyName : 属性名
 */
- (void)yy_removeFromThemeColorPool:(NSString *)propertyName;
/**
 * 设置主题色
 * color : 主题色
 */
- (void)yy_setThemeColor:(UIColor *)color;


/** 添加到主题图片池 */
- (void)yy_addToThemeImagePool;
/** 从主题图片池中移除 */
- (void)yy_removeFromThemeImagePool;
/**
 * 重新加载主题图片
 * themeColor : 主题色
 * block : 设置主题图片时调用的block
 */
- (void)yy_reloadThemeImageWithThemeColor:(UIColor *)themeColor setting:(YYThemeImageSettingBlock)block;

@end
