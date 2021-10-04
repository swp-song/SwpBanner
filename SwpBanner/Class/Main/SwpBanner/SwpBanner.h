//
//  SwpBanner.h
//  Dream
//
//  Created by Dream on 15/8/10.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SwpBannerDataSource.h"
#import "SwpBannerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const kSwpBannerPageControlViewHeight;

typedef void(^SwpBannerSelected)(SwpBanner *banner, NSIndexPath *indexPath);

@interface SwpBanner : UIView

// MARK: - Public: Property
/// SwpBanner Info
@property (nonatomic, copy, readonly) NSDictionary *swpBannerinfo;
/// SwpBanner Version
@property (nonatomic, copy, readonly) NSString *swpBannerVersion;
/// SwpBanner DataSource
@property (nonatomic, weak) id<SwpBannerDataSource>dataSource;
/// SwpBanner Delegate
@property (nonatomic, weak) id<SwpBannerDelegate>delegate;
/// Custom Cell, Define = NO
@property (nonatomic, assign, getter=isCustomCell) BOOL customCell;
/// Load Network image, Define = NO
@property (nonatomic, assign, getter=loadNetwork) BOOL loadNetwork;
/// Page Control View Total Page Color
@property (nonatomic, copy) UIColor *totalPageColor;
/// Page Control View Current Page Color
@property (nonatomic, copy) UIColor *pageColor;
/// loadNetworkImage = YES, Placeholder Image
@property (nonatomic, copy, readonly) UIImage *placeholderImage;
/// Timing
@property (nonatomic, assign) CGFloat timer;
/// Spring style
@property (nonatomic, assign, getter=isBounces) BOOL bounces;
/// Page Control View Hidden
@property (nonatomic, assign, getter=isPageControlHidden) BOOL pageControlHidden;

// MARK: - Public: Property Callback
/// Click SwpBanner Callback
@property (nonatomic, copy, nullable, setter=swpBannerSelected:) SwpBannerSelected bannerSelected;

// MARK: - Public: Method
/// Reload Data
- (void)reloadData;

/// Register Cell
/// @param cellClass    cellClass
/// @param identifier   identifier
- (void)registerClass:(Class _Nullable)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

// MARK: - Public: Functional
/// SwpBanner DataSource
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull))swp_dataSource;
/// SwpBanner DataSource
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nullable delegate))swp_delegate;
/// Custom Cell, Define = NO
- (__kindof SwpBanner * _Nonnull (^)(BOOL customCell))swp_customCell;
/// Load Network image, Define = NO
- (__kindof SwpBanner * _Nonnull (^)(BOOL loadNetworkImage))swp_loadNetwork;
/// Page Control View Total Page Color
- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull totalPageColor))swp_totalPageColor;
/// Page Control View Current Page Color
- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull))swp_pageColor;
/// Timing
- (__kindof SwpBanner * _Nonnull (^)(CGFloat timer))swp_timer;
/// Page Control View Hidden
- (__kindof SwpBanner * _Nonnull (^)(BOOL pageControlHidden))swp_pageControlHidden;
/// Spring style
- (__kindof SwpBanner * _Nonnull (^)(BOOL bounces))swp_bounces;

/// Reload Data
- (__kindof SwpBanner * _Nonnull (^)(void))swp_reloadData;

/// Register Cell
- (__kindof SwpBanner * _Nonnull (^)(Class  _Nonnull cellClass, NSString * _Nonnull identifier))swp_registerClass;

/// Set BackgroundColor
- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nullable backgroundColor))swp_backgroundColor;

// MARK: - Public: Functional Callback
- (__kindof SwpBanner * _Nonnull (^)(SwpBannerSelected _Nullable swpBannerSelected))swp_bannerSelected;
// MARK: - 

@end

NS_ASSUME_NONNULL_END
