//
//  PopPresentController.h
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopPresentHeader.h"


NS_ASSUME_NONNULL_BEGIN

@interface PopPresentController : UIPresentationController

@property (nonatomic , strong) UIView *coverView;

@property (nonatomic , assign) PopType type;

@property (nonatomic , assign) CGSize size;

@property (nonatomic , assign) CGFloat height;

//点击阴影是否关闭页面
@property (nonatomic , assign) BOOL shadowDismiss;

@end

NS_ASSUME_NONNULL_END

