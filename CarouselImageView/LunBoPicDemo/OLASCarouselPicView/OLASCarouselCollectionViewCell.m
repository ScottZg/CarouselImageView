//
//  OLASCarouselCollectionViewCell.m
//  LunBoPicDemo
//
//  Created by zhanggui on 15/11/20.
//  Copyright © 2015年 zhanggui. All rights reserved.
//

#import "OLASCarouselCollectionViewCell.h"

@interface OLASCarouselCollectionViewCell ()

@property (nonatomic,strong)UIImageView *contentImageView;
@end

@implementation OLASCarouselCollectionViewCell

- (void)setShowContent:(UIImage *)image {
//    self.backgroundColor = [UIColor whiteColor];
    self.contentImageView.image = image;
}
#pragma mark - Lazy load
- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_contentImageView];
    }
    return _contentImageView;
}
@end
