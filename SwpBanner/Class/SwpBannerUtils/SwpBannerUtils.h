//
//  SwpBannerUtils.h
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

NS_ASSUME_NONNULL_BEGIN
@interface SwpBannerUtils : NSObject

@property (nonatomic, class, copy, readonly) NSDictionary *Info;
@property (nonatomic, class, copy, readonly) NSString *Version;

+ (UIImage *)swpBannerToolsGetDefaultNetworkLoadPlaceholderImage;

@end
NS_ASSUME_NONNULL_END
