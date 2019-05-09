//
//  ZYSegmentModel.m
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import "ZYSegmentModel.h"
#import "ZYTextCalculator.h"

@implementation ZYSegmentModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (CGFloat)cellWidth {
    CGSize cellSize = [ZYTextCalculator sizeWithText:self.title font:[UIFont systemFontOfSize:17] lineSpacing:0 maxSize:CGSizeMake(MAXFLOAT, 44) numberOfLine:1];
    return cellSize.width + 10;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"isSelected"]) {
        NSNumber *selected = value;
        self.isSelected = selected.boolValue;
    }
}

@end
