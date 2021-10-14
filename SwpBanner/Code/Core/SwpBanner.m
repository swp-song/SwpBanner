//
//  SwpBanner.m
//  Dream
//
//  Created by Dream on 15/8/10.
//  Copyright (c) 2015年 Dream. All rights reserved.
//

#import "SwpBanner.h"

#import "SwpBannerUtils.h"
#import "SwpBannerView.h"
#import "SwpBannerCell.h"

CGFloat const kSwpBannerPageControlViewHeight = 20.0;

@interface SwpBanner () <SwpBannerViewDelegate>

@property (nonatomic, strong) SwpBannerView *swpBannerView;
@property (nonatomic, strong) UIPageControl *swpBannerPageControlView;
@property (nonatomic, assign) NSInteger section;

@end

@implementation SwpBanner

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self config];
    }
    return self;
}

- (void)dealloc {
 
    [self _stopScroll];
    [self.swpBannerPageControlView removeTarget:self action:@selector(selected:) forControlEvents:(UIControlEventValueChanged)];
}

- (void)config {
    [self setupUI];
    
    [self setInitData];
    
    [self.swpBannerPageControlView addTarget:self action:@selector(selected:) forControlEvents:(UIControlEventValueChanged)];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.swpBannerView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.swpBannerPageControlView.frame  = CGRectMake(0, self.frame.size.height - kSwpBannerPageControlViewHeight, self.frame.size.width, kSwpBannerPageControlViewHeight);
}

- (void)setInitData {
    
    self.swp_bounces(YES).swp_customCell(NO).swp_pageControlHidden(NO);

    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource swpBanner:self numberOfItemsInSection:self.section];

    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;
    
}

- (void)setupUI {
    [self addSubview:self.swpBannerView];
    [self addSubview:self.swpBannerPageControlView];
}

// MARK: - SwpBannerView DataSource
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if ([self.dataSource respondsToSelector:@selector(swpBannerNmberOfSections:)]) {
        return [self.dataSource swpBannerNmberOfSections:self];
    }
    return 1;
}


- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.section = section;
    self.swpBannerPageControlView.numberOfPages = [self.dataSource swpBanner:self numberOfItemsInSection:section];
    return self.swpBannerPageControlView.numberOfPages;
}


- (UICollectionViewCell *)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.isCustomCell) {
        return nil;
    } else {
        return [self.dataSource swpBanner:self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}

- (id)swpBannerView:(SwpBannerView *)swpBannerView cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource swpBanner:self cellImageForItemAtIndexPath:indexPath];
}


- (id)swpBannerView:(SwpBannerView *)swpBannerView loadPlaceholderImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(swpBanner:loadNetworkPlaceholderImageAtIndexPath:)]) {
        
        id image = [self.delegate swpBanner:self loadNetworkPlaceholderImageAtIndexPath:indexPath];
        
        if (image != nil) return image;
        
        return self.placeholderImage;
    }
    
    return self.placeholderImage;
}

- (CGSize)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(swpBanner:collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [self.delegate swpBanner:self collectionView:swpBannerView layout:layout sizeForItemAtIndexPath:indexPath];
    }
    return swpBannerView.size;
}

- (UIEdgeInsets)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout insetForSectionAtIndex:(NSInteger)section {

    if ([self.delegate respondsToSelector:@selector(swpBanner:collectionView:layout:insetForSectionAtIndex:)]) {
        return [self.delegate swpBanner:self collectionView:swpBannerView layout:layout insetForSectionAtIndex:section];
    }
    return swpBannerView.padding;
}

// MARK: - SwpBannerView Delegate
- (void)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.bannerSelected) self.bannerSelected(self, indexPath);
    if ([self.delegate respondsToSelector:@selector(swpBanner:didSelectItemAtIndexPath:)]) {
        [self.delegate swpBanner:self didSelectItemAtIndexPath:indexPath];
    }
}

// MARK:  UIScrollView Methods
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    //  开始滚动
    [self _beginScroll];
}


- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //  停止滚动
    [self _stopScroll];
}


- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidScroll:(UIScrollView *)scrollView page:(NSInteger)page {
    self.swpBannerPageControlView.currentPage = page;
}

// MARK: - Tools Method
- (void)_scrollAndPageControl {
    
    
    //  移除自动滚动防止内存泄露
    [self _stopScroll];
    
    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource swpBanner:self numberOfItemsInSection:self.section];
    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;
    
    //  设置图片位置为第一张图片位置
    [self _imageCollectionViewScrollScrollLocation:YES];
    
    //  启动自动滚动
    [self _beginScroll];
}


- (void)_beginScroll {
    self.timer = self.timer == 0 ? 5.0 : self.timer;
    [self performSelector:@selector(_nextImage) withObject:nil afterDelay:self.timer];
}

- (void)_stopScroll {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(_nextImage) object:nil];
}

- (void)_nextImage {
    
    [self _stopScroll];
    
    [self _imageCollectionViewScrollScrollLocation:NO];
    
    [self _beginScroll];
}

