#
# Be sure to run `pod lib lint emojidataios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'emojidataios'
  s.version          = '0.6.0'
  s.summary          = 'The missing Emoji library for iOS ❤️  Based on emoji-data'

  s.description      = <<-DESC
Parses your emojis from Unicode to aliases, and vice versa. Based on emoji-data
                       DESC

  s.homepage         = 'https://github.com/maxoumime/emoji-data-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxime Bertheau' => 'maxime.bertheau@gmail.com' }
  s.source           = { :git => 'https://github.com/maxoumime/emoji-data-ios.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/maxoumime'

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '5.0'

  s.source_files = 'emojidataios/Classes/**/*'
  
  s.resources = ['emojidataios/Assets/*', 'emojidataios/*.json']
  s.swift_version = '5.0'
end
