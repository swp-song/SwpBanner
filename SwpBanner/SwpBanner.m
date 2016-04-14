//
//  SwpBanner.m
//  swp_song
//
//  Created by swp_song on 15/8/10.
//  Copyright (c) 2015年 swp_song. All rights reserved.
//
//  @author             --->    swp_song    ( 图片轮播库 )
//  @warning            --->    !!! < swpBannerView 内部实现使用的是 collectionView > !!!
//                      --->    !!! < 如需要自定义 cell 需要 注册 cell 方法已经提供 > !!!

#import "SwpBanner.h"

/*! ---------------------- View       ---------------------- !*/
#import "SwpBannerCell.h"        // 默认轮播显示的cell
/*! ---------------------- View       ---------------------- !*/

#define PAGE_HEIGHT 20.0

static NSString *const swpBannerCellID = @"swpBannerCellID";

@interface SwpBanner () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

#pragma mark - UI   Propertys
/*! ---------------------- UI   Property  ---------------------- !*/
/*! 显示图片的 view                   */
@property (nonatomic, strong) UICollectionView *swpBannerView;
/*! 显示图片分页的view                */
@property (nonatomic, strong) UIPageControl    *swpBannerPageControlView;
/*! ---------------------- UI   Property  ---------------------- !*/

#pragma mark - Data Propertys
/*! ---------------------- Data Property  ---------------------- !*/
/*! 记录 UICollectionView 的 section  */
@property (nonatomic, assign) NSInteger         section;
@property (nonatomic, copy, setter = swpBannerDidSelectCell:) SwpBannerDidSelectCellBlock    swpBannerDidSelectCell;
/*! ---------------------- Data Property  ---------------------- !*/

@end


@implementation SwpBanner

/*!
 *  @author swp_song
 *
 *  @brief  init    ( Override init )
 *
 *  @return SwpBanner
 */

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self settingInitData];

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
    
    self.swpBannerView.frame             = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.swpBannerPageControlView.frame  = CGRectMake(0, self.frame.size.height - PAGE_HEIGHT, self.frame.size.width, PAGE_HEIGHT);
}


#pragma mark - Setting Init Data Method
/*!
 *  @author swp_song
 *
 *  @brief  initData ( 设置初始化数据 )
 */
- (void) settingInitData {
    
    self.swpBannerCustomCell        = NO;
    self.swpBannerLoadNetworkImage  = YES;
    self.swpBannerBounces           = YES;
    self.swpBannerPageControlHidden = NO;
    
    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource swpBanner:self numberOfItemsInSection:self.section];
    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;

}


#pragma mark - Setting UI Methods

/*!
 *  @author swp_song
 *
 *  @brief  addUI ( 添加 UI 控件 )
 */
- (void)addUI {
    [self addSubview:self.swpBannerView];
    [self addSubview:self.swpBannerPageControlView];
}


#pragma mark - Setting SwpBanner Propertys Methods

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerTime:   ( 设置 swpBannerTime 定时时间 )
 *
 *  @param  swpBannerTime       ( default 0.5s )
 */
