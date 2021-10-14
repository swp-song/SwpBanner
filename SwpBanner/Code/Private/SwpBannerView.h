//
//  SwpBannerView.h
//  Dream
//
//  Created by Dream on 2018/1/11.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwpBannerView, UICollectionView;
NS_ASSUME_NONNULL_BEGIN

@protocol SwpBannerViewDelegate <NSObject>

/// SwpBannerView 代理方法，设置每组 cell 返回个数
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @param section          section
/// @return NSInteger
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

/// SwpBannerView 代理方法，设置 cell 返回样式
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @param indexPath        indexPath
/// @return UICollectionViewCell
- (UICollectionViewCell *)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

/// SwpBannerView 代理方法，设置显图片
/// @param swpBannerView    swpBannerView
/// @param indexPath        indexPath
/// @return NSString or UIImage
- (id)swpBannerView:(SwpBannerView *)swpBannerView cellImageForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/// SwpBannerView 代理方法，设置分组个数
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @return NSInteger
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

/// SwpBannerView 代理方法，设置站位图片
/// @param swpBannerView    swpBannerView
/// @param indexPath        indexPath
/// @return NSString or UIImage
- (id)swpBannerView:(SwpBannerView *)swpBannerView loadPlaceholderImageForItemAtIndexPath:(NSIndexPath *)indexPath;

/// SwpBannerView 代理方法，设置 cell Size
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @param layout           layout
/// @param indexPath        indexPath
/// @return CGSize
- (CGSize)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/// SwpBannerView 代理方法，设置 cell Edge
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @param layout           layout
/// @param section          section
- (UIEdgeInsets)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout insetForSectionAtIndex:(NSInteger)section;

/// SwpBannerView 代理方法，cell 点击调用
/// @param swpBannerView    swpBannerView
/// @param collectionView   collectionView
/// @param indexPath        indexPath
- (void)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

// MARK: - UIScrollView Delegate Methods

/// SwpBannerView 代理方法，scrollView 开始拖拽的时候调用
/// @param swpBannerView    swpBannerView
/// @param scrollView       scrollView
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;

/// SwpBannerView 代理方法，完全停止拖拽的时候调用
/// @param swpBannerView    swpBannerView
/// @param scrollView       scrollView
/// @param decelerate       decelerate
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

/// SwpBannerView 代理方法，正在滚动时调用
/// @param swpBannerView    swpBannerView
/// @param scrollView       scrollView
/// @param page             page
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidScroll:(UIScrollView *)scrollView page:(NSInteger)page;

@end

@interface SwpBannerView : UICollectionView

// MARK: - Public: Property
/// Cell define Size
@property (nonatomic, assign, readonly) CGSize size;
/// Cell define Edge
@property (nonatomic, assign, readonly) UIEdgeInsets padding;
/// Cell define E
@property (nonatomic, getter=loadNetwork) BOOL loadNetwork;
/// Custom Cell, Define = YES, Placeholder Image
@property (nonatomic, weak) id<SwpBannerViewDelegate>swpBannerViewDelegate;

// MARK: - Public: Functional
/// SwpBannerView Delegate
- (SwpBannerView * _Nonnull (^)(id<SwpBannerViewDelegate> _Nullable swpBannerViewDelegate))swp_bannerViewDelegate;
/// SwpBannerView Delegate
- (SwpBannerView * _Nonnull (^)(BOOL loadNetworkImage))swp_loadNetwork;

// MARK: -

@end
NS_ASSUME_NONNULL_END
