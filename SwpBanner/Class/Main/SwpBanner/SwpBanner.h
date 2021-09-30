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
typedef void(^SwpBannerSelected)(SwpBanner *banner, NSIndexPath *indexPath);

@interface SwpBanner : UIView

/* DataSource */
@property (nonatomic, weak) id<SwpBannerDataSource>dataSource;
/* Delegate */
@property (nonatomic, weak) id<SwpBannerDelegate>delegate;
/* 是否自定义成 cell */
@property (nonatomic, assign, getter=isCustomCell) BOOL customCell;
/* 定时时间 */
@property (nonatomic, assign) CGFloat timer;

@property (nonatomic, copy, setter=swpBannerSelected:) SwpBannerSelected bannerSelected;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerInfo   ( 读取 SwpBanner 信息资源文件 )
 *
 *  @return NSDictionary
 */
- (NSDictionary *)info;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerVersion    ( 读取 SwpBanner 版本号 )
 *
 *  @return NSString
 */
- (NSString *)version;

/**
 *  @author swp_song
 *
 *  @brief  dataSource: ( 设置数据源 )
 */
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull))swp_dataSource;

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nullable delegate))swp_delegate;

/**
 *  @author swp_song
 *
 *  @brief  timer   ( 设置定时器 )
 */
- (__kindof SwpBanner * _Nonnull (^)(CGFloat timer))swp_timer;

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
- (__kindof SwpBanner * _Nonnull (^)(BOOL customCell))swp_customCell;

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
 *  @brief  swp_reloadData ( 刷新数据 )
 */
- (__kindof SwpBanner * _Nonnull (^)(void))swp_reloadData;

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
- (__kindof SwpBanner * _Nonnull (^)(Class  _Nonnull cellClass, NSString * _Nonnull identifier))swp_registerClass;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerClick  ( SwpBanner 回调方法，点击每个 Banner 调用  )
 */
- (__kindof SwpBanner * _Nonnull (^)(SwpBannerSelected _Nullable swpBannerSelected))swp_bannerSelected;

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