- (void)setSwpBannerTime:(CGFloat)swpBannerTime {
    _swpBannerTime = swpBannerTime;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerCustomCell:     ( 设置 swpBanner 是否自定义cell )
 *
 *  @param  swpBannerCustomCell         ( default NO < YES使用自动cell , NO 使用默认cell > )
 */
- (void)setSwpBannerCustomCell:(BOOL)swpBannerCustomCell {
    _swpBannerCustomCell = swpBannerCustomCell;
}


/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerLoadNetworkImage:       ( 设置 swpBanner 是否加载远程url )
 *
 *  @param  swpBannerLoadNetworkImage           ( default NO < YES 加载远程 url, NO 加载本地图片 >)
 */
- (void)setSwpBannerLoadNetworkImage:(BOOL)swpBannerLoadNetworkImage {
    _swpBannerLoadNetworkImage = swpBannerLoadNetworkImage;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerBounces:    ( 设置 swpBanner  弹簧效果 )
 *
 *  @param  swpBannerBounces        ( default YES < YES 开启, NO 关闭 > )
 */
- (void)setSwpBannerBounces:(BOOL)swpBannerBounces {
    _swpBannerBounces          = swpBannerBounces;
    self.swpBannerView.bounces = _swpBannerBounces;
}

/*!
 *  @author swp_song
 *
 *  @brief  setSwpBannerPageControlHidden:      (设置 swpBanner 中 PagesColor 是否隐藏 )
 *
 *  @param  swpBannerPageControlHidden          ( default NO <YES 隐藏, NO 显示> )
 */
- (void)setSwpBannerPageControlHidden:(BOOL)swpBannerPageControlHidden {
    _swpBannerPageControlHidden          = swpBannerPageControlHidden;
    self.swpBannerPageControlView.hidden =  _swpBannerPageControlHidden;
}

/*!
 *  @author swp_song
 *
 *  @brief setSwpNumberOfPagesColor:    (设置 swpBanner 中 PagesColor 总页数的颜色 )
 *
 *  @param swpNumberOfPagesColor
 */
- (void)setSwpNumberOfPagesColor:(UIColor *)swpNumberOfPagesColor {
    _swpNumberOfPagesColor = swpNumberOfPagesColor;
    self.swpBannerPageControlView.pageIndicatorTintColor = _swpNumberOfPagesColor;
}

/*!
 *  @author swp_song
 *
 *  @brief setSwpCurrentPageColor:      (设置 swpBanner 中 PagesColor 当前页数的颜色)
 *
 *  @param swpCurrentPageColor
 */
- (void)setSwpCurrentPageColor:(UIColor *)swpCurrentPageColor {
    _swpCurrentPageColor = swpCurrentPageColor;
    self.swpBannerPageControlView.currentPageIndicatorTintColor = _swpCurrentPageColor;
}

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerRegisterClass:forCellWithReuseIdentifier: ( swpBanner 注册一个cell )
 *
 *  @param  cellClass
 *
 *  @param  identifier
 */
- (void)swpBannerRegisterClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.swpBannerView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerReloadData ( swpBanner 数据刷新 )
 */
- (void)swpBannerReloadData {
    
    // 刷新数据
    [self.swpBannerView reloadData];
    
    // 设置 图片的 位置 和 分页
    [self settingScrollAndPageControl];
}

/*!
 *  @author swp_song
 *
 *  @brief  swpBannerDidSelectCell: ( 点击每个 cell 回调 )
 *
 *  @param  swpBannerDidSelectCell
 */
- (void)swpBannerDidSelectCell:(SwpBannerDidSelectCellBlock)swpBannerDidSelectCell {
    _swpBannerDidSelectCell = swpBannerDidSelectCell;
}

#pragma mark - UICollectionView DataSource & SwpBannerView DataSource - Methods
/*!
 *  @author swp_song
 *
 *  @brief  collectionView DataSource ( collectionView 数据源方法 设置 collectionView 分组个数 )
 *
 *  @param  collectionView
 *
 *  @return NSInteger
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if ([self.dataSource respondsToSelector:@selector(swpBannerNmberOfSections:)]) {
        return [self.dataSource swpBannerNmberOfSections:self];
    } else {
        return 1;
    }
}

/*!
 *  @author swp_song
 *
 *  @brief  collectionView DataSource ( collectionView 数据源方法 设置 collectionView 分组中 cell显示的个数 )
 *
 *  @param  collectionView
 *
 *  @param  section
 *
 *  @return NSInteger
 */
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.section = section;
    return [self.dataSource swpBanner:self numberOfItemsInSection:section];
}


/*!
 *  @author swp_song
 *
 *  @brief  collectionView DataSource ( collectionView 数据源方法 设置 collectionView 分组中cell显示的数据 | 样式 )
 *
 *  @param  collectionView
 *
 *  @param  indexPath
 *
 *  @return UICollectionViewCell
 */
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.isSwpBannerCustomCell) {
        // 使用 默认 cell
        SwpBannerCell *cell   = [collectionView dequeueReusableCellWithReuseIdentifier:swpBannerCellID forIndexPath:indexPath];
        cell.loadNetworkImage = self.swpBannerLoadNetworkImage;
        cell.imageName        = [self.dataSource swpBanner:self cellImageForItemAtIndexPath:indexPath];
        return cell;
    } else {
        return [self.dataSource swpBanner:self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
    
}

#pragma mark - UICollectionView Delegate && SwpBannerView Delegate - Methods
/*!
 *  @author swp_song
 *
 *  @brief  collectionView Delegate ( collectionView 代理方法 设置 collectionView  每个cell的宽高 )
 *
 *  @param  collectionView
 *
 *  @param  collectionViewLayout
 *
 *  @param  indexPath
 *
 *  @return CGSize
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(swpBanner:collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [self.delegate swpBanner:self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
    return CGSizeMake(self.frame.size.width, self.frame.size.height);
}


/*!
 *  @author swp_song
 *
 *  @brief  collectionView Delegate ( collectionView 代理方法 点击每个cell调用 )
 *
 *  @param  collectionView
 *
 *  @param  indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.swpBannerDidSelectCell) self.swpBannerDidSelectCell(self, indexPath);
    if ([self.delegate respondsToSelector:@selector(swpBanner:didSelectItemAtIndexPath:)]) {
        [self.delegate swpBanner:self didSelectItemAtIndexPath:indexPath];
    }
}


#pragma mark - UIScrollView Delegate Methods
/*!
 *  @author swp_song
 *
 *  @brief  scrollView Delegate ( scrollView 代理方法 开始拖拽的时候调用 )
 *
 *  @param  scrollView
 */
- (void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    // 开始滚动
    [self beginScroll];
}

/*!
 *  @author swp_song, 2015-12-09 11:38:25
 *
 *  @brief  scrollView Delegate ( scrollView 代理方法 完全停止拖拽的时候调用 )
 *
 *  @param  scrollView
 *
 *  @param  decelerate
 */
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    // 停止滚动
    [self stopScroll];
}

