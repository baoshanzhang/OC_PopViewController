//
//  PopPresentAnimation.h
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PopPresentHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface PopPresentAnimation : NSObject<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

//初始化
+ (instancetype)initWithType:(PopType)type
               completHandle:(PopAnimationCompleteHeadle)handle
               shadowDismiss:(BOOL)shadowDismiss;


- (void)setSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
