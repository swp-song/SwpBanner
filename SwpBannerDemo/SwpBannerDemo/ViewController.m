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
#import <SwpBanner/SwpBannerHeader.h>
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
@property (nonatomic, strong) SwpBanner         *swpBanner;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
@property (nonatomic, copy  ) NSArray   *dataSource;
/*! ---------------------- Data Property  ---------------------- !*/

@end

@implementation ViewController

#pragma mark - Lifecycle Methods
/**
 *  @author swp_song
 *
 *  @brief  viewDidLoad ( 视图载入完成, 调用 )
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"SwpBannerInfo       = %@", self.swpBanner.swpBannerInfo);
    NSLog(@"SwpBannerVersion    = %@", self.swpBanner.swpBannerVersion);
    
    self.swpBanner.delegate(self).dataSource(self);
    
    [self setUI];
    
    [self setData];
    
    [self swpBannerClickBlock:self.swpBanner];
    
}

/**
 *  @author swp_song
 *
 *  @brief  viewWillAppear: ( 将要加载出视图调用 )
 *
 *  @param  animated    animated
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidAppear:  ( 视图显示窗口时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  viewWillDisappear:  ( 视图即将消失, 被覆盖, 隐藏时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
}

/**
 *  @author swp_song
 *
 *  @brief  viewDidDisappear:   ( 视图已经消失, 被覆盖, 隐藏时调用 )
 *
 *  @param  animated    animated
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/**
 *  @author swp_song
 *
 *  @brief  didReceiveMemoryWarning ( 内存不足时调用 )
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  @author swp_song
 *
 *  @brief  dealloc ( 当前控制器被销毁时调用 )
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}


#pragma mark - Set Data Method
/**
 *  @author swp_song
 *
 *  @brief  setData ( 设置 初始化 数据 )
 */
- (void)setData {
    
    self.swpBanner.reloadDataChain();
}

#pragma mark - Set UI Methods
/**
 *  @author swp_song
 *
 *  @brief  setUI   ( 设置 UI 控件 )
 */
- (void)setUI {
    
    [self setUpUI];
    [self setUIAutoLayout];
}

/**
 *  @author swp_song
 *
 *  @brief  setUpUI ( 添加控件 )
 */
- (void)setUpUI {

    [self.view addSubview:self.swpBanner];
}

/**
 *  @author swp_song
 *
 *  @brief  setUIAutoLayout ( 设置控件的自动布局 )
 */
- (void)setUIAutoLayout {
    
    [self.swpBanner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.networkImageButton.mas_bottom).offset(100);
        make.width.equalTo(self.swpBanner.mas_height).multipliedBy(2.0 / 1.0);
    }];
}

/**
 *  @author swp_song
 *
 *  @brief  didButton:  ( 按钮点击事件 )
 *
 *  @param  button  button
 */
- (IBAction)didButton:(UIButton *)button {
    if (button.tag == 0) [self localLoadPicture];
    if (button.tag == 1) [self networkLoadingPicture];
}



#pragma mark - SwpBanner DataSource Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBanner:numberOfItemsInSection:   ( SwpBanner 数据源方法，设置 SwpBanner 每个分组显示数据的个数 )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  section     section
 *
 *  @return NSInteger
 */
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

/**
 *  @author swp_song
 *
 *  @brief  swpBanner:cellImageForItemAtIndexPath:  ( SwpBanner 数据源方法，设置 SwpBanner 显示默认的 Cell 显示图片的名称 | 远程 URL，注意: swpCustomCell 值 为 NO 时 才会调用， swpCustomCell 默认为 NO )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  indexPath   indexPath
 *
 *  @return id
 */
- (NSString *)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataSource[indexPath.item];
}

#pragma mark - SwpBanner Delegate Method
/**
 *  @author swp_song
 *
 *  @brief  swpBanner:didSelectItemAtIndexPath: ( SwpBanner 代理方法，点击每个 Cell 调用 )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  indexPath   indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@" Delegate %ld", indexPath.item);
}

/**
 *  @author swp_song
 *
 *  @brief  swpBanner:loadNetworkPlaceholderImageAtIndexPath:   ( SwpBanner 代理方法，设置网络加载图片 PlaceholderImage )
 *
 *  @param  swpBanner   swpBanner
 *
 *  @param  indexPath   indexPath
 */
- (id)swpBanner:(SwpBanner *)swpBanner loadNetworkPlaceholderImageAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        return [swpBanner swpBannerGetDefaultNetworkLoadPlaceholderImage];
    }
    return @"default_image";
}

#pragma mark - SwpBanner Block Method
/**
 *  @author swp_song
 *
 *  @brief  swpBannerClickBlock:    ( SwpBanner Block 回调 )
 *
 *  @param  swpBanner   swpBanner
 */
- (void)swpBannerClickBlock:(SwpBanner *)swpBanner {
    
//    [swpBanner swpBannerClickBlock:^(SwpBanner * _Nonnull SwpBanner, NSIndexPath * _Nonnull indexPath) {
//        // 注意 Block 循环引用
//        NSLog(@" Block  %ld", indexPath.item);
//    }];
    
    swpBanner.swpBannerClick(^(SwpBanner *swpBanner, NSIndexPath *indexPath){
        // 注意 Block 循环引用
        NSLog(@" Block  %ld", indexPath.item);
    });
}

#pragma mark - Tool Methods
/**
 *  @author swp_song
 *
 *  @brief  localLoadPicture ( 加载网络图片 )
 */
- (void)localLoadPicture {
    
    UIColor *totalPageColor     = [UIColor orangeColor];
    UIColor *currentPageColor   = [UIColor colorWithRed: 16.0 / 255.0 green: 158.0 / 255.0 blue: 220.0 / 255.0 alpha: 1.0];

    self.swpBanner.isLoadNetworkImage(NO).totalPageColor(totalPageColor).currentPageColor(currentPageColor);
    
    UIImage *image1 = [UIImage imageNamed:@"image1"];
    UIImage *image2 = [UIImage imageNamed:@"image2"];
    NSArray *array  = @[image1, image2, @"image3", @"image4"];
    self.dataSource = [NSArray arrayWithArray:array];
    self.swpBanner.reloadDataChain();
}

/**
 *  @author swp_song
 *
 *  @brief  networkLoadingPicture  ( 加载网络图片 )
 */
- (void)networkLoadingPicture {
    
    UIColor *totalPageColor     = [UIColor colorWithRed: 16.0 / 255.0 green: 158.0 / 255.0 blue: 220.0 / 255.0 alpha: 1.0];
    UIColor *currentPageColor   = [UIColor orangeColor];
    
    self.swpBanner.isLoadNetworkImage(YES).totalPageColor(totalPageColor).currentPageColor(currentPageColor);
    NSArray *array = @[
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image5.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image6.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image7.png",
                       @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image8.png",
                       ];
    self.dataSource = [NSArray arrayWithArray:array];
    self.swpBanner.reloadDataChain();
}

#pragma mark - Init UI Methods
- (SwpBanner *)swpBanner {
    return !_swpBanner ? _swpBanner = ({
        [SwpBanner new].isLoadNetworkImage(NO);
    }) : _swpBanner;
}

#pragma mark - Init Data Methods
- (NSArray *)dataSource {
    return !_dataSource ? _dataSource = ({
        UIImage *image1 = [UIImage imageNamed:@"image1"];
        UIImage *image2 = [UIImage imageNamed:@"image2"];
        @[image1, image2, @"image3", @"image4"];
    }) : _dataSource;
}


@end
