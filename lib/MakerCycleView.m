//
//  MakerCycleView.m
//  MakerCycleViewDemo
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

#import "MakerCycleView.h"
#import "CycleCollectionCell.h"
#import <UIImageView+WebCache.h>

NSString *CycleCellId = @"CycleCellId";

@interface MakerCycleView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;

@end

@implementation MakerCycleView
#pragma mark   ==============setter==============
- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    _pageControl.numberOfPages = imageUrls.count;
    [_collectionView reloadData];
    
    //移动到中间某一位置
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(imageUrls.count *10) inSection:0];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    //开启定时器
    [self removeTimer];
    [self addTimer];
}

+ (instancetype)getMakerCycleView{
    return  (MakerCycleView *)[[NSBundle mainBundle] loadNibNamed:@"MakerCycleView" owner:nil options:nil].firstObject ;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) _collectionView.collectionViewLayout;
    layout.itemSize = _collectionView.bounds.size;
    _collectionView.collectionViewLayout = layout;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"CycleCollectionCell" bundle:nil] forCellWithReuseIdentifier:CycleCellId];
   
}

#pragma mark   ==============UICollectionView代理==============
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageUrls.count * 10000;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CycleCollectionCell *cell = (CycleCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CycleCellId forIndexPath:indexPath];

    NSURL *URL = [NSURL URLWithString:_imageUrls[(indexPath.item % _imageUrls.count)]];
    [cell.icon sd_setImageWithURL:URL];
    cell.titleLbl.text = @"这是标题";
    return  cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = (scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width;
    NSInteger currentIndex = (index % _imageUrls.count);
    _pageControl.currentPage = currentIndex;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

#pragma mark   ==============定时器相关方法==============
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}
- (void)autoScroll
{
    CGFloat offsetX = _collectionView.contentOffset.x + _collectionView.bounds.size.width;
    [_collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
@end















