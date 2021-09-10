Pod::Spec.new do |s|
  s.name             = 'VHCommonUIModule'
  s.version          = '1.0.2'
  s.summary          = '创建一个UI库.'

  s.description      = <<-DESC
TODO: 添加几个类文件、资源文件.
                       DESC

  s.homepage         = 'https://github.com/VihongL/VHCommonUIModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xxxxxx' => 'xxxxxx@163.com' }
  s.source           = { :git => 'https://github.com/VihongL/VHCommonUIModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Classes/**/*'
  
#   s.resource_bundles = {
#     'VHCommonUIModule' => ['VHCommonUIModule/Assets/*.png']
#   }

#  通过编译产物xxx.app查看包内容，会发现这种方式会自动在framework里面生成VHCommonUIModule.bundle，最终生成的路径 Frameworks/VHCommonUIModule.framework/VHCommonUIModule.bundle/VHCommonUIModuleBundle.bundle
#  s.resource_bundles = {
#    'VHCommonUIModule' => ['Assets/VHCommonUIModuleBundle.bundle']
#  }
   #也可以通过这种方式指定资源，这种方式最终生成的路径Frameworks/VHCommonUIModule.framework/VHCommonUIModuleBundle.bundle
   s.resource     = 'Assets/VHCommonUIModuleBundle.bundle'
  
  #依赖库
  s.dependency 'Masonry'
  s.dependency 'VHMacroAndCategoryModule'
  #s.dependency 'VHPodTest'
  
  #依赖库的头文件导入
  s.prefix_header_contents = '#import "VHMacros.h"','#import "Masonry.h"'
  
end
