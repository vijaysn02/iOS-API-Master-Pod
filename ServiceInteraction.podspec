Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "ServiceInteraction"
s.summary = "Let u to connect to API gracefully."
s.requires_arc = true

# 2
s.version = "0.1.2"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Vijay SN" => "vijaysn02@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/vijaysn02/iOS-API-Master-Pod"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/vijaysn02/iOS-API-Master-Pod.git", 
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"

# 8
s.source_files = "ServiceInteraction/**/*.{swift}"

# 9
# s.resources = "Service/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5.0"

end

