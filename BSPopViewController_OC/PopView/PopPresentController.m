//
//  PopPresentController.m
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#import "PopPresentController.h"

@interface PopPresentController ()

@end

@implementation PopPresentController

//设置要显示View的frame
- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    
    if (self.type == AlertType) {
        self.presentedView.frame = CGRectMake(self.containerView.center.x - self.size.width*0.5, self.containerView.center.y - self.size.height*0.5, self.size.width, self.size.height);
    }
    
    if (self.type == SheetType) {
        self.presentedView.frame = CGRectMake(0, self.containerView.bounds.size.height - self.height, self.containerView.bounds.size.width, self.height);
    }
    
    [self.containerView insertSubview:self.coverView atIndex:0];
    
}

- (CGRect)frameOfPresentedViewInContainerView {
    
    if (self.type == AlertType) {
        self.presentedView.frame = CGRectMake(self.containerView.center.x - self.size.width * 0.5, self.containerView.center.y - self.size.height * 0.5, self.size.width, self.size.height);
    }
    if (self.type == SheetType) {
        self.presentedView.frame = CGRectMake(0, self.containerView.bounds.size.height - self.height, self.containerView.bounds.size.width, self.height);
    }
    return self.presentedView.frame;
}

- (BOOL) shouldPresentInFullscreen {
    return NO;
}

- (BOOL) shouldRemovePresentersView {
    return NO;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:self.containerView.bounds];
        _coverView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.2f];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissAction)];
        [_coverView addGestureRecognizer:tap];
    }
    return _coverView;
}

- (void)dismissAction {
    if (!self.shadowDismiss) {
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
