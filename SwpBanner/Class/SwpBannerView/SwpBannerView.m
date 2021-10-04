//
//  SwpBannerView.m
//  Dream
//
//  Created by Dream on 2018/1/11.
//  Copyright © 2018年 Dream. All rights reserved.
//

#import "SwpBannerView.h"

#import "SwpBannerCell.h"

@interface SwpBannerView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation SwpBannerView

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    if (self = [super initWithCoder:coder]) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    if (self = [super initWithFrame:frame collectionViewLayout:self.flowLayout]) {
        [self config];
    }
    return self;
}

- (void)config {
    _padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [self registerClass:SwpBannerCell.class forCellWithReuseIdentifier:SwpBannerCell.identifier];
    self.backgroundColor                = UIColor.whiteColor;
    self.dataSource                     = self;
    self.delegate                       = self;
    self.pagingEnabled                  = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator   = NO;
}



#pragma mark - Init UI Methods
- (UICollectionViewFlowLayout *)flowLayout {
    
    return !_flowLayout ? _flowLayout = ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing          = 0;
        flowLayout.minimumInteritemSpacing     = 0;
        flowLayout;
    }) : _flowLayout;
}

// MARK: -  UICollectionView DataSoure Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:numberOfSectionsInCollectionView:)]) {
        return [self.swpBannerViewDelegate swpBannerView:self numberOfSectionsInCollectionView:collectionView];
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.swpBannerViewDelegate swpBannerView:self collectionView:collectionView numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.swpBannerViewDelegate swpBannerView:self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    if (!cell) {
        id image            = [self.swpBannerViewDelegate swpBannerView:self cellImageForItemAtIndexPath:indexPath];
        id placeholderImage = [self.swpBannerViewDelegate swpBannerView:self loadPlaceholderImageForItemAtIndexPath:indexPath];
        return SwpBannerCell
        .swp_bannerCellinit(collectionView, SwpBannerCell.identifier, indexPath)
        .swp_loadNetwork(self.loadNetwork)
        .swp_placeholderImage(placeholderImage)
        .swp_image(image);
    }
    
    return cell;
}

// MARK: -  UICollectionView Delegate Methods
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:collectionView:layout:insetForSectionAtIndex:)]) {
       
        UIEdgeInsets padding = [self.swpBannerViewDelegate swpBannerView:self collectionView:collectionView layout:self.flowLayout insetForSectionAtIndex:section];
        return padding;
    }
    return _padding;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:collectionView:layout:sizeForItemAtIndexPath:)]) {
        CGSize size = [self.swpBannerViewDelegate swpBannerView:self collectionView:collectionView layout:self.flowLayout sizeForItemAtIndexPath:indexPath];
        return size;
    }
    return self.size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:collectionView:didSelectItemAtIndexPath:)]) {
        [self.swpBannerViewDelegate swpBannerView:self collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

// MARK: -  UIScrollView Delegate Methods
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:scrollViewWillBeginDecelerating:)]) {
        [self.swpBannerViewDelegate swpBannerView:self scrollViewWillBeginDecelerating:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:scrollViewDidEndDragging:willDecelerate:)]) {
        [self.swpBannerViewDelegate swpBannerView:self scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger page = (scrollView.contentOffset.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    if ([self.swpBannerViewDelegate respondsToSelector:@selector(swpBannerView:scrollViewDidScroll:page:)]) {
        [self.swpBannerViewDelegate swpBannerView:self scrollViewDidScroll:scrollView page:page];
    }
}
// MARK: - Public: Property
- (CGSize)size {
    return self.frame.size;
}

// MARK: - Public Methods

- (SwpBannerView * _Nonnull (^)(id<SwpBannerViewDelegate> _Nullable swpBannerViewDelegate))swp_bannerViewDelegate {
    return ^(id<SwpBannerViewDelegate>swpBannerViewDelegate) {
        self.swpBannerViewDelegate = swpBannerViewDelegate;
        return self;
    };
}

- (SwpBannerView * _Nonnull (^)(BOOL))swp_loadNetwork {
    return ^(BOOL loadNetwork) {
        self.loadNetwork = loadNetwork;
        return self;
    };
}
// MARK: -

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
