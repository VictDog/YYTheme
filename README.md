# YYTheme
iOS快速切换主题


![运行效果](./theme.gif)
****
**实现思路**

- 1.创建主题色池
- 2.将需要设置主题色的控件及其对应属性/方法添加到主题色池中
- 3.调用设置主题色方法时，遍历主题色池中的控件，使用KVC设置对应属性或调用对应的方法来实现主题色的设置

**使用方法**

- 将YYTheme文件夹中的文件拽入项目中
- 导入主头文件 #import "NSObject+YYThemeExtension.h"

**具体使用**

#### 1. 添加控件的属性/方法到主题色池中

- 直接通过属性

```objc
// 按钮的背景色添加到主题色池中
[button yy_addToThemeColorPool:@"backgroundColor"];	
```

- 通过设置方法并且传入方法对应参数数组，参数中直接含有颜色参数

```objc
// 设置按钮选中时字体颜色添加到主题色池中
[button yy_addToThemeColorPoolWithSelector:@selector(setTitleColor:forState:) objects:@[YYTHEME_THEME_COLOR, @(UIControlStateSelected)]]; 
```

- 当方法参数中没有直接包含颜色参数，而是经过包装（如使用NSDictionary包装）

```objc
// 设置tabBar选中时字体颜色添加到主题色池中
NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
attrSel[NSForegroundColorAttributeName] = YYTHEME_THEME_COLOR;
[childController.tabBarItem yy_addToThemeColorPoolWithSelector:@selector(setTitleTextAttributes:forState:) objects:@[attrSel, @(UIControlStateSelected)]];
```

#### 2. 设置主题色 
```objc
// 设置主题色为红色
[self yy_setThemeColor:[UIColor redColor]];
```

### 设置主题图片与配色
#### 1. 添加相关控件对象到主题图片池中
```objc
// 添加tabBarItem到主题图片池中
[tabBarItem py_addToThemeImagePool];
```

#### 2. 根据需求设置控件的相关属性
```objc
// 重新加载主题图片，并设置主题色为红色
[self yy_reloadThemeImageWithThemeColor:[UIColor redColor] setting:^(const NSArray<id> *objects) {
     // 根据控件类型完成相关设置
}
```

### 使用注意
- 对象不能是`UIAppearance`，否则将无法添加到主题池中
如下：将导致navigationBar无法添加到主题色池中

```objc
// 获取全局navBar
UINavigationBar *navBar = [UINavigationBar appearance];
// 添加背景色到主题色池中        
[navBar yy_addToThemeColorPool:@"barTintColor"];
```

- 如果要使图片随着主题色变化而渲染成主题颜色，需要设置`RenderingMode`为：UIImageRenderingModeAlwaysTemplate
