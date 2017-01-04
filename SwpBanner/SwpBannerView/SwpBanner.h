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

typedef void(^SwpBannerDidSelectCellBlock)(SwpBanner *SwpBanner, NSIndexPath *indexPath);

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
/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpBannerTime:   ( 设置 swpBannerTime 定时时间 )
 *
 *  @ param  swpBannerTime       ( default 0.5s )
 */
- (void)setSwpBannerTime:(CGFloat)swpBannerTime;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpBannerCustomCell:     ( 设置 swpBanner 是否自定义cell )
 *
 *  @ param  swpBannerCustomCell         ( default NO < YES使用自动cell , NO 使用默认cell > )
 */
- (void)setSwpBannerCustomCell:(BOOL)swpBannerCustomCell;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpBannerLoadNetworkImage:   ( 设置 swpBanner 是否加载远程url )
 *
 *  @ param  swpBannerLoadNetworkImage       ( default NO < YES 加载远程 url, NO 加载本地图片 >)
 */
- (void)setSwpBannerLoadNetworkImage:(BOOL)swpBannerLoadNetworkImage;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpBannerBounces:    ( 设置 swpBanner  弹簧效果 )
 *
 *  @ param  swpBannerBounces        ( default YES < YES 开启, NO 关闭 > )
 */
- (void)setSwpBannerBounces:(BOOL)swpBannerBounces;

/**!
 *  @ author swp_song
 *
 *  @ brief  setSwpBannerPageControlHidden:  (设置 swpBanner 中 PagesColor 是否隐藏 )
 *
 *  @ param  swpBannerPageControlHidden      ( default NO <YES 隐藏, NO 显示> )
 */
- (void)setSwpBannerPageControlHidden:(BOOL)swpBannerPageControlHidden;

/**!
 *  @ author swp_song
 *
 *  @ brief setSwpNumberOfPagesColor:        (设置 swpBanner 中 PagesColor 总页数的颜色 )
 *
 *  @ param swpNumberOfPagesColor
 */
- (void)setSwpNumberOfPagesColor:(UIColor *)swpNumberOfPagesColor;


/**!
 *  @ author swp_song
 *
 *  @ brief setSwpCurrentPageColor:  (设置 swpBanner 中 PagesColor 当前页数的颜色)
 *
 *  @ param swpCurrentPageColor
 */
- (void)setSwpCurrentPageColor:(UIColor *)swpCurrentPageColor;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBannerRegisterClass:     ( swpBanner 注册一个cell )
 *
 *  @ param  cellClass
 *
 *  @ param  identifier
 */
- (void)swpBannerRegisterClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBannerReloadData ( swpBanner 数据刷新 )
 */
- (void)swpBannerReloadData;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBannerDidSelectCell: ( 点击每个 cell 回调 )
 *
 *  @ param  swpBannerDidSelectCell
 */
- (void)swpBannerDidSelectCell:(SwpBannerDidSelectCellBlock)swpBannerDidSelectCell;

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBannerGetDefaultNetworkLoadPlaceholderImage: ( 获取默认 Placeholder Image )
 *
 *  @ return UIImage
 */
- (UIImage *)swpBannerGetDefaultNetworkLoadPlaceholderImage;

@end

NS_ASSUME_NONNULL_END
