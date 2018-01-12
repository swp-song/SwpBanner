//
//  SwpBanner.m
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//

#import "SwpBanner.h"

/* ---------------------- Tool       ---------------------- */
#import "SwpBannerTools.h"              //  工具
/* ---------------------- Tool       ---------------------- */

/* ---------------------- Model      ---------------------- */
/* ---------------------- Model      ---------------------- */

/* ---------------------- View       ---------------------- */
#import "SwpBannerView.h"
#import "SwpBannerCell.h"           //  默认轮播显示的cell
/* ---------------------- View       ---------------------- */

#define PAGE_HEIGHT 20.0


@interface SwpBanner () <SwpBannerViewDelegate>


#pragma mark - UI   Propertys
/* ---------------------- UI   Property ---------------------- */
/* 显示图片的 view */
@property (nonatomic, strong) SwpBannerView *swpBannerView;
/* 显示图片分页的view */
@property (nonatomic, strong) UIPageControl *swpBannerPageControlView;
/* ---------------------- UI   Property ---------------------- */

#pragma mark - Data Propertys
/* ---------------------- Data Property ---------------------- */
/* DataSource */
@property (nonatomic, weak) id<SwpBannerDataSource>dataSource_;
/* Delegate */
@property (nonatomic, weak) id<SwpBannerDelegate>delegate_;
/* 定时器 */
@property (nonatomic, assign) CGFloat   swpBannerTimer_;
/* 是否自定义成 cell */
@property (nonatomic, assign, getter = isCustomCell_) BOOL customCell_;
/* section */
@property (nonatomic, assign) NSInteger section;
/* section */
@property (nonatomic, copy, setter = swpBannerClickBlock:) SwpBannerClickBlock swpBannerClickBlock;
/* ---------------------- Data Property ---------------------- */

@end


@implementation SwpBanner

/**
 *  @author swp_song
 *
 *  @brief  initWithFrame:  ( Override Init )
 *
 *  @param  frame   frame
 *
 *  @return UIView
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.swpBannerView.swpBannerViewDelegate(self).loadNetworkImage(YES);
        
        [self addUI];
        
        [self setInitData];
    }
    return self;
}

/**
 *  @ author swp_song
 *
 *  @ brief  layoutSubviews (Override layoutSubviews)
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.swpBannerView.frame             = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.swpBannerPageControlView.frame  = CGRectMake(0, self.frame.size.height - PAGE_HEIGHT, self.frame.size.width, PAGE_HEIGHT);
}


#pragma mark - Set Init Data Method
/**
 *  @ author swp_song
 *
 *  @ brief  setInitData    ( 设置初始化数据 )
 */
- (void)setInitData {
    
    self.bounces(YES);
    
    self.isCustomCell(NO);
    
    self.pageControlHidden(NO);

    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource_ swpBanner:self numberOfItemsInSection:self.section];

    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;
}


#pragma mark - Set UI Methods
/**
 *  @ author swp_song
 *
 *  @ brief  addUI ( 添加 UI 控件 )
 */
- (void)addUI {
    [self addSubview:self.swpBannerView];
    [self addSubview:self.swpBannerPageControlView];
}

