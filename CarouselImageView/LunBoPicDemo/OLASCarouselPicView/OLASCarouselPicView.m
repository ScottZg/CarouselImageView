//
//  OLASCarouselPicView.m
//  LunBoPicDemo
//
//  Created by zhanggui on 15/11/20.
//  Copyright © 2015年 zhanggui. All rights reserved.
//

#import "OLASCarouselPicView.h"
#import "OLASCarouselCollectionViewCell.h"
@interface OLASCarouselPicView ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)UICollectionView *myCollectionView;  //collection view

@property (nonatomic,strong)UIPageControl *myPageControl;   //page control

@property (nonatomic,strong)NSTimer *myTimer;

@end

@implementation OLASCarouselPicView

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = (int)((scrollView.contentOffset.x)/([[UIScreen mainScreen] bounds].size.width) + 0.5)%(self.imageArray.count);
    self.myPageControl.currentPage = page;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_myTimer invalidate];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self addTimer];
}
#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_imageArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OLASCarouselCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PicCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[OLASCarouselCollectionViewCell alloc] init];
    }
    [cell setShowContent:_imageArray[indexPath.item]];
    
    return cell;
}
#pragma mark - set contents
- (void)setShowDetailsWithImageArr:(NSArray *)imageArr {
    self.imageArray = imageArr;
    [self.myCollectionView registerClass:[OLASCarouselCollectionViewCell class] forCellWithReuseIdentifier:@"PicCell"];
    self.myPageControl.numberOfPages = imageArr.count;
    if (imageArr.count>1) {
        [self addTimer];
    }
}
#pragma mark - addTimer method
- (void)addTimer {
    _myTimer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPageAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_myTimer forMode:NSRunLoopCommonModes];


}
#pragma mark - nextPage action
- (void)nextPageAction {
    //get current indexPath
    NSIndexPath *currentPath = [[self.myCollectionView indexPathsForVisibleItems] lastObject];
    NSInteger nextItem = currentPath.item+1;
    if (nextItem>self.imageArray.count-1) {
        nextItem=0;
    }
    //get next indexPath
    NSIndexPath *nextPagePath = [NSIndexPath indexPathForItem:nextItem inSection:currentPath.section];
    //scroll to next Item;
    [self.myCollectionView scrollToItemAtIndexPath:nextPagePath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - lazy load
- (UIPageControl *)myPageControl {
    if (!_myPageControl) {
        _myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 20)];
        _myPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _myPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        [self addSubview:_myPageControl];
    }
    return _myPageControl;
}
- (UICollectionView *)myCollectionView {
    if (!_myCollectionView) {
        //set flow layout
        UICollectionViewFlowLayout *myLayout = [[UICollectionViewFlowLayout alloc] init];
        [myLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        myLayout.minimumLineSpacing = 0; //

        _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width , self.frame.size.height) collectionViewLayout:myLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        _myCollectionView.showsHorizontalScrollIndicator = NO;
        _myCollectionView.pagingEnabled = YES;
        _myCollectionView.bounces = NO;   //禁止弹跳
        myLayout.itemSize =  _myCollectionView.frame.size;
        
        [self addSubview:_myCollectionView];

    }
    return _myCollectionView;
}
#pragma mark - Dealloc
- (void)dealloc {
    self.myTimer = nil;
}
@end