- (void)_imageCollectionViewScrollScrollLocation:(BOOL)initLocation  {
    
    //  是否实现了数据源方法
    if (([self.dataSource respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource respondsToSelector:@selector(swpBanner:cellImageForItemAtIndexPath:)]) ||
        ([self.dataSource respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource respondsToSelector:@selector(swpBanner:collectionView:cellForItemAtIndexPath:)])) {
        
        NSIndexPath *currentIndexPath = [[self.swpBannerView indexPathsForVisibleItems] lastObject];
        // initLocation 值为 YES 给 nextItem 赋 初始值 = 0 回到第一张图片
        NSInteger   nextItem          = initLocation ? 0 : currentIndexPath.item + 1;
        NSInteger   nextSection       = currentIndexPath.section;
        // initLocation 值为 NO 需要 判断 nextItem == 等于数据源 数组的长度，等于回到第一张图片
        if (!initLocation) {
            nextItem = nextItem == [self.dataSource swpBanner:self numberOfItemsInSection:self.section] ? 0 : nextItem;
        }
        // 数据源返回的 数组 是否 为 0
        if ([self.dataSource swpBanner:self numberOfItemsInSection:self.section] != 0) {
            NSIndexPath *nextIndexPath    = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
            [self.swpBannerView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }
    }
}

- (void)selected:(UIPageControl *)pageControl {
    [self _stopScroll];
    [self.swpBannerView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:pageControl.currentPage inSection:self.section] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
    [self _beginScroll];
}

- (SwpBannerView *)swpBannerView {
    return !_swpBannerView ? _swpBannerView = ({
        SwpBannerView.new.swp_loadNetwork(NO).swp_bannerViewDelegate(self);
    }) : _swpBannerView;
}

- (UIPageControl *)swpBannerPageControlView {
    
    return !_swpBannerPageControlView ? _swpBannerPageControlView = ({
        UIPageControl *pageControl = UIPageControl.new;
        pageControl.pageIndicatorTintColor        = UIColor.blackColor;
        pageControl.currentPageIndicatorTintColor = UIColor.redColor;
//        pageControl.allowsContinuousInteraction = YES;
//        pageControl.backgroundStyle             = UIPageControlInteractionStateContinuous;
        pageControl.enabled                     = YES;
        pageControl;
    }) : _swpBannerPageControlView;
}

// MARK: - Public Property
+ (NSDictionary *)swpBannerinfo {
    return SwpBannerUtils.swpBannerinfo;
}

- (NSDictionary *)swpBannerinfo {
    return self.class.swpBannerinfo;
}

+ (NSString *)swpBannerVersion {
    return SwpBannerUtils.swpBannerVersion;
}

- (NSString *)swpBannerVersion {
    return self.class.swpBannerVersion;
}

- (void)setLoadNetwork:(BOOL)loadNetwork {
    _loadNetwork = loadNetwork;
    self.swpBannerView.swp_loadNetwork(_loadNetwork);
}

- (void)setTotalPageColor:(UIColor *)totalPageColor {
    _totalPageColor = totalPageColor;
    self.swpBannerPageControlView.pageIndicatorTintColor = _totalPageColor;
}

- (void)setPageColor:(UIColor *)pageColor {
    _pageColor = pageColor;
    self.swpBannerPageControlView.currentPageIndicatorTintColor = _pageColor;
}

- (void)setBounces:(BOOL)bounces {
    _bounces = bounces;
    self.swpBannerView.bounces = _bounces;
}


- (void)setPageControlHidden:(BOOL)pageControlHidden {
    _pageControlHidden = pageControlHidden;
    self.swpBannerPageControlView.hidden = _pageControlHidden;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    super.backgroundColor = self.swpBannerView.backgroundColor = backgroundColor;
}

- (UIImage *)placeholderImage {
    return SwpBannerUtils.swpBannerPlaceholderImage;
}

// MARK: - Public: Method
- (void)reloadData {
    [self.swpBannerView reloadData];
    [self _scrollAndPageControl];
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.swpBannerView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

// MARK: - Public: Functional
- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull dataSource))swp_dataSource {
    return ^(id<SwpBannerDataSource>dataSource) {
        self.dataSource = dataSource;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nullable delegate))swp_delegate {
    return ^(id<SwpBannerDelegate>delegate) {
        self.delegate = delegate;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(CGFloat timer))swp_timer {
    return ^(CGFloat timer) {
        self.timer = timer;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(BOOL loadNetwork))swp_loadNetwork {
    return ^(BOOL loadNetwork) {
        self.loadNetwork = loadNetwork;
        return self;
    };
}


- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull totalPageColor))swp_totalPageColor {
    return ^(UIColor *totalPageColor) {
        self.totalPageColor = totalPageColor;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nonnull pageColor))swp_pageColor {
    
    return ^(UIColor *pageColor) {
        self.pageColor = pageColor;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(BOOL customCell))swp_customCell {
    
    return ^(BOOL customCell) {
        self.customCell = customCell;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(BOOL bounces))swp_bounces {
    return ^(BOOL bounces) {
        self.bounces = bounces;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(BOOL pageControlHidden))swp_pageControlHidden {
    return ^(BOOL pageControlHidden) {
        self.pageControlHidden = pageControlHidden;
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(void))swp_reloadData {
    return ^(void) {
        [self reloadData];
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(Class  _Nonnull cellClass, NSString * _Nonnull identifier))swp_registerClass {
    return ^(Class  _Nonnull cellClass, NSString * _Nonnull identifier) {
        [self registerClass:cellClass forCellWithReuseIdentifier:identifier];
        return self;
    };
}

- (__kindof SwpBanner * _Nonnull (^)(UIColor * _Nullable backgroundColor))swp_backgroundColor {
    return ^(UIColor *backgroundColor) {
        self.backgroundColor = backgroundColor;
        return self;
    };
}

// MARK: - Public: Functional Callback
- (__kindof SwpBanner * _Nonnull (^)(SwpBannerSelected _Nullable bannerSelected))swp_bannerSelected {
    
    return ^(SwpBannerSelected bannerSelected) {
        self.bannerSelected = bannerSelected;
        return self;
    };
}

// MARK: -

@end
