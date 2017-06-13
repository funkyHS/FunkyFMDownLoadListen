
Pod::Spec.new do |s|
  s.name             = 'FunkyFMDownLoadListen'
  s.version          = '0.1.0'
  s.summary          = 'FunkyFMDownLoadListen'


  s.description      = <<-DESC
FunkyFMDownLoadListen 是FM的第三大模块，下载听
                       DESC

  s.homepage         = 'https://github.com/funkyHS/FunkyFMDownLoadListen'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'funkyHS' => 'hs1024942667@163.com' }
  s.source           = { :git => 'https://github.com/funkyHS/FunkyFMDownLoadListen.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FunkyFMDownLoadListen/Classes/**/*'
  
   s.resource_bundles = {
     'FunkyFMDownLoadListen' => ['FunkyFMDownLoadListen/Assets/*']
   }

    s.dependency 'FunkySegmentBar'
    s.dependency 'FunkyFMBase/Base'
end
