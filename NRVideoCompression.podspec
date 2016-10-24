#
# Be sure to run `pod lib lint NRVideoCompression.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NRVideoCompression'
  s.version          = '1.0.1'
  s.summary          = 'This class is used for video compression you can compress the video taken from camera or choose from library.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
NRVideocompression: This class is used for compressing the video taken from iPhone camera or from camera roll. There is various circumstances where you want to send videos to the network but because of the high resolution of iPhone camera videos are of very large size which needs to be compressed before we are sending them to network to save the memory. This library helps you to the compress the size of videos according to your quality choices which have options AVAssetExportPresetLowQuality, AVAssetExportPresetMediumQuality, AVAssetExportPresetHighQuality.
DESC

  s.homepage         = 'https://github.com/naveenrana1309/NRVideoCompression'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'naveenrana1309' => 'naveenrana1309@gmail.com' }
  s.source           = { :git => 'https://github.com/naveenrana1309/NRVideoCompression.git', :tag => s.version.to_s }
s.social_media_url = 'https://www.facebook.com/iOSByHeart/'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NRVideoCompression/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NRVideoCompression' => ['NRVideoCompression/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
