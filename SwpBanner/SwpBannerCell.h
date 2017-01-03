//
//  SwpBannerCell.h
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwpBannerCell : UICollectionViewCell

/*! 显示图片的名称     !*/
@property (nonatomic, copy  ) NSString *imageName;
/*! 是否 加载 远程 url !*/
@property (nonatomic, assign, getter=isLoadNetworkImage) BOOL loadNetworkImage;

/**!
 *  @ author swp_song
 *
 *  @ brief  setImageName:   ( Override setImageName )
 *
 *  @ param  imageName
 */
- (void)setImageName:(NSString *)imageName;

@end
