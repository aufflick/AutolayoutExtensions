Pod::Spec.new do |s|
  s.name         = "PWAutolayoutExtensions"
  s.version      = "0.0.1"
  s.summary      = "Autolayout helper library."
  s.homepage     = "https://github.com/depth42/AutolayoutExtensions"
  s.license      = {:type => 'MIT', :text => "MIT"}
  s.author       = "Frank Illenberger"
  s.source       = { :git => "git@github.com:aufflick/AutolayoutExtensions.git" }
  s.platforms    = { :ios => '7.0', :osx => 10.8 }
  s.source_files = 'Autolayout/PWAutoLayout/NSLayout*.{h,m}', 'Autolayout/PWAutoLayout/PWView*.{h,m}'
  s.ios.source_files = 'Autolayout/PWAutoLayout/UIView+PWExtensions.h'
  s.osx.source_files = 'Autolayout/PWAutoLayout/NSView+PWExtensions.h'
  s.requires_arc = true
  s.dependency 'JRSwizzle'
end
