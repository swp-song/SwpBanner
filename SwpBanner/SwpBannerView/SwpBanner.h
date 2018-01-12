//
//  SwpBanner.h
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SwpBannerDataSource.h"
#import "SwpBannerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^SwpBannerClickBlock)(SwpBanner *SwpBanner, NSIndexPath *indexPath);

@interface SwpBanner : UIView

/**
 *  @author swp_song
 *
 *  @brief  dataSource: ( 设置数据源 )
 */
- (SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull))dataSource;

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nonnull))delegate;

/**
 *  @author swp_song
 *
 *  @brief  timer   ( 设置定时器 )
 */
- (SwpBanner * _Nonnull (^)(CGFloat))timer;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerTimer  ( 设置是否加载网络URL )
 */
- (SwpBanner * _Nonnull (^)(BOOL))isLoadNetworkImage;

/**
 *  @author swp_song
 *
 *  @brief  totalPageColor  ( 设置分页总页数颜色 )
 */
- (SwpBanner * _Nonnull (^)(UIColor * _Nonnull))totalPageColor;

/**
 *  @author swp_song
 *
 *  @brief  currentPageColor    ( 设置分页当前页数颜色 )
 */
- (SwpBanner * _Nonnull (^)(UIColor * _Nonnull))currentPageColor;

/**
 *  @author swp_song
 *
 *  @brief  isCustomCell    ( 设置是否自定义 cell )
 */
- (SwpBanner * _Nonnull (^)(BOOL))isCustomCell;

/**
 *  @author swp_song
 *
 *  @brief  bounces ( 是否开启弹簧效果 )
 */
- (SwpBanner * _Nonnull (^)(BOOL))bounces;

/**
 *  @author swp_song
 *
 *  @brief  pageControlHidden   (  PagesColor 是否隐藏 )
 */
- (SwpBanner * _Nonnull (^)(BOOL))pageControlHidden;

/**
 *  @author swp_song
 *
 *  @brief  reloadData  ( 刷新数据 )
 */
- (void)reloadData;

/**
 *  @author swp_song
 *
 *  @brief  reloadDataChain ( 刷新数据 )
 */
- (SwpBanner * _Nonnull (^)(void))reloadDataChain;

/**
 *  @author swp_song
 *
 *  @brief  registerClass:forCellWithReuseIdentifier:   ( SwpBanner 注册一个 cell )
 *
 *  @param  cellClass   cellClass
 *
 *  @param  identifier  identifier
 */
- (void)registerClass:(Class _Nullable)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

/**
 *  @author swp_song
 *
 *  @brief  registerClass:  ( SwpBanner 注册一个 cell )
 */
- (SwpBanner * _Nonnull (^)(Class  _Nullable __unsafe_unretained, NSString * _Nonnull))registerClass;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerClickBlock:    ( SwpBanner 回调方法，点击每个 Banner 调用  )
 *
 *  @param  swpBannerClickBlock swpBannerClickBlock
 */
- (void)swpBannerClickBlock:(SwpBannerClickBlock _Nullable)swpBannerClickBlock;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerClick  ( SwpBanner 回调方法，点击每个 Banner 调用  )
 */
- (SwpBanner * _Nonnull (^)(SwpBannerClickBlock _Nullable))swpBannerClick;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerGetDefaultNetworkLoadPlaceholderImage: ( 获取默认 Placeholder Image )
 *
 *  @return UIImage
 */
- (UIImage *)swpBannerGetDefaultNetworkLoadPlaceholderImage;



@end

NS_ASSUME_NONNULL_END
