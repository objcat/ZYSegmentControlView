//
//  ZYSegmentModel.h
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYSegmentModel : NSObject
@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL isSelected;
@property (assign, nonatomic, readonly) CGFloat cellWidth;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
