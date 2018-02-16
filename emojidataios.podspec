#
# Be sure to run `pod lib lint emojidataios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'emojidataios'
  s.version          = '0.1.8'
  s.summary          = 'The missing Emoji library for iOS ❤️  Based on emoji-data'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Parses your emojis from Unicode to aliases, and vice versa. Based on emoji-data
                       DESC

  s.homepage         = 'https://github.com/maxoumime/emoji-data-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxime Bertheau' => 'maxime.bertheau@gmail.com' }
  s.source           = { :git => 'https://github.com/maxoumime/emoji-data-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maxoumime'

  s.ios.deployment_target = '8.0'

  s.source_files = 'emojidataios/Classes/**/*'
  
  # s.resource_bundles = {
  #  'emojidataios' => ['emojidataios/Assets/*', 'emojidataios/*.json']
  # }
  
  s.resources = ['emojidataios/Assets/*', 'emojidataios/*.json']

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
