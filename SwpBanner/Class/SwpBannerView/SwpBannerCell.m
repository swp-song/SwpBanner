//
//  SwpBannerCell.m
//  Dream
//
//  Created by Dream on 15/8/10.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "SwpBannerCell.h"

#import "UIImageView+WebCache.h"
#import "SwpBannerUtils.h"

@interface SwpBannerCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *dateTypeErrorMessage;

@end

@implementation SwpBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self config];
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (void)config {
    self.loadNetwork = NO;
}

- (void)setupUI {
    [self.contentView addSubview:self.imageView];
}

- (void)imageView:(UIImageView *)imageView image:(id)image isNetwork:(BOOL)isNetwork placeholderImage:(UIImage *)placeholderImage errorMessage:(NSString *)errorMessage {
    
    if (isNetwork) {
        
        if ([image isKindOfClass:NSString.class]) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:placeholderImage];
        } else if ([image isKindOfClass:UIImage.class]) {
            imageView.image = image;
        } else {
            NSAssert(NO, errorMessage);
        }
        
    } else {
        
        if ([image isKindOfClass:NSString.class]) {
            imageView.image = [UIImage imageNamed:image];
        } else if ([image isKindOfClass:UIImage.class]) {
            imageView.image = image;
        } else {
            NSAssert(NO, errorMessage);
        }
    }
}

- (UIImage *)placeholderImage:(id)placeholderImage isNetwork:(BOOL)isNetwork errorMessage:(NSString *)errorMessage {
    
    if (isNetwork == NO) return nil;
    if (placeholderImage == nil) return placeholderImage;
    
    if ([placeholderImage isKindOfClass:NSString.class]) {
        return [UIImage imageNamed:placeholderImage];
    } else if ([placeholderImage isKindOfClass:UIImage.class]) {
        return placeholderImage;
    } else {
        NSAssert(NO, errorMessage);
    }
    return nil;
}

- (UIImageView *)imageView {
    return !_imageView ? _imageView = ({
        UIImageView.new;
    }) : _imageView;
}

- (NSString *)dateTypeErrorMessage {
    return _dateTypeErrorMessage.length ? _dateTypeErrorMessage : @"Data type error，Please input NSString or UIImage type data";
}

// MARK: - Public: Property
+ (NSString *)identifier {
    return NSStringFromClass(self.class);
}

- (void)setImage:(id)image {
    _image = image;
    
    UIImage *placeholderImage = [self placeholderImage:self.placeholderImage isNetwork:self.loadNetwork errorMessage:self.dateTypeErrorMessage];
    placeholderImage = placeholderImage ? placeholderImage : SwpBannerUtils.swpBannerPlaceholderImage;
    [self imageView:self.imageView image:_image isNetwork:self.loadNetwork placeholderImage:placeholderImage errorMessage:self.dateTypeErrorMessage];
}

// MARK: - Public: Method
+ (instancetype)swpBannerCellWithCollectionView:(UICollectionView *)collectionView forCellReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

// MARK: - Public: Functional
+ (__kindof SwpBannerCell * _Nonnull (^)(UICollectionView * _Nonnull, NSString * _Nonnull, NSIndexPath * _Nonnull))swp_bannerCellinit {
    return ^(UICollectionView *collectionView, NSString *identifier, NSIndexPath *indexPath) {
        return [self.class swpBannerCellWithCollectionView:collectionView forCellReuseIdentifier:identifier forIndexPath:indexPath];
    };
}

- (SwpBannerCell * _Nonnull (^)(id _Nonnull))swp_image {
    return ^(id image) {
        self.image = image;
        return self;
    };
}

- (SwpBannerCell * _Nonnull (^)(id _Nonnull placeholderImage))swp_placeholderImage {
    return ^(id placeholderImage) {
        self.placeholderImage = placeholderImage;
        return self;
    };
}

- (SwpBannerCell * _Nonnull (^)(BOOL loadNetwork))swp_loadNetwork {
    return ^(BOOL loadNetwork) {
        self.loadNetwork = loadNetwork;
        return self;
    };
}

// MARK: -

@end
