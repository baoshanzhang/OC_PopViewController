//
//  UIViewController+PopPresent.h
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopPresentHeader.h"
#import "PopPresentAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PopPresent)

//动画管理类
@property (nonatomic , strong) PopPresentAnimation *animation;

/**
 prestedVC ： 要显示的控制器
 type ： 显示类型，alert在屏幕中间显示，sheet在底部显示，
 size ： 底部显示时宽度固定是屏幕宽度
 shadowDismiss : 点击阴影是否dismiss当前页面
 handle ： 动画结束后的回调
 **/
- (void)showPresentedController:(UIViewController*)prestedVC
                       WithType:(PopType)type
                    presentSize:(CGSize)size
            shadowDismiss:(BOOL)shadowDismiss
                 completeHandle:(PopAnimationCompleteHeadle)handle;


@end

NS_ASSUME_NONNULL_END
