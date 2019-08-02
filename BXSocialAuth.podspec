Pod::Spec.new do |s|
  s.name             = "BXSocialAuth"
  s.version          = "0.1.1"
  s.summary          = "Social authentication for iOS."
  s.description      = <<-DESC
                       BXSocialAuth is designed to handle social authentication.
                       It has a small set of public APIs backed by a set of "providers" that implement the functionality needed to communicate with various social services.
                       DESC
  s.homepage         = "https://github.com/iException/BXSocialAuth"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Yiming Tang" => "yimingnju@gmail.com" }
  s.source           = { :git => "https://github.com/iException/BXSocialAuth.git", :tag => "v#{s.version.to_s}" }
  s.social_media_url = 'https://twitter.com/yiming_t'
  s.platform         = :ios, '7.0'
  s.requires_arc     = true

  s.subspec 'Core' do |ss|
    ss.source_files = 'BXSocialAuth/Core'
    ss.frameworks = 'UIKit'
  end

  s.subspec 'WeChat' do |ss|
    ss.dependency 'BXSocialAuth/Core'
    ss.dependency 'BXWeChatSDK'
    ss.source_files = 'BXSocialAuth/Providers/WeChat'
  end

  s.subspec 'Tencent' do |ss|
    ss.dependency 'BXSocialAuth/Core'
    ss.dependency 'BXTencentOpenAPI'
    ss.source_files = 'BXSocialAuth/Providers/Tencent'
  end
end
