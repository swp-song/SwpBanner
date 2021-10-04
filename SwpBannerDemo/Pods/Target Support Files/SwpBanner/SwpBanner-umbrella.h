#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SwpBanner.h"
#import "SwpBannerDataSource.h"
#import "SwpBannerDelegate.h"
#import "SwpBannerHeader.h"
#import "SwpBannerUtils.h"
#import "SwpBannerCell.h"
#import "SwpBannerView.h"

FOUNDATION_EXPORT double SwpBannerVersionNumber;
FOUNDATION_EXPORT const unsigned char SwpBannerVersionString[];