#pragma mark - SwpBannerView delegate_ Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:numberOfSectionsInCollectionView: ( SwpBannerView 代理方法，设置分组个数 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @return NSInteger
 */
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if ([self.dataSource_ respondsToSelector:@selector(swpBannerNmberOfSections:)]) {
        return [self.dataSource_ swpBannerNmberOfSections:self];
    }
    return 1;
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:numberOfItemsInSection:    ( SwpBannerView 代理方法，设置每组 cell 返回个数 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  section         section
 *
 *  @return NSInteger
 */
- (NSInteger)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.section = section;
    return [self.dataSource_ swpBanner:self numberOfItemsInSection:section];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:cellForItemAtIndexPath:    ( SwpBannerView 代理方法，设置 cell 返回样式 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 *
 *  @return UICollectionViewCell
 */
- (UICollectionViewCell *)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.isCustomCell_) {
        return nil;
    } else {
        return [self.dataSource_ swpBanner:self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:cellImageForItemAtIndexPath:  ( SwpBannerView 代理方法，设置显图片 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  indexPath       indexPath
 *
 *  @return id
 */
- (id)swpBannerView:(SwpBannerView *)swpBannerView cellImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource_ swpBanner:self cellImageForItemAtIndexPath:indexPath];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:loadPlaceholderImageForItemAtIndexPath:   ( SwpBannerView 代理方法，设置站位图片 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  indexPath       indexPath
 *
 *  @return id
 */
- (id)swpBannerView:(SwpBannerView *)swpBannerView loadPlaceholderImageForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate_ swpBanner:self setNetworkLoadPlaceholderImageCellIndexPath:indexPath];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:collectionView:didSelectItemAtIndexPath:  ( SwpBannerView 代理方法，cell 点击调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  collectionView  collectionView
 *
 *  @param  indexPath       indexPath
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (self.swpBannerClickBlock) self.swpBannerClickBlock(self, indexPath);
    
    if ([self.delegate_ respondsToSelector:@selector(swpBanner:didSelectItemAtIndexPath:)]) {
        [self.delegate_ swpBanner:self didSelectItemAtIndexPath:indexPath];
    }
    
}

#pragma mark - UIScrollView Methods
/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewWillBeginDecelerating:  ( SwpBannerView 代理方法，scrollView 开始拖拽的时候调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    //  开始滚动
    [self _beginScroll];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewDidEndDragging:willDecelerate:  ( SwpBannerView 代理方法，完全停止拖拽的时候调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 *
 *  @param  decelerate      decelerate
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //  停止滚动
    [self _stopScroll];
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerView:scrollViewDidScroll:page: ( SwpBannerView 代理方法，正在滚动时调用 )
 *
 *  @param  swpBannerView   swpBannerView
 *
 *  @param  scrollView      scrollView
 *
 *  @param  page            page
 */
- (void)swpBannerView:(SwpBannerView *)swpBannerView scrollViewDidScroll:(UIScrollView *)scrollView page:(NSInteger)page {
    self.swpBannerPageControlView.currentPage = page;
}




#pragma mark - Tools Methods
/**
 *  @author swp_song
 *
 *  @brief  _scrollAndPageControl   ( 设置图片滚动，分页属性 )
 */
- (void)_scrollAndPageControl {
    
    
    //  移除自动滚动防止内存泄露
    [self _stopScroll];
    
    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource_ swpBanner:self numberOfItemsInSection:self.section];
    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;
    
    //  设置图片位置为第一张图片位置
    [self _imageCollectionViewScrollScrollLocation:YES];
    
    //  启动自动滚动
    [self _beginScroll];
}

/**
 *  @author swp_song
 *
 *  @brief  _beginScroll    ( 开始滚动 )
 */
- (void)_beginScroll {
    self.swpBannerTimer_ = self.swpBannerTimer_ == 0 ? 5.0 : self.swpBannerTimer_;
    [self performSelector:@selector(_nextImage) withObject:nil afterDelay:self.swpBannerTimer_];
}

/**
 *  @author swp_song
 *
 *  @brief _stopScroll  ( 停止滚动 )
 */
- (void)_stopScroll {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(_nextImage) object:nil];
}

/**
 *  @author swp_song
 *
 *  @brief  _nextImage  ( 自动滚动 )
 */
- (void)_nextImage {
    
    [self _stopScroll];
    
    [self _imageCollectionViewScrollScrollLocation:NO];
    
    [self _beginScroll];
}


/**
 *  @author swp_song
 *
 *  @brief  _imageCollectionViewScrollScrollLocation:   ( 设置图片的 cell 的滚动位置，需要图片初始化 到第一张图片 YES 是初始化到第一张图片 NO 是不需要 )
 *
 *  @param  initLocation    initLocation
 */
- (void)_imageCollectionViewScrollScrollLocation:(BOOL)initLocation  {
    
    //  是否实现了数据源方法
    if (([self.dataSource_ respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource_ respondsToSelector:@selector(swpBanner:cellImageForItemAtIndexPath:)]) ||  ([self.dataSource_ respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource_ respondsToSelector:@selector(swpBanner:collectionView:cellForItemAtIndexPath:)])) {
        
        NSIndexPath *currentIndexPath = [[self.swpBannerView indexPathsForVisibleItems] lastObject];
        // initLocation 值为 YES 给 nextItem 赋 初始值 = 0 回到第一张图片
        NSInteger   nextItem          = initLocation ? 0 : currentIndexPath.item + 1;
        NSInteger   nextSection       = currentIndexPath.section;
        // initLocation 值为 NO 需要 判断 nextItem == 等于数据源 数组的长度，等于回到第一张图片
        if (!initLocation) {
            nextItem = nextItem == [self.dataSource_ swpBanner:self numberOfItemsInSection:self.section] ? 0 : nextItem;
        }
        // 数据源返回的 数组 是否 为 0
        if ([self.dataSource_ swpBanner:self numberOfItemsInSection:self.section] != 0) {
            NSIndexPath *nextIndexPath    = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
            [self.swpBannerView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }
    }
}

#pragma mark - Set SwpBanner Propertys Methods
/**
 *  @author swp_song
 *
 *  @brief  dataSource: ( 设置数据源 )
 */
- (SwpBanner * _Nonnull (^)(id<SwpBannerDataSource> _Nonnull))dataSource {
    return ^(id<SwpBannerDataSource>dataSource) {
        self.dataSource_ = dataSource;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  delegate    ( 设置代理 )
 */
- (SwpBanner * _Nonnull (^)(id<SwpBannerDelegate> _Nonnull))delegate {
    return ^(id<SwpBannerDelegate>delegate) {
        self.delegate_ = delegate;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  timer   ( 设置定时器 )
 */
- (SwpBanner * _Nonnull (^)(CGFloat))timer {
    
    return ^(CGFloat swpBannerTimer) {
        self.swpBannerTimer_ = swpBannerTimer;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  swpBannerTimer  ( 设置是否加载网络URL )
 */
- (SwpBanner * _Nonnull (^)(BOOL))isLoadNetworkImage {
    
    return ^(BOOL isLoadNetworkImage) {
        self.swpBannerView.loadNetworkImage(isLoadNetworkImage);
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  totalPageColor  ( 设置分页总页数颜色 )
 */
- (SwpBanner * _Nonnull (^)(UIColor * _Nonnull))totalPageColor {
    return ^(UIColor *color) {
        self.swpBannerPageControlView.pageIndicatorTintColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  currentPageColor    ( 设置分页当前页数颜色 )
 */
- (SwpBanner * _Nonnull (^)(UIColor * _Nonnull))currentPageColor {
    
    return ^(UIColor *color) {
        self.swpBannerPageControlView.currentPageIndicatorTintColor = color;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  isCustomCell    ( 设置是否自定义 cell )
 */
- (SwpBanner * _Nonnull (^)(BOOL))isCustomCell {
    
    return ^(BOOL isCustomCell) {
        self.customCell_ = isCustomCell;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  bounces ( 是否开启弹簧效果 )
 */
- (SwpBanner * _Nonnull (^)(BOOL))bounces {
    return ^(BOOL bounces) {
        self.swpBannerView.bounces = bounces;
        return self;
    };
}

/**
 *  @author swp_song
 *
 *  @brief  pageControlHidden   (  PagesColor 是否隐藏 )
 */
- (SwpBanner * _Nonnull (^)(BOOL))pageControlHidden {
    return ^(BOOL pageControlHidden) {
        self.swpBannerPageControlView.hidden = pageControlHidden;
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  reloadData  ( 刷新数据 )
 */
- (void)reloadData {
    [self.swpBannerView reloadData];
    [self _scrollAndPageControl];
}

/**
 *  @author swp_song
 *
 *  @brief  reloadDataChain ( 刷新数据 )
 */
- (SwpBanner * _Nonnull (^)(void))reloadDataChain {
    return ^(void) {
        [self reloadData];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  registerClass:forCellWithReuseIdentifier:   ( SwpBanner 注册一个 cell )
 *
 *  @param  cellClass   cellClass
 *
 *  @param  identifier  identifier
 */
- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.swpBannerView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}


/**
 *  @author swp_song
 *
 *  @brief  registerClass:  ( SwpBanner 注册一个 cell )
 */
- (SwpBanner * _Nonnull (^)(Class  _Nonnull __unsafe_unretained, NSString * _Nonnull))registerClass {
    
    return ^(Class cellClass, NSString *identifier) {
        [self registerClass:cellClass forCellWithReuseIdentifier:identifier];
        return self;
    };
}


/**
 *  @author swp_song
 *
 *  @brief  swpBannerClickBlock:    ( SwpBanner 回调方法，点击每个 Banner 调用  )
 *
 *  @param  swpBannerClickBlock swpBannerClickBlock
 */
- (void)swpBannerClickBlock:(SwpBannerClickBlock)swpBannerClickBlock {
    _swpBannerClickBlock = swpBannerClickBlock;
}


/**
 *  @author swp_song
 *
 *  @brief  swpBannerClick  ( SwpBanner 回调方法，点击每个 Banner 调用  )
 */
- (SwpBanner * _Nonnull (^)(SwpBannerClickBlock))swpBannerClick {
    
    return ^(SwpBannerClickBlock swpBannerClickBlock) {
        _swpBannerClickBlock = swpBannerClickBlock;
        return self;
    };
}

/**
 *  @ author swp_song
 *
 *  @ brief  swpBannerGetDefaultNetworkLoadPlaceholderImage: ( 获取默认 Placeholder Image )
 *
 *  @ return UIImage
 */
- (UIImage *)swpBannerGetDefaultNetworkLoadPlaceholderImage {
    return [SwpBannerTools swpBannerToolsGetDefaultNetworkLoadPlaceholderImage];
}




#pragma mark - Init UI Methods

- (SwpBannerView *)swpBannerView {
    return !_swpBannerView ? _swpBannerView = ({
        SwpBannerView *swpBannerView = [SwpBannerView new];
        swpBannerView;
    }) : _swpBannerView;
}

- (UIPageControl *)swpBannerPageControlView {
    
    return !_swpBannerPageControlView ? _swpBannerPageControlView = ({
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.pageIndicatorTintColor        = [UIColor blackColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        pageControl.enabled                       = YES;
        pageControl;
    }) : _swpBannerPageControlView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
