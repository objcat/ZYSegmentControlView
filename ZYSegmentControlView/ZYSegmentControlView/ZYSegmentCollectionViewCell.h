//
//  ZYSegmentCollectionViewCell.h
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYSegmentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYSegmentCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) ZYSegmentModel *model;
@property (strong, nonatomic) UIColor *selectedColor;
@end

NS_ASSUME_NONNULL_END
