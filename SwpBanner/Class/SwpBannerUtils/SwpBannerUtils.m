//
//  SwpBannerUtils.m
//  Dream
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import "SwpBannerUtils.h"

@import UIKit;

@implementation SwpBannerUtils

// MARK: - Public: Property
+ (NSDictionary *)swpBannerinfo {
    return [NSDictionary dictionaryWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"SwpBanner.bundle/SwpBanner.plist" ofType:nil]].copy;
}

+ (NSString *)swpBannerVersion {
    return self.swpBannerinfo[@"Version"];
}

+ (UIImage *)swpBannerPlaceholderImage {
    return [UIImage imageNamed:@"SwpBanner.bundle/SwpBannerPlaceholderImage"];;
}

// MARK: -

@end
