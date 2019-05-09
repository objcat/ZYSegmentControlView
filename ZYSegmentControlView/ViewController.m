//
//  ViewController.m
//  ZYSegmentControlView
//
//  Created by 张祎 on 2019/5/9.
//  Copyright © 2019年 张祎. All rights reserved.
//

#import "ViewController.h"
#import "ZYSegmentControlView.h"

@interface ViewController ()
@property (strong, nonatomic) ZYSegmentControlView *segmentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    self.segmentView = [ZYSegmentControlView segmentWithTitles:@[@"你好", @"aaaaaa", @"中", @"中国邮政局"]];
    self.segmentView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44);
    [self.segmentView setSelectedAtIndexBlock:^(NSInteger index) {
        NSLog(@"第%ld个", index);
    }];
    [self.view addSubview:self.segmentView];
    
}




@end
