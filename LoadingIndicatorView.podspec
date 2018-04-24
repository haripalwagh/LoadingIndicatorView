#
# Be sure to run `pod lib lint LoadingIndicatorView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LoadingIndicatorView'
  s.version          = '1.0'
  s.summary          = 'It will show loading activity and disable unwanted touches to the screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
It will show loading activity and disable unwanted touches to the screen. This is basically usefull when you want to disable user interaction with the screen and show some activity indicator.
                       DESC

  s.homepage         = 'https://github.com/haripalwagh/LoadingIndicatorView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'haripalwagh@gmail.com' => 'haripalwagh@gmail.com' }
  s.source           = { :git => 'https://github.com/haripalwagh/LoadingIndicatorView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.1'
  s.source_files = 'LoadingIndicatorView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LoadingIndicatorView' => ['LoadingIndicatorView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
