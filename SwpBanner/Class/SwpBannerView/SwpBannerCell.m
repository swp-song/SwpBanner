//
//  SwpBannerCell.m
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import "SwpBannerCell.h"

/* ---------------------- Tool       ---------------------- */
#import "UIImageView+WebCache.h"        //  SdWebImage
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
/* ---------------------- View       ---------------------- */


@interface SwpBannerCell ()

#pragma mark - UI   Propertys
/* ---------------------- UI   Property  ---------------------- */
/* 显示轮播图片 view */
@property (nonatomic, strong) UIImageView *imageView;
/* ---------------------- UI   Property  ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property  ---------------------- */
/* 显示轮播图片 */
@property (nonatomic, copy) id image_;
/* 显示远程加载 Url 站位图片 */
@property (nonatomic, copy) UIImage *placeholderImage_;
/* 是否远程加载图片 */
@property (nonatomic, assign, getter = isLoadNetworkImage_) BOOL loadNetworkImage_;
/* ---------------------- Data Property  ---------------------- */

@end

@implementation SwpBannerCell

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @return UICollectionViewCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addUI];
    }
    return self;
}


/**
 *  @author swp_song
 *
 *  @brief  layoutSubviews  ( Override layoutSubviews )
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

/**
 *  @author swp_song
 *
 *  @brief  addUI ( 添加控件 )
 */
- (void)addUI {
    [self.contentView addSubview:self.imageView];
}


/**
 *  @author swp_song
 *
 *  @brief  setData ( 设置数据 )
 */
- (void)setData {
    
    if (self.isLoadNetworkImage_) {
        
        if ([self.image_ isKindOfClass:NSString.class]) {
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.image_] placeholderImage:self.placeholderImage_];
        } else if ([self.image_ isKindOfClass:UIImage.class]) {
            
            self.imageView.image = self.image_;
            
        } else {
            NSAssert(NO, @"数据格式错误，请传入 NSString 或者 UIImage 类型数据");
        }
        
    } else {
        
        if ([self.image_ isKindOfClass:NSString.class]) {
            self.imageView.image = [UIImage imageNamed:self.image_];
        } else if ([self.image_ isKindOfClass:UIImage.class]) {
            self.imageView.image = self.image_;
        } else {
            NSAssert(NO, @"数据格式错误，请传入 NSString 或者 UIImage 类型数据");
        }
    }
}

#pragma mark - Public Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBannerCellWithCollectionView:forCellReuseIdentifier:forIndexPath:    ( 快速初始化一个 Cell )
 *
 *  @param  collectionView  collectionView
 *
 *  @param  identifier      identifier
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
+ (instancetype)swpBannerCellWithCollectionView:(UICollectionView *)collectionView forCellReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerCellInit   ( 快速初始化一个 Cell )
 */
+ (__kindof SwpBannerCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swpBannerCellInit {
    return ^(UICollectionView *collectionView, NSString *identifier, NSIndexPath *indexPath) {
        return [self.class swpBannerCellWithCollectionView:collectionView forCellReuseIdentifier:identifier forIndexPath:indexPath];
    };
}

/**
 *  @author swp_song
 *
 *  @brief  image   ( 设置图片 )
 */
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))image {
    
    return ^(id image) {
        self.image_ = image;
        [self setData];
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  placeholderImage   ( 设置站位图片 )
 */
- (SwpBannerCell * _Nonnull (^)(id _Nonnull))placeholderImage {
    
    return ^(id image) {
        
        if ([image isKindOfClass:NSString.class]) {
            self.placeholderImage_ = [UIImage imageNamed:image];
        } else if ([image isKindOfClass:UIImage.class]) {
            self.placeholderImage_ = image;
        } else {
            NSAssert(NO, @"数据格式错误，请传入 NSString 或者 UIImage 类型数据");
        }
        
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  loadNetworkImage    ( 设置是否加载网络图片 )
 */
- (SwpBannerCell * _Nonnull (^)(BOOL))loadNetworkImage {
    
    return ^(BOOL loadNetworkImage) {
        self.loadNetworkImage_ = loadNetworkImage;
        return self;
    };
}

#pragma mark - Init UI Method
- (UIImageView *)imageView {
    return !_imageView ? _imageView = ({
        [UIImageView new];
    }) : _imageView;
}


@end
