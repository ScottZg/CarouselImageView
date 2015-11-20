//
//  OLASCarouselPicView.h
//  LunBoPicDemo
//
//  Created by zhanggui on 15/11/20.
//  Copyright © 2015年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OLASCarouselPicView : UIView

@property (nonatomic,strong)NSArray *imageArray;

/**
 *  set show contents
 *
 *  @param imageArr image's array;
 */
- (void)setShowDetailsWithImageArr:(NSArray *)imageArr;
@end
