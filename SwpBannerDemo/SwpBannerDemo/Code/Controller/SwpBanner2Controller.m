//
//  SwpBanner2Controller.m
//  SwpBannerDemo
//
//  Created by Dream on 2021/10/4.
//

#import "SwpBanner2Controller.h"

#import <SwpBanner/SwpBannerHeader.h>

@interface SwpBanner2Controller () <SwpBannerDataSource, SwpBannerDelegate>

@property (nonatomic, weak) IBOutlet SwpBanner *swpBanner;

@property (nonatomic, copy) NSArray *datas;

@end

@implementation SwpBanner2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", SwpBanner.swpBannerinfo);
    NSLog(@"%@", SwpBanner.swpBannerVersion);
    UIColor *totalPageColor     = [UIColor colorWithRed: 16.0 / 255.0 green: 158.0 / 255.0 blue: 220.0 / 255.0 alpha: 1.0];
    UIColor *currentPageColor   = UIColor.orangeColor;
    self.datas = [self localDatas];
    self.swpBanner
        .swp_dataSource(self)
        .swp_delegate(self)
        .swp_totalPageColor(totalPageColor)
        .swp_pageColor(currentPageColor).swp_bannerSelected(^(SwpBanner *banner, NSIndexPath *indexPath) {
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

- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (id)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.datas[indexPath.item];
}


- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s, indexPath = %@ ", __FUNCTION__, indexPath);
}

- (NSArray *)localDatas {
    
    return @[
        [UIImage imageNamed:@"image1"],
        [UIImage imageNamed:@"image2"],
        @"image3",
        @"image4",
    ];
}

- (NSArray *)networkData {
    return @[
        @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image5.png",
        @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image6.png",
        @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image7.png",
        @"https://raw.githubusercontent.com/swp-song/SwpBanner/master/PictureResources/image8.png",
    ];
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
