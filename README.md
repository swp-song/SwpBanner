#SwpBanner


##### SwpBanner 封装 简单 图片轮播器 

---
##### 效果：
![(图片轮播效果)](https://raw.githubusercontent.com/swp-song/SwpBanner/master/Screenshot/SwpBanner.gif)
---

```
SwpBanner 封装 简单 图片轮播器, 可加载本地图片，和远程图片，SwpBanner 依赖 SDWebImage 加载远程图片
```

---

[SDWebImage](https://github.com/rs/SDWebImage)

---

##### 导入：
```ruby
手动导入：

SwpBanner 文件夹 导入 项目 中, 依赖 SDWebImage 
#import "SwpBanner.h"

CocoaPods 导入:

使用  CocoaPods 会自动 pod SDWebImage

pod search SwpBanner

pod 'SwpBanner'

#import <SwpBanner/SwpBanner.h>

```
---

##### 使用：


___数据源方法___ ___必须实现___

```Objective-C

/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:numberOfItemsInSection:   ( 设置 swpBannerView 每个分组显示数据的个数 )
 *
 *  @param  swpBanner
 *
 *  @param  section
 *
 *  @return NSInteger
 */
- (NSInteger)swpBanner:(SwpBanner *)swpBanner numberOfItemsInSection:(NSInteger)section;

/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:cellImageForItemAtIndexPath   ( 设置 swpBannerView 显示默认的cell 显示图片的名称 | 远程 URL )
 *
 *  @param  swpBanner           ( 注意: swpCustomCell 值 为 NO 时 才会调用， swpCustomCell 默认为 NO )
 *
 *  @param  indexPath
 *
 *  @return NSString
 */
- (NSString *)swpBanner:(SwpBanner *)swpBanner cellImageForItemAtIndexPath:(NSIndexPath *)indexPath;
```
---

___代理方法:___

```Objective-C
/*!
 *  @author swp_song
 *
 *  @brief  swpBanner:didSelectItemAtIndexPath: ( swpBannerView 点击每个cell调用 )
 *
 *  @param  swpBanner
 *
 *  @param  indexPath
 */
- (void)swpBanner:(SwpBanner *)swpBanner didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
```
---

___Blcok 回调___

```Objective-C
/*!
 *  @author swp_song
 *
 *  @brief  swpBannerDidSelectCell: ( 点击每个 cell 回调 )
 *
 *  @param  swpBannerDidSelectCell
 */
- (void)swpBannerDidSelectCell:(SwpBannerDidSelectCellBlock)swpBannerDidSelectCell;
```
---
##### 备注:
```
交流 群号 : 85400118
```


