Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "SelectionView"
s.summary = "View that allows many-from-many and one-from-many selection from predefined string data."
s.requires_arc = true

s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Agnieszka Patalas" => "ampatalas@gmail.com" }
s.homepage = "https://github.com/ampatalas/SelectionView"
s.source = { :git => "https://github.com/ampatalas/SelectionView.git", :tag => "#{s.version}"}

s.framework = "UIKit"
s.source_files = "SelectionView/**/*.{swift}"

end
