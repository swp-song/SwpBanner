//
//  SwpBannerCell.h
//  Dream
//
//  Created by Dream on 15/8/10.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwpBannerCell : UICollectionViewCell

// MARK: - Public: Property
/// Cell Identifier
@property (nonatomic, copy, readonly, class) NSString *identifier;
/// Cell Display Image
@property (nonatomic, copy) id image;
/// loadNetwork = YES, Placeholder Image, Placeholder Image
@property (nonatomic, copy) id placeholderImage;
/// Load Network Image, define = NO
@property (nonatomic, assign, getter=isLoadNetwork) BOOL loadNetwork;

// MARK: - Public: Method

/// Init Cell
/// @param collectionView   collectionView
/// @param identifier       identifier
/// @param indexPath        indexPath
/// @return instancetype
+ (instancetype)swpBannerCellWithCollectionView:(UICollectionView *)collectionView forCellReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/// Init Cell
+ (__kindof SwpBannerCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swp_bannerCellinit;

// MARK: - Public: Functional
/// Cell Display Image
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))swp_image;
/// loadNetwork = YES, Placeholder Image, Placeholder Image
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))swp_placeholderImage;
/// Load Network Image, define = NO
- (SwpBannerCell * _Nonnull (^)(BOOL loadNetwork))swp_loadNetwork;

// MARK: -

@end
NS_ASSUME_NONNULL_END
