require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-wkwebview"
  s.version      = package["version"]
  s.summary      = "React Native WKWebView for iOS"
  s.author       = "Ruoyu Sun <ruoysun@gmail.com> (https://github.com/insraq)"

  s.homepage     = "https://github.com/CRAlpha/react-native-wkwebview"

  s.license      = "MIT"
  s.platform     = :ios, "8.0"

  # s.source       = { :http => 'file:' + __dir__  }
  s.source       = { :git => "https://github.com/woshi82/react-native-wkwebview.git", :branch => "dev" }
  # s.source       = { :git => "https://github.com/woshi82/react-native-wkwebview.git", :tag => "v#{s.version}" }

  s.source_files  = "ios/RCTWKWebView/*.{h,m}"

  s.dependency "React"
end
