//
//  ZYSegmentControlView.h
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYSegmentControlView : UIView

/**
 根据标题初始化视图

 @param titles 标题
 @return instancetype
 */
+ (instancetype)segmentWithTitles:(NSArray <NSString *> *)titles;

/** 选中文字颜色及滑块颜色 */
@property (strong, nonatomic) UIColor *selectedColor;

/** 滑块的高度 */
@property (assign, nonatomic) CGFloat lineHeight;

/** 选中回调 */
@property (copy, nonatomic) void (^selectedAtIndexBlock) (NSInteger index);

@end

NS_ASSUME_NONNULL_END
