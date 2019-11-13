//
//  UIViewController+PopPresent.m
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import "UIViewController+PopPresent.h"
#import <objc/runtime.h>

static const char animationKey;
@implementation UIViewController (PopPresent)

-(PopPresentAnimation *)animation {
    
    return objc_getAssociatedObject(self, &animationKey);
}

-(void)setAnimation:(PopPresentAnimation *)animation {
    objc_setAssociatedObject(self, &animationKey, animation, OBJC_ASSOCIATION_RETAIN);
}

-(void)showPresentedController:(UIViewController *)prestedVC
                      WithType:(PopType)type
                   presentSize:(CGSize)size
                 shadowDismiss:(BOOL)shadowDismiss
                completeHandle:(PopAnimationCompleteHeadle)handle
{
    
    self.animation = [PopPresentAnimation initWithType:type completHandle:handle shadowDismiss:shadowDismiss];
    [self.animation setSize:size];
    prestedVC.modalPresentationStyle = UIModalPresentationCustom;
    prestedVC.transitioningDelegate = self.animation;
    
    [self presentViewController:prestedVC animated:YES completion:nil];
}



@end
