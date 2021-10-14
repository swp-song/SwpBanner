//
//  SwpBannerController2.m
//  Example
//
//  Created by Dream on 2021/10/15.
//

#import "SwpBannerController2.h"

#import <SwpBanner/SwpBanner.h>

@interface SwpBannerController2 () <SwpBannerDataSource, SwpBannerDelegate>

@property (nonatomic, weak) IBOutlet SwpBanner *swpBanner;

@property (nonatomic, copy) NSArray *datas;


@end

@implementation SwpBannerController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"swpBannerinfo = %@", SwpBanner.swpBannerinfo);
    NSLog(@"swpBannerVersion = %@", SwpBanner.swpBannerVersion);
    UIColor *totalPageColor = [UIColor colorWithRed: 16.0 / 255.0 green: 158.0 / 255.0 blue: 220.0 / 255.0 alpha: 1.0];
    UIColor *pageColor      = UIColor.orangeColor;
    self.datas = [self localDatas];
    
    self.swpBanner.swp_dataSource(self).swp_delegate(self).swp_totalPageColor(totalPageColor).swp_pageColor(pageColor);
    
    [self swpBannerCallback:self.swpBanner];
}

- (void)swpBannerCallback:(SwpBanner *)swpBanner {
    
//    [swpBanner swpBannerSelected:^(SwpBanner * _Nonnull banner, NSIndexPath * _Nonnull indexPath) {
//        // 注意 Block 循环引用
//        NSLog(@"%s, indexPath = %@ ", __FUNCTION__, indexPath);
//    }];
    
    swpBanner.swp_bannerSelected(^(SwpBanner * _Nonnull banner, NSIndexPath * _Nonnull indexPath) {
        // 注意 Block 循环引用
        NSLog(@"%s, indexPath = %@ ", __FUNCTION__, indexPath);
    });
}

- (IBAction)selectedLoadLocal:(UIButton *)button {
    self.datas = self.localDatas;
    self.swpBanner.swp_loadNetwork(NO).swp_reloadData();
}

- (IBAction)selectedLoadNetwork:(UIButton *)button {
    self.datas = self.networkData;
    self.swpBanner.swp_loadNetwork(YES).swp_reloadData();
}

- (NSArray *)localDatas {
    
    return @[
        [UIImage imageNamed:@"image5"],
        [UIImage imageNamed:@"image6"],
        @"image7",
        @"image8",
    ];
}

- (NSArray *)networkData {
    return @[
        @"https://dream-swp.com/images/SwpBanner/image1.png",
        @"https://dream-swp.com/images/SwpBanner/image2.png",
        @"https://dream-swp.com/images/SwpBanner/image3.png",
        @"https://dream-swp.com/images/SwpBanner/image4.png",
    ];
}

// MARK: - SwpBanner DataSource
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}


- (id)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.datas[indexPath.item];
}

// MARK: - SwpBanner DataSource
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s, indexPath = %@ ", __FUNCTION__, indexPath);
}

- (id)swpBanner:(SwpBanner *)swpBanner loadNetworkPlaceholderImageAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return swpBanner.placeholderImage;
    }
    return @"default_image";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
