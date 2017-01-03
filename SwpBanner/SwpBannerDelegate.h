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

/*! swpBannerView 代理协议 */
@optional

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:didSelectItemAtIndexPath: ( swpBannerView 点击每个cell调用 )
 *
 *  @ param  swpBanner
 *
 *  @ param  indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:collectionView:layout:sizeForItemAtIndexPath: ( 设置 swpBannerView 每个cell的宽高 )
 *
 *  @ param  swpBanner
 *
 *  @ param  collectionView
 *
 *  @ param  collectionViewLayout
 *
 *  @ param  indexPath
 *
 *  @ return CGSize
 */
- (CGSize)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_END
