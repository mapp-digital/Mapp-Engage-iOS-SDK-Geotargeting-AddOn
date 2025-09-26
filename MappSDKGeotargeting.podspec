Pod::Spec.new do |s|

  s.name         = "MappSDKGeotargeting"
  s.version      = "6.0.7"
  s.cocoapods_version = '>= 1.10'
  s.summary      = "Mapp SDK Geotargeting enables developers to harnest the full power of Mapp Geotargeted messaging on their iOS applications."
  s.description  = 	<<-DESC
  					Mapp SDK Geotargeting enables push messaging in your iOS application, for engaging your application users and increasing retention.
                   	DESC
  s.homepage     = "https://mapp.com"
  s.license      = { :type => "Custom", :file => "MappLicence.txt" }
  s.author       = { "Mapp Digital" => "https://mapp.com/contact-us/" }
  s.source       = { :git => "https://github.com/MappCloud/MappSDKGeotargeting.git", :tag => "#{s.version}" }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64 i386', 'VALID_ARCHS[sdk=iphoneos*]' => 'arm64' }
  s.ios.framework = 'CoreLocation'
  s.ios.library = 'sqlite3'
  s.platform     = :ios, "10.0"
  s.ios.vendored_frameworks = "SDK/AppoxeeLocationServices.xcframework"
  s.preserve_paths = 'SDK/AppoxeeLocationServices.xcframework'
  s.dependency 'MappSDK', '~> 6.1.0'
  s.requires_arc = true

end
