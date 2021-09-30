
//
//  SwpBannerUtils.m
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "SwpBannerUtils.h"

@import UIKit;

@implementation SwpBannerUtils

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

+ (NSDictionary *)Info {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpBanner.bundle/SwpBanner.plist" ofType:nil]].copy;
}

+ (NSString *)Version {
    return self.Info[@"Version"];
}

@end
