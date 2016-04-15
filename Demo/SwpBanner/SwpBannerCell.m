//
//  SwpBannerCell.m
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//
//  @author             --->    swp_song

#import "SwpBannerCell.h"

/*! ---------------------- Tool       ---------------------- !*/
#import <SDWebImage/UIImageView+WebCache.h>       // Sd Web Image
/*! ---------------------- Tool       ---------------------- !*/

@interface SwpBannerCell ()

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示 默认 图片轮播 的view !*/
@property (nonatomic, strong) UIImageView *imageView;
/*! ---------------------- UI   Property  ---------------------- !*/

@end

@implementation SwpBannerCell

/*!
 *  @author swp_song
 *
 *  @brief  initWithFrame:  (Override initWithFrame)
 *
 *  @param  frame
 *
 *  @return SwpBannerCell
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addUI];
    }
    return self;
}


/*!
 *  @author swp_song
 *
 *  @brief  layoutSubviews (Override layoutSubviews)
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

/*!
 *  添加控件
 */

/*!
 *  @author swp_song
 *
 *  @brief  addUI ( 添加控件 )
 */
- (void)addUI {
    [self.contentView addSubview:self.imageView];
}

/*!
 *  @author swp_song
 *
 *  @brief  setImageName:   ( Override setImageName )
 *
 *  @param  imageName
 */
- (void)setImageName:(NSString *)imageName {
    _imageName = [imageName copy];
    [self settingData];
}

/*!
 *  @author swp_song
 *
 *  @brief  settingData ( 设置数据 )
 */
- (void) settingData {
    
    if (self.isLoadNetworkImage) {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.imageName] placeholderImage:nil];
    } else {
        self.imageView.image = [UIImage imageNamed:self.imageName];
    }
}

#pragma mark - Init UI Method
- (UIImageView *)imageView {
    
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}


@end
