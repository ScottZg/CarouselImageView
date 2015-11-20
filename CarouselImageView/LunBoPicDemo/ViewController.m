//
//  ViewController.m
//  LunBoPicDemo
//
//  Created by zhanggui on 15/11/20.
//  Copyright © 2015年 zhanggui. All rights reserved.
//

#import "ViewController.h"
#import "OLASCarouselPicView.h"
#import "Masonry.h"
@interface ViewController ()
@property (nonatomic,strong)OLASCarouselPicView *caroselPicView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initConstarints];
    [self loadRemoteServer];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initConstarints {
//    [self.caroselPicView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(self.view.mas_top).offset(64);
//        make.height.equalTo(@180);
//    }];
}
#pragma mark - get data from remote server
- (void)loadRemoteServer {
    NSArray *arr = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"]];
    [self.caroselPicView setShowDetailsWithImageArr:arr];
}
#pragma mark - Lazy Load
- (OLASCarouselPicView *)caroselPicView {
    if (!_caroselPicView) {
        _caroselPicView = [[OLASCarouselPicView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 155)];
        [self.view addSubview:_caroselPicView];
    }
    return _caroselPicView;
}
@end
