//
//  ViewController.m
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/3.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpBannerHeader.h"


@interface ViewController () <SwpBannerDataSource, SwpBannerDelegate>

@property (nonatomic, strong)   SwpBanner *swpBannerView;
@property (nonatomic, copy)     NSArray   *swpBannerDataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.swpBannerView];
    
    // 如果 分页 不显示 需要 调用  swpBannerReloadData 方法
    [self.swpBannerView swpBannerReloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - SwpBanner DataSource Methods
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section {
    return self.swpBannerDataSource.count;
}

- (NSString *)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.swpBannerDataSource[indexPath.item];
}

#pragma mark - SwpBanner Delegate Method
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@" Delegate %ld", indexPath.item);
}

#pragma mark - SwpBanner Block Method
- (void)swpBannerDidSelectCell:(SwpBanner *)swpBanner {
    [self.swpBannerView swpBannerDidSelectCell:^(SwpBanner * _Nonnull SwpBanner, NSIndexPath * _Nonnull indexPath) {
        NSLog(@" Block  %ld", indexPath.item);
    }];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  didButton: ( 按钮点击事件 )
 *
 *  @ param  button
 */
- (IBAction)didButton:(UIButton *)button {
    if (button.tag == 0) [self localLoadPicture];
    if (button.tag == 1) [self networkLoadingPicture];
}


#pragma mark - Tool Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  localLoadPicture ( 加载网络图片 )
 */
- (void)localLoadPicture {
    self.swpBannerView.swpBannerLoadNetworkImage = NO;
    NSArray *array           = @[@"image1", @"image2", @"image3", @"image4"];
    self.swpBannerDataSource = [NSArray arrayWithArray:array];
    [self.swpBannerView swpBannerReloadData];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  networkLoadingPicture  ( 加载网络图片 )
 */
- (void)networkLoadingPicture {
    
    self.swpBannerView.swpBannerLoadNetworkImage = YES;
    NSArray *array = @[
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image1.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image2.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image3.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image4.png",
                       ];
    
    self.swpBannerDataSource = [NSArray arrayWithArray:array];
    [self.swpBannerView swpBannerReloadData];
}

- (CGFloat)swpScreenScale:(CGFloat)screenWidth scaleWidth:(CGFloat)scaleWidth scaleHeight:(CGFloat)scaleHeight {
    return screenWidth / scaleWidth * scaleHeight;
}

#pragma mark - Init UI Methods

- (SwpBanner *)swpBannerView {
    return !_swpBannerView ? _swpBannerView = ({
        SwpBanner *swpBanner = [[SwpBanner alloc ] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, [self swpScreenScale:self.view.frame.size.width scaleWidth:2.0 scaleHeight:1.0])];
        swpBanner.dataSource                = self;
        swpBanner.delegate                  = self;
        swpBanner.swpBannerLoadNetworkImage = NO;
        swpBanner;
    }) : _swpBannerView;
}

#pragma mark - Init Data Methods
- (NSArray *)swpBannerDataSource {
    
    if (!_swpBannerDataSource)  {
        _swpBannerDataSource = @[@"image1", @"image2", @"image3", @"image4"];
    }
    return _swpBannerDataSource;
}


@end
