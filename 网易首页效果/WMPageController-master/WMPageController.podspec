Pod::Spec.new do |s|
   s.name         = "WMPageController"
   s.version      = "2.2.1"
   s.summary      = "An easy solution to page controllers like NetEase News"
   s.homepage     = "https://github.com/wangmchn/WMPageController"
   s.license      = 'MIT (LICENSE)'
   s.author       = { "wangmchn" => "wangmchn@163.com" }
   s.source       = { :git => "https://github.com/wangmchn/WMPageController.git", :tag => "2.2.1" }
   s.platform     = :ios, '6.0'

   s.source_files = 'WMPageController', 'WMPageController/**/*.{h,m}'
   s.exclude_files = 'WMPageControllerDemo'

   s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
   s.requires_arc = true
 end