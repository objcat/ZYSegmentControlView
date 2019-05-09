//
//  ZYSegmentCollectionViewCell.m
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import "ZYSegmentCollectionViewCell.h"

@interface ZYSegmentCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation ZYSegmentCollectionViewCell

- (void)setModel:(ZYSegmentModel *)model {
    _model = model;
    self.titleLabel.text = model.title;
    if (model.isSelected) {
        self.titleLabel.textColor = self.selectedColor;
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
