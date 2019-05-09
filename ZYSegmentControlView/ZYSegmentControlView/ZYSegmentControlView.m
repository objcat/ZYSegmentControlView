//
//  ZYSegmentControlView.m
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import "ZYSegmentControlView.h"
#import "ZYSegmentCollectionViewCell.h"
#import "ZYSegmentModel.h"

@interface ZYSegmentControlView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *arr;
@property (strong, nonatomic) UIView *lineView;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (assign, nonatomic) BOOL firstFlag;
@end

@implementation ZYSegmentControlView

- (UIColor *)selectedColor {
    if (!_selectedColor) {
        // 默认值
        return [UIColor colorWithRed:11 / 255.0 green:114 / 255.0 blue:255 / 255.0 alpha:1];
    }
    return _selectedColor;
}

- (CGFloat)lineHeight {
    if (!_lineHeight) {
        // 默认值
        return 2;
    }
    return _lineHeight;
}

+ (instancetype)segmentWithTitles:(NSArray<NSString *> *)titles {
    return [[ZYSegmentControlView alloc] initWidthTitles:titles];
}

- (instancetype)initWidthTitles:(NSArray<NSString *> *)titles {
    self = [super init];
    if (self) {
        // 设置默认选中行
        self.selectedIndex = 0;
        // 构建数据
        [self buildDataWithTitles:titles];
        // 创建collectionView
        [self createCollectionView];
        // 添加线型滑块
        [self addLineView];
    }
    return self;
}

- (void)createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZYSegmentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZYSegmentCollectionViewCell"];
}

- (void)buildDataWithTitles:(NSArray<NSString *> *)titles {
    self.arr = [NSMutableArray array];
    for (NSString *title in titles) {
        ZYSegmentModel *model = [[ZYSegmentModel alloc] init];
        model.title = title;
        if ([titles indexOfObject:title] == 0) {
            model.isSelected = YES;
        }
        [self.arr addObject:model];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYSegmentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYSegmentCollectionViewCell" forIndexPath:indexPath];
    cell.selectedColor = self.selectedColor;
    cell.model = self.arr[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYSegmentModel *model = self.arr[indexPath.item];
    return CGSizeMake(model.cellWidth, self.frame.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 如果选中的是当前行, 不做任何操作
    if (self.selectedIndex == indexPath.item) {
        return;
    }
    // 设置选中
    self.selectedIndex = indexPath.item;
    // 设置cell样式
    [self configCellWithIndexPath:indexPath];
    // 设置线型滑块样式
    [self configLineWithIndexPath:indexPath];
    // 设置block回调
    [self configBlockWithIndexPath:indexPath];
}

- (void)configCellWithIndexPath:(NSIndexPath *)indexPath {
    // 改变选中文字颜色
    for (ZYSegmentModel *model in self.arr) {
        model.isSelected = NO;
    }
    ZYSegmentModel *model = self.arr[indexPath.item];
    model.isSelected = YES;
    [self.collectionView reloadData];
}

- (void)configLineWithIndexPath:(NSIndexPath *)indexPath {
    // 改变小滑块的位置
    CGFloat width = 0;
    for (NSInteger i = 0; i < indexPath.item; i++) {
        ZYSegmentModel *model = self.arr[i];
        width += model.cellWidth;
    }
    ZYSegmentModel *model = self.arr[indexPath.item];
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.frame = CGRectMake(width, self.frame.size.height - self.lineHeight, model.cellWidth, self.lineHeight);
    }];
}

- (void)configBlockWithIndexPath:(NSIndexPath *)indexPath {
    // 选中回调
    self.selectedAtIndexBlock ? self.selectedAtIndexBlock(indexPath.item) : nil;
}

- (void)addLineView {
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = self.selectedColor;
    [self addSubview:self.lineView];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    if (!self.firstFlag) {
        self.firstFlag = YES;
        ZYSegmentModel *model = self.arr[self.selectedIndex];
        if (self.selectedIndex == 0) {
            self.lineView.frame = CGRectMake(0, self.frame.size.height - self.lineHeight, model.cellWidth, self.lineHeight);
        }
    }
}

@end

