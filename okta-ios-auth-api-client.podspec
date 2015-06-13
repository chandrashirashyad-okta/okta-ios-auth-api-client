#
# Be sure to run `pod lib lint okta-ios-auth-api-client.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "okta-ios-auth-api-client"
  s.version          = "0.1.0"
  s.summary          = "Okta Authentication API Client Pod. Uses Mantle / AFNetworking"
  s.description      = <<-DESC
                        Checkout the Readme.md file for more details
                       DESC
  s.homepage         = "https://github.com/okta/okta-ios-auth-api-client"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Chandra Shirashyad" => "chandra.shirashyad@okta.com" }
  s.source           = { :git => "git@github.com:okta/okta-ios-auth-api-client.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.resource_bundles = {
    'okta-ios-auth-api-client' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'Mantle', '~> 2.0'

end
