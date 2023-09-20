version = "1.3.0"
sourceURL = "https://github.com/rashadatjou/google-ima-sdk-xc/releases/download/#{version}/GoogleInteractiveMediaAds.zip"

Pod::Spec.new do |s|

  s.name             = 'GoogleInteractiveMediaAdsXC'
  s.version          = version
  s.summary          = 'Multiplatform Google IMA SDK (iOS & tvOS)'
  s.description      = 'Unofficial Combined iOS & tvOS Google IMA SDK for both SPM & CocoaPods'
  s.homepage         = 'https://mehdi-rashadatjou.com'
  s.license          = { :type => 'MIT', :file => './LICENSE' }
  s.author           = { 'Mehdi Rashadatjou' => 'rashadatjou.mehdi@gmail.com' }
  s.platforms        = { :ios => '14.0', :tvos => '14.0' }
  s.source           = { :http => sourceURL }
  s.swift_version    = '5.0'
  s.vendored_frameworks = "GoogleInteractiveMediaAds.xcframework"

end