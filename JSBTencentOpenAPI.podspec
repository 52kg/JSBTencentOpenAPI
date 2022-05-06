#
# Be sure to run `pod lib lint JSBTencentOpenAPI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSBTencentOpenAPI'
  s.version          = '1.0.0'
  s.summary          = 'TencentOpenAPI Swift version, based on 3.5.11'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TencentOpenAPI Swift version, Based on TencentOpenAPI version V3.5.11
                       DESC

  s.homepage         = 'http://wiki.open.qq.com/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TencentOpenAPI' => 'TencentOpenAPI' }
  s.source           = { :git => 'https://github.com/52kg/JSBTencentOpenAPI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'Framework/**/*.framework'
  s.pod_target_xcconfig = {
      'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/Framework/',
      'VALID_ARCHS'=> 'x86_64 armv7 arm64'
  }
  s.framework = 'Security', 'SystemConfiguration', 'CoreGraphics', 'CoreTelephony', 'WebKit'
  s.libraries = 'iconv', 'sqlite3', 'stdc++', 'z'
  
  s.prepare_command = <<-EOF
  rm -rf Framework/TencentOpenAPI.framework/Headers/module.modulemap
  if [ ! -d "Framework/TencentOpenAPI.framework/Modules/" ]; then
      mkdir Framework/TencentOpenAPI.framework/Modules
  fi
  touch Framework/TencentOpenAPI.framework/Modules/module.modulemap
  cat <<-EOF > Framework/TencentOpenAPI.framework/Modules/module.modulemap
  framework module TencentOpenAPI {
    umbrella header "TencentOpenApiUmbrellaHeader.h"
    export *
    module * { export * }
  }
  \EOF

  EOF
  
end
