//
//  SwpBanner.h
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

/* ---------------------- Tool       ---------------------- */
#import "SwpBannerDataSource.h"
#import "SwpBannerDelegate.h"
/* ---------------------- Tool       ---------------------- */

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const kSwpBannerPageControlViewHeight;

/**
 *  @author swp_song
 *
 *  @brief  SwpBannerClickBlock ( 回调参数 )
 *
 *  @param  SwpBanner   SwpBanner
 *
 *  @param  indexPath   indexPath
 */
typedef void(^SwpBannerClickBlock)(SwpBanner *SwpBanner, NSIndexPath *indexPath);

@interface SwpBanner : UIView

/**
 *  @author swp_song
 *
 *  @brief  swpBannerInfo   ( 读取 SwpBanner 信息资源文件 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)swpBannerInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerVersion    ( 读取 SwpBanner 版本号 )
 *
 *  @return NSString
 */
- (NSString *)swpBannerVersion;

/**
 *  @author swp_song
 *
 *  @brief  dataSource: ( 设置数据源 )
 */
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull))dataSource;

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nonnull))delegate;

/**
 *  @author swp_song
 *
 *  @brief  timer   ( 设置定时器 )
 */
- (__kindof SwpBanner * _Nonnull (^)(CGFloat))timer;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerTimer  ( 设置是否加载网络URL )
 */
- (__kindof SwpBanner * _Nonnull (^)(BOOL))isLoadNetworkImage;

/**
 *  @author swp_song
 *
 *  @brief  totalPageColor  ( 设置分页总页数颜色 )
 */
- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull))totalPageColor;

/**
 *  @author swp_song
 *
 *  @brief  currentPageColor    ( 设置分页当前页数颜色 )
 */
- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull))currentPageColor;

/**
 *  @author swp_song
 *
 *  @brief  isCustomCell    ( 设置是否自定义 cell )
 */
- (__kindof SwpBanner * _Nonnull (^)(BOOL))isCustomCell;

/**
 *  @author swp_song
 *
 *  @brief  bounces ( 是否开启弹簧效果 )
 */
- (__kindof SwpBanner * _Nonnull (^)(BOOL))bounces;

/**
 *  @author swp_song
 *
 *  @brief  pageControlHidden   (  PagesColor 是否隐藏 )
 */
- (__kindof SwpBanner * _Nonnull (^)(BOOL))pageControlHidden;

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
- (__kindof SwpBanner * _Nonnull (^)(void))reloadDataChain;

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
- (__kindof SwpBanner * _Nonnull (^)(Class  _Nullable __unsafe_unretained, NSString * _Nonnull))registerClass;

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
- (__kindof SwpBanner * _Nonnull (^)(SwpBannerClickBlock _Nullable))swpBannerClick;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerGetDefaultNetworkLoadPlaceholderImage: ( 获取默认 Placeholder Image )
 *
 *  @return UIImage
 */
- (UIImage *)swpBannerGetDefaultNetworkLoadPlaceholderImage;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerBackgroundColor: ( 设置背景颜色 )
 *
 *  @param  color   color
 */
- (void)swpBannerBackgroundColor:(UIColor * _Nullable)color;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerBackgroundColor    ( 设置背景颜色 )
 */
- (__kindof SwpBanner * _Nonnull (^)(UIColor *_Nullable ))swpBannerBackgroundColor;


@end

NS_ASSUME_NONNULL_END
