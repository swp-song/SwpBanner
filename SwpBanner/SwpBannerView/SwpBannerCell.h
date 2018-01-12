//
//  SwpBannerCell.h
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpBannerCell : UICollectionViewCell


/**
 *  @author swp_song
 *
 *  @brief  swpBannerCellWithCollectionView:forCellReuseIdentifier:forIndexPath:    ( 快速初始化一个 Cell )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  identifier      identifier
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
+ (instancetype)swpBannerCellWithCollectionView:(UICollectionView *)collectionView forCellReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerCellInit   ( 快速初始化一个 Cell )
 */
+ (__kindof SwpBannerCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swpBannerCellInit;

/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置图片 )
 */
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))image;


/**
 *  @author swp_song
 *
 *  @brief  placeholderImage   ( 设置站位图片 )
 */
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))placeholderImage;

/**
 *  @author swp_song
 *
 *  @brief  loadNetworkImage    ( 设置是否加载网络图片 )
 */
- (SwpBannerCell * _Nonnull (^)(BOOL))loadNetworkImage;


@end
NS_ASSUME_NONNULL_END
