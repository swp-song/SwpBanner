//
//  SwpBanner.h
//  Swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//
//  @author             --->    swp_song    ( 图片轮播库 )
//  @warning            --->    !!! < swpBannerView 内部实现使用的是 collectionView > !!!
//                      --->    !!! < 如需要自定义 cell 需要 注册 cell 方法已经提供 > !!!


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class SwpBanner;

typedef void(^SwpBannerDidSelectCellBlock)(SwpBanner *SwpBanner, NSIndexPath *indexPath);

/*! swpBannerView DataSource  */
@protocol SwpBannerDataSource <NSObject>

/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:numberOfItemsInSection:   ( 设置 swpBannerView 每个分组显示数据的个数 )
 *
 *  @param  swpBanner
 *
 *  @param  section
 *
 *  @return NSInteger
 */
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section;


/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:cellImageForItemAtIndexPath   ( 设置 swpBannerView 显示默认的cell 显示图片的名称 | 远程 URL )
 *
 *  @param  swpBanner           ( 注意: swpCustomCell 值 为 NO 时 才会调用， swpCustomCell 默认为 NO )
 *
 *  @param  indexPath
 *
 *  @return NSString
 */
- (NSString *)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath;


@optional
/*!
 *  @author swp_song
 *
 *  @brief  swpBannerNmberOfSections    ( 设置 swpBannerView 分组的个数 )
 *
 *  @param  swpBanner
 *
 *  @return NSInteger
 */
- (NSInteger)swpBannerNmberOfSections:(SwpBanner *)swpBanner;


/*!
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:cellForItemAtIndexPath ( 设置 swpBannerView 自定义分组中 cell 显示的数据 | 样式 )
 *
 *  @param  swpBanner
 *
 *  @param  collectionView
 *
 *  @param  indexPath
 *
 *  @return UICollectionViewCell
 */
- (UICollectionViewCell *)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

/*! swpBannerView 代理协议 */
@protocol SwpBannerDelegate <NSObject>

@optional


/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:didSelectItemAtIndexPath: ( swpBannerView 点击每个cell调用 )
 *
 *  @param  swpBanner
 *
 *  @param  indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/*!
 *  @author swp_song, 2015-12-09 16:06:51
 *
 *  @brief  swpBanner:collectionView:layout:sizeForItemAtIndexPath: ( 设置 swpBannerView 每个cell的宽高 )
 *
 *  @param  swpBanner
 *
 *  @param  collectionView
 *
 *  @param  collectionViewLayout
 *
 *  @param  indexPath
 *
 *  @return CGSize
 */
- (CGSize)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SwpBanner : UIView

/*! 设置 swpBanner 数据源属性                               !*/
@property (nonatomic, weak) id<SwpBannerDataSource> dataSource;
/*! 设置 swpBanner 代理属性                                 !*/
@property (nonatomic, weak) id<SwpBannerDelegate> delegate;
/*! 设置 swpBanner 定时时间               default 5s        !*/
@property (nonatomic, assign)  CGFloat swpBannerTime;
/*! 设置 swpBanner 是否自定义cell          default NO       !*/
@property (nonatomic, assign, getter = isSwpBannerCustomCell)        BOOL swpBannerCustomCell;
/*! 设置 swpBanner 是否加载 远程url 图片   default YES      !*/
@property (nonatomic, assign, getter = isSwpBannerLoadNetworkImage)  BOOL swpBannerLoadNetworkImage;
/*! 设置 swpBanner 是否 开启 弹簧效果      default YES      !*/
@property (nonatomic, assign, getter = isSwpBannerBounces)           BOOL swpBannerBounces;
/*! 设置 swpBanner 中 PagesColor 是否 隐藏 default 是 NO    !*/
@property (nonatomic, assign, getter = isSwpBannerPageControlHidden) BOOL swpBannerPageControlHidden;
/*! 设置 swpBanner 中 PagesColor 总页数的颜色               !*/
@property (nonatomic, strong) UIColor *swpNumberOfPagesColor;
/*! 设置 swpBanner 中 PagesColor 当前页数的颜色             !*/
@property (nonatomic, strong) UIColor *swpCurrentPageColor;


#pragma mark - Setting SwpBannerView Propertys Methods
/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerTime:   ( 设置 swpBannerTime 定时时间 )
 *
 *  @param  swpBannerTime       ( default 0.5s )
 */
- (void)setSwpBannerTime:(CGFloat)swpBannerTime;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerCustomCell:     ( 设置 swpBanner 是否自定义cell )
 *
 *  @param  swpBannerCustomCell         ( default NO < YES使用自动cell , NO 使用默认cell > )
 */
- (void)setSwpBannerCustomCell:(BOOL)swpBannerCustomCell;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerLoadNetworkImage:   ( 设置 swpBanner 是否加载远程url )
 *
 *  @param  swpBannerLoadNetworkImage       ( default NO < YES 加载远程 url, NO 加载本地图片 >)
 */
- (void)setSwpBannerLoadNetworkImage:(BOOL)swpBannerLoadNetworkImage;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerBounces:    ( 设置 swpBanner  弹簧效果 )
 *
 *  @param  swpBannerBounces        ( default YES < YES 开启, NO 关闭 > )
 */
- (void)setSwpBannerBounces:(BOOL)swpBannerBounces;

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerPageControlHidden:  (设置 swpBanner 中 PagesColor 是否隐藏 )
 *
 *  @param  swpBannerPageControlHidden      ( default NO <YES 隐藏, NO 显示> )
 */
- (void)setSwpBannerPageControlHidden:(BOOL)swpBannerPageControlHidden;

/*!
 *  @author swp_song
 *
 *  @brief setSwpNumberOfPagesColor:        (设置 swpBanner 中 PagesColor 总页数的颜色 )
 *
 *  @param swpNumberOfPagesColor
 */
- (void)setSwpNumberOfPagesColor:(UIColor *)swpNumberOfPagesColor;


/*!
 *  @author swp_song
 *
 *  @brief setSwpCurrentPageColor:  (设置 swpBanner 中 PagesColor 当前页数的颜色)
 *
 *  @param swpCurrentPageColor
 */
- (void)setSwpCurrentPageColor:(UIColor *)swpCurrentPageColor;

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerRegisterClass:     ( swpBanner 注册一个cell )
 *
 *  @param  cellClass
 *
 *  @param  identifier
 */
- (void)swpBannerRegisterClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerReloadData ( swpBanner 数据刷新 )
 */
- (void)swpBannerReloadData;

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerDidSelectCell: ( 点击每个 cell 回调 )
 *
 *  @param  swpBannerDidSelectCell
 */
- (void)swpBannerDidSelectCell:(SwpBannerDidSelectCellBlock)swpBannerDidSelectCell;

@end

NS_ASSUME_NONNULL_END
