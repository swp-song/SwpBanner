//
//  SwpBannerDelegate.h
//  Demo
//
//  Created by swp_song on 2017/1/3.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SwpBannerDelegate <NSObject>

/*! SwpBannerView 代理协议 !*/
@optional

/**
 *  @author swp_song
 *
 *  @brief  swpBanner:didSelectItemAtIndexPath: ( SwpBanner 代理方法，点击每个 Cell 调用 )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  indexPath   indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @author swp_song
 *
 *  @brief  swpBanner:collectionView:layout:sizeForItemAtIndexPath: ( SwpBanner 代理方法，设置每个 Cell 的宽高 )
 *
 *  @param  swpBanner               swpBanner
 *
 *  @param  collectionView          collectionView
 *
 *  @param  collectionViewLayout    collectionViewLayout
 *
 *  @param  indexPath               indexPath
 *
 *  @return CGSize
 */
- (CGSize)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @author swp_song
 *
 *  @brief  swpBanner:setNetworkLoadPlaceholderImageCellIndexPath: ( SwpBanner 代理方法，设置网络加载图片 PlaceholderImage )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  indexPath   indexPath
 */
- (id)swpBanner:(SwpBanner *)swpBanner setNetworkLoadPlaceholderImageCellIndexPath:(NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_END
