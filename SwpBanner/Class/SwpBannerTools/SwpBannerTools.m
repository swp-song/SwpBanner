
//
//  SwpBannerTools.m
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBannerTools.h"

@import UIKit;

@implementation SwpBannerTools

/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsGetDefaultNetworkLoadPlaceholderImage ( 获取默认 Placeholder Image )
 *
 *  @return UIImage
 */
+ (UIImage *)swpBannerToolsGetDefaultNetworkLoadPlaceholderImage {
    return [UIImage imageNamed:@"SwpBanner.bundle/SwpBannerPlaceholderImage"];
}


/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsReadInfo  ( 读取 SwpBanner 信息资源文件 )
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)swpBannerToolsReadInfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpBanner.bundle/SwpBanner.plist" ofType:nil]].copy;
}


/**
 *  @author swp_song
 *
 *  @brief  swpBannerToolsReadVersion   ( 读取 SwpBanner 版本号 )
 *
 *  @return NSString
 */
+ (NSString *)swpBannerToolsReadVersion {
    return [self.class swpBannerToolsReadInfo][@"Version"];
}



@end
