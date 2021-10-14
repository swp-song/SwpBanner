//
//  SwpBannerUtils.h
//  Dream
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

NS_ASSUME_NONNULL_BEGIN
@interface SwpBannerUtils : NSObject

// MARK: - Public: Property
/// SwpBanner Bundle Path
@property (nonatomic, class, copy, readonly) NSString *bundlePath;
/// SwpBanner Info
@property (nonatomic, class, copy, readonly) NSDictionary *swpBannerinfo;
/// SwpBanner Version
@property (nonatomic, class, copy, readonly) NSString *swpBannerVersion;
/// SwpBanner Placeholder Image
@property (nonatomic, class, copy, readonly) UIImage *swpBannerPlaceholderImage;
// MARK: -

@end
NS_ASSUME_NONNULL_END
