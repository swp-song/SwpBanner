//
//  SwpBannerDelegate.h
//  Dream
//
//  Created by swp_song on 2017/1/3.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpBanner;

NS_ASSUME_NONNULL_BEGIN
@protocol SwpBannerDelegate <NSObject>

@optional

/// SwpBanner 代理方法，点击每个 Cell 调用
/// @param swpBanner swpBanner
/// @param indexPath indexPath
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/// SwpBanner 代理方法，设置每个 Cell 的宽高
/// @param swpBanner        swpBanner
/// @param collectionView   collectionView
/// @param layout           layout
/// @param indexPath        indexPath
/// @return CGSize
- (CGSize)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/// SwpBanner 代理方法，设置每个 cell 上左下右边距
/// @param swpBanner        swpBanner
/// @param collectionView   collectionView
/// @param layout           layout
/// @param section          section
/// @return UIEdgeInsets
- (UIEdgeInsets)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout insetForSectionAtIndex:(NSInteger)section;

/// SwpBanner 代理方法，设置网络加载图片 PlaceholderImage
/// @param swpBanner    swpBanner
/// @param indexPath    indexPath
/// @return NSString or UIImage
- (id)swpBanner:(SwpBanner *)swpBanner loadNetworkPlaceholderImageAtIndexPath:(NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_END
