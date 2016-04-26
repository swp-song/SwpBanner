Pod::Spec.new do |s|

  s.name                  = "SwpBanner"
  s.version               = "1.0.2"
  s.ios.deployment_target = '7.0'
  s.summary               = " 封装图片轮播控件 "
  s.homepage              = "https://github.com/swp-song/SwpBanner"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpBanner.git", :tag => s.version }
  s.source_files          = "SwpBanner"
  s.requires_arc          = true
  s.framework             = "UIKit"
  s.dependency "SDWebImage"

end
