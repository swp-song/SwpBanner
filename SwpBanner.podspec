#
# Be sure to run `pod lib lint SwpBanner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name    = 'SwpBanner'
  s.version = '2.0.3'
  s.summary = ' 封装图片轮播控件 '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 封装图片轮播控件
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpBanner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpBanner.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = 'SwpBanner/**/*'

  s.resource      = "SwpBanner/SwpBannerResources/SwpBanner.bundle"

  # s.resource_bundles = {
  #   'SwpBanner' => ['SwpBanner/Assets/*.png']
  # }

  s.framework     = "UIKit", "Foundation"

  s.dependency "SDWebImage"

end
