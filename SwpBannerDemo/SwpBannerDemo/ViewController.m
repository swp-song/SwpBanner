//
//  ViewController.m
//  SwpBannerDemo
//
//  Created by swp_song on 2017/1/3.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"


/*! ---------------------- Tool       ---------------------- !*/
#import <Masonry/Masonry.h>
#import "SwpBannerHeader.h"
/*! ---------------------- Tool       ---------------------- !*/

/*! ---------------------- Model      ---------------------- !*/
/*! ---------------------- Model      ---------------------- !*/

/*! ---------------------- View       ---------------------- !*/
/*! ---------------------- View       ---------------------- !*/

/*! ---------------------- Controller ---------------------- !*/
/*! ---------------------- Controller ---------------------- !*/


@interface ViewController () <SwpBannerDataSource, SwpBannerDelegate>


#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
@property (nonatomic, weak  ) IBOutlet UIButton *localImageButton;
@property (nonatomic, weak  ) IBOutlet UIButton *networkImageButton;
@property (nonatomic, strong) SwpBanner         *swpBannerView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
@property (nonatomic, copy  ) NSArray   *swpBannerDataSource;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation ViewController

#pragma mark - Lifecycle Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  viewDidLoad ( 视图载入完成 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    
    [self setData];
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  viewWillAppear: ( 将要加载出视图 调用)
 *
 *  @ param  animated
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

/**!
 *  @ author swp_song
 *
 *  @ brief  viewDidAppear: ( 视图 显示 窗口时 调用 )
 *
 *  @ param  animated
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/**!
 *  @ author swp_song
 *
 *  @ brief viewWillDisappear: ( 视图  即将消失、被覆盖或是隐藏时调用 )
 *
 *  @ param animated
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
}

/**!
 *  @ author swp_song
 *
 *  @ brief  viewDidDisappear: ( 视图已经消失、被覆盖或是隐藏时调用 )
 *
 *  @ param  animated
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/**!
 *  @author swp_song
 *
 *  @brief  didReceiveMemoryWarning ( 内存不足时 调用 )
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**!
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前 控制器 被销毁时 调用 )
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}


#pragma mark - Set Data Method
/**!
 *  @author swp_song
 *
 *  @brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {
    
    [self.swpBannerView swpBannerReloadData];
}

#pragma mark - Set UI Methods
/**!
 *  @author swp_song
 *
 *  @brief  setUI ( 设置 UI 控件 )
 */
- (void)setUI {
    
    [self setUpUI];
    [self setUIAutoLayout];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {

    [self.view addSubview:self.swpBannerView];
}

/**!
 *  @ author swp_song
 *
 *  @ brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.swpBannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.networkImageButton.mas_bottom).offset(100);
        make.width.equalTo(self.swpBannerView.mas_height).multipliedBy(2.0 / 1.0);
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



#pragma mark - SwpBanner DataSource Methods
/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:numberOfItemsInSection:   (  SwpBanner 数据源方法 设置 轮播显示数量 )
 *
 *  @ param  swpBanner
 *
 *  @ param  section
 *
 *  @ return NSInteger
 */
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section {
    return self.swpBannerDataSource.count;
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:cellImageForItemAtIndexPath: ( 设置 SwpBanner 显示默认的cell 显示图片的名称 | 远程 URL )
 *
 *  @ param  swpBanner
 *
 *  @ param  indexPath
 *
 *  @ return NSString
 */
- (NSString *)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.swpBannerDataSource[indexPath.item];
}

#pragma mark - SwpBanner Delegate Method
/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:didSelectItemAtIndexPath: ( SwpBanner 代理方法 点击 每张轮播 图片 调用 )
 *
 *  @ param  swpBanner
 *
 *  @ param  indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@" Delegate %ld", indexPath.item);
}

/**!
 *  @ author swp_song
 *
 *  @ brief  swpBanner:setNetworkLoadPlaceholderImageCellIndexPath: ( SwpBanner 代理方法 设置 网络加载图片 PlaceholderImage )
 *
 *  @ param  swpBanner
 *
 *  @ param  indexPath
 *
 *  @ return UIImage
 */
- (UIImage *)swpBanner:(SwpBanner *)swpBanner setNetworkLoadPlaceholderImageCellIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return [swpBanner swpBannerGetDefaultNetworkLoadPlaceholderImage];
    }
    return [UIImage imageNamed:@"default_image"];
}

#pragma mark - SwpBanner Block Method
/**!
 *  @ author swp_song
 *
 *  @ brief  swpBannerDidSelectCell: ( SwpBanner Block 回调 )
 *
 *  @ param  swpBanner
 */
- (void)swpBannerDidSelectCell:(SwpBanner *)swpBanner {
    
    // swpBannerView 回调
    [self.swpBannerView swpBannerDidSelectCell:^(SwpBanner * _Nonnull SwpBanner, NSIndexPath * _Nonnull indexPath) {
        // 注意 Block 循环 引用
        NSLog(@" Block  %ld", indexPath.item);
    }];
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

#pragma mark - Init UI Methods
- (SwpBanner *)swpBannerView {
    return !_swpBannerView ? _swpBannerView = ({
        SwpBanner *swpBanner                = [SwpBanner new];
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
