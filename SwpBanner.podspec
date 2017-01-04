Pod::Spec.new do |s|

  s.name                  = "SwpBanner"
  s.version               = "1.3.0"
  s.ios.deployment_target = '7.0'
  s.summary               = " 封装图片轮播控件 "
  s.homepage              = "https://github.com/swp-song/SwpBanner"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpBanner.git", :tag => s.version }
  s.source_files          = "SwpBanner"
  s.source_files          = "SwpBanner/**/*.{h,m}"
  s.resource              = "SwpBanner/SwpBannerResources/SwpBanner.bundle"
  s.requires_arc          = true
  s.framework             = "UIKit", "Foundation"
  s.dependency "SDWebImage"

end
