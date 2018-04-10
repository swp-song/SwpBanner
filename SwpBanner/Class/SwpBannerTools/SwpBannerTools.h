//
//  SwpBannerTools.h
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

NS_ASSUME_NONNULL_BEGIN
@interface SwpBannerTools : NSObject

/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsGetDefaultNetworkLoadPlaceholderImage ( 获取默认 Placeholder Image )
 *
 *  @return UIImage
 */
+ (UIImage *)swpBannerToolsGetDefaultNetworkLoadPlaceholderImage;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsReadInfo  ( 读取 SwpBanner 信息资源文件 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpBannerToolsReadInfo;

/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsReadVersion   ( 读取 SwpBanner 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpBannerToolsReadVersion;

@end
NS_ASSUME_NONNULL_END
