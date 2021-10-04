//
//  SwpBannerUtils.m
//  Dream
//
//  Created by swp_song on 2017/1/4.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import "SwpBannerUtils.h"
#import "SwpBanner.h"

@implementation SwpBannerUtils


+ (NSString *)bundlePath {
    return [[NSBundle bundleForClass:SwpBanner.class] pathForResource:@"SwpBanner.bundle" ofType:nil];
}

// MARK: - Public: Property
+ (NSDictionary *)swpBannerinfo {
    NSString *path = [NSString stringWithFormat:@"%@/%@", self.class.bundlePath, @"SwpBanner.plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path].copy;
}

+ (NSString *)swpBannerVersion {
    return self.swpBannerinfo[@"Version"];
}

+ (UIImage *)swpBannerPlaceholderImage {
    NSString *path = [NSString stringWithFormat:@"%@/%@", self.class.bundlePath, @"SwpBannerPlaceholderImage"];
    return [UIImage imageNamed:path];
}

// MARK: -

@end
