Pod::Spec.new do |s|
  s.name             = 'ASCommon'
  s.version          = '0.1.0'
  s.summary          = 'Collection of extensions and protocol to boost your productivity'
  s.description      = <<-DESC

  A Swift collection of extensions and protocol to boost your productivity

  DESC

  s.homepage         = 'https://github.com/andr3a88/ASCommon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andr3a88' => 'runner_corsa@msn.com' }
  s.source           = { :git => 'https://github.com/andr3a88/ASCommon.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/andrea_steva>'

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'ASCommon/Classes/**/*'
end
