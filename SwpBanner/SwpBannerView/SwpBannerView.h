//
//  SwpBannerView.h
//  swp_song
//
//  Created by swp_song on 2018/1/11.
//  Copyright © 2018年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpBannerView, UICollectionView;
NS_ASSUME_NONNULL_BEGIN

@protocol SwpBannerViewDelegate <NSObject>

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:numberOfItemsInSection:    ( SwpBannerView 代理方法，设置每组 cell 返回个数 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  section         section
 *
 *  @return NSInteger
 */
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:cellForItemAtIndexPath:    ( SwpBannerView 代理方法，设置 cell 返回样式 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
- (UICollectionViewCell *)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:cellImageForItemAtIndexPath:  ( SwpBannerView 代理方法，设置显图片 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  indexPath       indexPath
 *
 *  @return id
 */
- (id)swpBannerView:(SwpBannerView *)swpBannerView cellImageForItemAtIndexPath:(NSIndexPath *)indexPath;


@optional

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:numberOfSectionsInCollectionView: ( SwpBannerView 代理方法，设置分组个数 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @return NSInteger
 */
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView numberOfSectionsInCollectionView:(UICollectionView *)collectionView;


/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:loadPlaceholderImageForItemAtIndexPath:   ( SwpBannerView 代理方法，设置站位图片 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  indexPath       indexPath
 *
 *  @return id
 */
- (id)swpBannerView:(SwpBannerView *)swpBannerView loadPlaceholderImageForItemAtIndexPath:(NSIndexPath *)indexPath;


/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:layout:sizeForItemAtIndexPath: ( SwpBannerView 代理方法，设置 cell 宽高 )
 *
 *  @param  swpBannerView           swpBannerView
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  indexPath               indexPath
 *
 *  @return CGSize
 */
- (CGSize)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:didSelectItemAtIndexPath:  ( SwpBannerView 代理方法，cell 点击调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;


#pragma mark - UIScrollView Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewWillBeginDecelerating:  ( SwpBannerView 代理方法，scrollView 开始拖拽的时候调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewDidEndDragging:willDecelerate:  ( SwpBannerView 代理方法，完全停止拖拽的时候调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 *
 *  @param  decelerate      decelerate
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewDidScroll:page: ( SwpBannerView 代理方法，正在滚动时调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 *
 *  @param  page            page
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidScroll:(UIScrollView *)scrollView page:(NSInteger)page;


@end

@interface SwpBannerView : UICollectionView

/**
 *  @author swp_song
 *
 *  @brief  swpBannerViewDelegate   ( 设置代理 )
 */
- (SwpBannerView * _Nonnull (^)(id<SwpBannerViewDelegate> _Nonnull))swpBannerViewDelegate;

/**
 *  @author swp_song
 *
 *  @brief  loadNetworkImage    ( 设置是否加载远程 URL )
 */
- (SwpBannerView * _Nonnull (^)(BOOL))loadNetworkImage;

@end
NS_ASSUME_NONNULL_END
