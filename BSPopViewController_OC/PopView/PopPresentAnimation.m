//
//  PopPresentAnimation.m
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import "PopPresentAnimation.h"
#import "PopPresentController.h"

@interface PopPresentAnimation()

//是否已经弹出
@property(nonatomic , assign) BOOL isPrestend;
//弹出尺寸
@property(nonatomic , assign) CGSize alertSize;
//底部弹出时的高度
@property(nonatomic , assign) CGFloat sheetHeight;
//弹出类型
@property(nonatomic , assign) PopType type;
//点击背景时候消失
@property(nonatomic , assign) BOOL shadowDismiss;
//弹出后回调
@property(nonatomic , copy) PopAnimationCompleteHeadle handle;
//管理要显示视图的vc
@property(nonatomic , strong) PopPresentController *preseentationController;

@end

@implementation PopPresentAnimation

//构造方法
+ (instancetype)initWithType:(PopType)type
               completHandle:(PopAnimationCompleteHeadle)handle
               shadowDismiss:(BOOL)shadowDismiss
{
    
    PopPresentAnimation *animation = [[PopPresentAnimation alloc]init];
    animation.type = type;
    animation.handle = handle;
    animation.shadowDismiss = shadowDismiss;
    return animation;
}

-(void)setSize:(CGSize)size {
    
    if (self.type == AlertType) {
        self.alertSize = size;
    }
    if (self.type == SheetType) {
        self.sheetHeight = size.height;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate
-(nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    PopPresentController *presentationController = [[PopPresentController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    presentationController.type = self.type;
    presentationController.size = self.alertSize;
    presentationController.height = self.sheetHeight;
    presentationController.shadowDismiss = self.shadowDismiss;
    self.preseentationController = presentationController;
    return presentationController;
}

#pragma mark - UIViewControllerAnimatedTransitioning
-(nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    self.isPrestend = YES;
    !self.handle? : self.handle(_isPrestend);
    return self;
}

-(nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPrestend = NO;
    !self.handle? : self.handle(_isPrestend);
    return self;
}

//动画时长
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kAnimationDuration;
}

//开始动画
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    self.isPrestend ? [self animationForPresentrdView:transitionContext] : [self animationForDismissedView:transitionContext];
}

#pragma mark - 实现动画方法
//弹出
-(void)animationForPresentrdView:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [self.preseentationController.containerView addSubview:presentedView];
    self.preseentationController.coverView.alpha = 0;
    //设置阴影
    transitionContext.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    transitionContext.containerView.layer.shadowOffset = CGSizeMake(0, 5);
    transitionContext.containerView.layer.shadowOpacity = 0.5f;
    transitionContext.containerView.layer.shadowRadius = 10.0f;
    
    WeakSelf(weakSelf)
    if (self.type == AlertType) {
        presentedView.alpha = 0.0f;
        presentedView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        //动画弹出
        [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.preseentationController.coverView.alpha = 1.0f;
            presentedView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
    if (self.type == SheetType) {
        presentedView.transform = CGAffineTransformMakeTranslation(0, weakSelf.sheetHeight);
        [UIView animateWithDuration:kAnimationDuration animations:^{
            weakSelf.preseentationController.coverView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

//消失
-(void)animationForDismissedView:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    WeakSelf(weakSelf)
    if (self.type == AlertType) {
        //消失
        [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.preseentationController.coverView.alpha = 0.0f;
            presentedView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    
    if (self.type == SheetType) {
        [UIView animateWithDuration:kAnimationDuration animations:^{
            weakSelf.preseentationController.coverView.alpha = 0.0f;
            presentedView.transform = CGAffineTransformMakeTranslation(0, weakSelf.sheetHeight);
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}


@end
