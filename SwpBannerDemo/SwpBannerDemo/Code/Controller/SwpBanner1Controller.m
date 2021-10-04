//
//  SwpBanner1Controller.m
//  SwpBannerDemo
//
//  Created by Dream on 2021/10/4.
//

#import "SwpBanner1Controller.h"

@interface SwpBanner1Controller ()

@property (nonatomic, copy) NSArray *datas;

@end

@implementation SwpBanner1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
