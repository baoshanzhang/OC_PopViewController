//
//  PopPresentHeader.h
//  BSPopViewController_OC
//
//  Created by 张宝山 on 2019/11/13.
//  Copyright © 2019 张宝山. All rights reserved.
//

#ifndef PopPresentHeader_h
#define PopPresentHeader_h

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//弹出动画结束后调用
typedef void (^PopAnimationCompleteHeadle)(BOOL presented);

//弹出类型
typedef NS_ENUM(NSUInteger, PopType){
    AlertType,
    SheetType,
};

#define kAnimationDuration 0.3

#endif /* PopPresentHeader_h */

