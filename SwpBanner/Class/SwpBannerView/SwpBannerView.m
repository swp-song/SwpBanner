//
//  SwpBannerView.m
//  swp_song
//
//  Created by swp_song on 2018/1/11.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import "SwpBannerView.h"

/* ---------------------- View       ---------------------- */
#import "SwpBannerCell.h"
/* ---------------------- View       ---------------------- */


static CGFloat const kItemLineSpacing      = 0; //  cell Item 上下的间距
static CGFloat const kItemInteritemSpacing = 0; //  cell Item 左右的间距
static CGFloat const kItemLRPadding        = 0; //  cell Item 左右的边距
static CGFloat const kItemTBPadding        = 0; //  cell Item 上下的边距

@interface SwpBannerView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>


#pragma mark - UI   Propertys
/* ---------------------- UI   Property ---------------------- */
/* 布局 */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
/* ---------------------- UI   Property ---------------------- */
#pragma mark - Data Propertys
/* ---------------------- Data Property ---------------------- */
/* Delegate */
@property (nonatomic, weak) id<SwpBannerViewDelegate>swpBannerViewDelegate_;
@property (nonatomic, getter = isLoadNetworkImage_) BOOL loadNetworkImage_;
/* ---------------------- Data Property ---------------------- */

@end

@implementation SwpBannerView


/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:collectionViewLayout:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @param  layout  layout
 *
 *  @return UICollectionView
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:self.flowLayout]) {
        [self registerClass:SwpBannerCell.class forCellWithReuseIdentifier:NSStringFromClass(SwpBannerCell.class)];
        self.backgroundColor                = [UIColor whiteColor];
        self.dataSource                     = self;
        self.delegate                       = self;
        self.pagingEnabled                  = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator   = NO;
    }
    return self;
}

#pragma mark - UICollectionView DataSoure Methods
/**
 *  @author swp_song
 *
 *  @brief  numberOfSectionsInCollectionView:   ( UICollectionView 数据源方法，设置 collectionView 分组个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:numberOfSectionsInCollectionView:)]) {
        return [self.swpBannerViewDelegate_ swpBannerView:self numberOfSectionsInCollectionView:collectionView];
    }
    return 1;
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:numberOfItemsInSection:  ( UICollectionView 数据源方法，设置 collectionView 分组中 cell 显示的个数 )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  section         section
 *
 *  @return NSInteger       NSInteger
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.swpBannerViewDelegate_ swpBannerView:self collectionView:collectionView numberOfItemsInSection:section];
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:cellForItemAtIndexPath:  ( UICollectionView 数据源方法，设置 collectionView 分组中 cell 显示的数据 | 样式 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  indexPath               indexPath
 *
 *  @return UICollectionViewCell    UICollectionViewCell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [self.swpBannerViewDelegate_ swpBannerView:self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    if (!cell) {
        
        id image            = [self.swpBannerViewDelegate_ swpBannerView:self cellImageForItemAtIndexPath:indexPath];
        id placeholderImage = [self.swpBannerViewDelegate_ swpBannerView:self loadPlaceholderImageForItemAtIndexPath:indexPath];
        
        return SwpBannerCell
        .swpBannerCellInit(collectionView, NSStringFromClass(SwpBannerCell.class), indexPath)
        .loadNetworkImage(self.loadNetworkImage_)
        .placeholderImage(placeholderImage)
        .image(image);
    }
    
    return cell;
}

#pragma mark - UICollectionView Delegate Methods
/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:insetForSectionAtIndex:   ( UICollectionView 代理方法，设置 collectionView 每个 cell 上左下右边距 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  section                 section
 *
 *  @return UIEdgeInsets            UIEdgeInsets
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(kItemTBPadding, kItemLRPadding, kItemTBPadding, kItemLRPadding);
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:layout:sizeForItemAtIndexPath:   ( UICollectionView 代理方法，设置 collectionView  每个cell的宽高 )
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  indexPath               indexPath
 *
 *  @return CGSize
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [self.swpBannerViewDelegate_ swpBannerView:self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}

/**
 *  @author swp_song
 *
 *  @brief  collectionView:didSelectItemAtIndexPath:    ( UICollectionView 代理方法 cell 点击回调  )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:collectionView:didSelectItemAtIndexPath:)]) {
        [self.swpBannerViewDelegate_ swpBannerView:self collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - UIScrollView 
/**
 *  @author swp_song
 *
 *  @brief  scrollViewWillBeginDecelerating:    ( UIScrollView 代理方法，开始拖拽的时候调用 )
 *
 *  @param  scrollView  scrollView
 */
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:scrollViewWillBeginDecelerating:)]) {
        [self.swpBannerViewDelegate_ swpBannerView:self scrollViewWillBeginDecelerating:scrollView];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidEndDragging:willDecelerate:    ( UIScrollView 代理方法，完全停止拖拽的时候调用 )
 *
 *  @param  scrollView  scrollView
 *
 *  @param  decelerate  decelerate
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:scrollViewDidEndDragging:willDecelerate:)]) {
        [self.swpBannerViewDelegate_ swpBannerView:self scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  scrollViewDidScroll:    ( UIScrollView 代理方法，正在滚动时调用 )
 *
 *  @param  scrollView  scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger page = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    if ([self.swpBannerViewDelegate_ respondsToSelector:@selector(swpBannerView:scrollViewDidScroll:page:)]) {
        [self.swpBannerViewDelegate_ swpBannerView:self scrollViewDidScroll:scrollView page:page];
    }
}


#pragma mark - Public Methods

/**
 *  @author swp_song
 *
 *  @brief  swpBannerViewDelegate   ( 设置代理 )
 */
- (SwpBannerView * _Nonnull (^)(id<SwpBannerViewDelegate> _Nonnull))swpBannerViewDelegate {
    return ^(id<SwpBannerViewDelegate>swpBannerViewDelegate) {
        self.swpBannerViewDelegate_ = swpBannerViewDelegate;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  loadNetworkImage    ( 设置是否加载远程 URL )
 */
- (SwpBannerView * _Nonnull (^)(BOOL))loadNetworkImage {
    
    return ^(BOOL loadNetworkImage) {
        self.loadNetworkImage_ = loadNetworkImage;
        return self;
    };
}

#pragma mark - Init UI Methods
- (UICollectionViewFlowLayout *)flowLayout {
    
    return !_flowLayout ? _flowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing          = kItemLineSpacing;
        flowLayout.minimumInteritemSpacing     = kItemInteritemSpacing;
        flowLayout;
    }) : _flowLayout;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
