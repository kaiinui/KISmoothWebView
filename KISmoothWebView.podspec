Pod::Spec.new do |s|
  s.name         = "KISmoothWebView"
  s.version      = "0.1.0"
  s.summary      = "[iOS] Enchant a WebView native-like behavior"
  s.homepage     = "https://github.com/kaiinui/KISmoothWebView"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kainui/KISmoothWebView.git", :tag => "v0.1.0" }
  s.source_files  = "KISmoothWebView/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end
