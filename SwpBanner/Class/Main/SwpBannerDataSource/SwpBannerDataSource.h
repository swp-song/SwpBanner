//
//  SwpBannerDataSource.h
//  Dream
//
//  Created by swp_song on 2017/1/3.
//  Copyright © 2017年 Dream. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SwpBanner, UICollectionView, UICollectionViewCell;

NS_ASSUME_NONNULL_BEGIN

@protocol SwpBannerDataSource <NSObject>

/// SwpBanner 数据源方法，设置 SwpBanner 每个分组显示数据的个数
/// @param swpBanner    swpBanner
/// @param section      section
/// @return NSInteger
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section;

/// SwpBanner 数据源方法，设置 SwpBanner 显示默认的 Cell 显示图片的名称 | 远程 URL，
/// 注意: customCell 值 为 NO 时 才会调用， customCell 默认为 NO
/// @param swpBanner    swpBanner
/// @param indexPath    indexPath
/// @return NSSting or UIImage
- (id)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/// SwpBanner 数据源方法，设置 SwpBanner 分组的个数
/// @param swpBanner    swpBanner
/// @return section
- (NSInteger)swpBannerNmberOfSections:(SwpBanner *)swpBanner;

/// SwpBanner 数据源方法，设置 SwpBanner 自定义分组中 cell 显示的数据 | 样式
/// @param  swpBanner       swpBanner
/// @param  collectionView  collectionView
/// @return UICollectionViewCell or UICollectionViewCell Subclass
- (UICollectionViewCell *)swpBanner:(SwpBanner *)swpBanner collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