/*!
 *  @author swp_song, 2015-12-09 11:39:45
 *
 *  @brief  scrollView Delegate ( scrollView 代理方法 正在滚动时调用 <计算分页> )
 *
 *  @param  scrollView
 */
- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    // 精确分页
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    //scrollView.contentOffset.x / scrollView.frame.size.width;
    self.swpBannerPageControlView.currentPage = page;
}


#pragma mark - Tools Methods
/*!
 *  @author swp_song
 *
 *  @brief  settingScrollAndPageControl (设置 图片 滚动属性 和 分页 属性)
 */
- (void)settingScrollAndPageControl {
    
    
    // 移除自动滚动 防止 内存 泄露
    [self stopScroll];
    
    // 设置 pageControlView 总页数
    self.swpBannerPageControlView.numberOfPages = [self.dataSource swpBanner:self numberOfItemsInSection:self.section];
    // 设置 pageControlView 当前也数
    self.swpBannerPageControlView.currentPage   = 0;
    
    // 设置 图片 位置 为 第一张图片位置
    [self settingImageCollectionViewScrollScrollLocation:YES];
    
    // 启动 自动滚动
    [self beginScroll];
}

/*!
 *  @author swp_song
 *
 *  @brief  beginScroll     (开始滚动)
 */
- (void)beginScroll {
    
    self.swpBannerTime = self.swpBannerTime == 0 ? 5.0 : self.swpBannerTime;
    [self performSelector:@selector(nextImage) withObject:nil afterDelay:self.swpBannerTime];
    
}


/*!
 *  @author swp_song
 *
 *  @brief  stopScroll  ( 停止滚动 )
 */
- (void) stopScroll {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(nextImage) object:nil];
}

/*!
 *  @author swp_song
 *
 *  @brief  nextImage   ( 自动滚动 )
 */
- (void) nextImage {
    
    [self stopScroll];
    
    [self settingImageCollectionViewScrollScrollLocation:NO];
    
    [self beginScroll];
}


/*!
 *  @author swp_song
 *
 *  @brief  settingImageCollectionViewScrollScrollLocation  ( 设置 图片的 cell 的滚动 位置 )
 *
 *  @param  initLocation                                    ( 需要图片初始化 到第一张图片 YES 是初始化到第一张图片 NO 是不需要 )
 */
- (void)settingImageCollectionViewScrollScrollLocation:(BOOL)initLocation  {
    
    
    // 是否 实现了 数据源方法
    if (([self.dataSource respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource respondsToSelector:@selector(swpBanner:cellImageForItemAtIndexPath:)]) ||  ([self.dataSource respondsToSelector:@selector(swpBanner:numberOfItemsInSection:)] && [self.dataSource respondsToSelector:@selector(swpBanner:collectionView:cellForItemAtIndexPath:)])) {
        
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



#pragma mark - Init UI Methods
- (UICollectionView *)swpBannerView {
    
    if (!_swpBannerView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing          = 0;
        _swpBannerView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        _swpBannerView.backgroundColor = [UIColor clearColor];
        [_swpBannerView registerClass:[SwpBannerCell class] forCellWithReuseIdentifier:swpBannerCellID];
        _swpBannerView.dataSource                     = self;
        _swpBannerView.delegate                       = self;
        _swpBannerView.pagingEnabled                  = YES;
        _swpBannerView.showsHorizontalScrollIndicator = NO;
        _swpBannerView.showsVerticalScrollIndicator   = NO;
    }
    return _swpBannerView;
}

- (UIPageControl *)swpBannerPageControlView {
    
    if (!_swpBannerPageControlView) {
        
        _swpBannerPageControlView = [[UIPageControl alloc] init];
        _swpBannerPageControlView.pageIndicatorTintColor        = [UIColor blackColor];
        _swpBannerPageControlView.currentPageIndicatorTintColor = [UIColor redColor];
        _swpBannerPageControlView.enabled                       = YES;

    }
    return _swpBannerPageControlView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
