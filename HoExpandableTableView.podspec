#
# Be sure to run `pod lib lint HoExpandableTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HoExpandableTableView'
  s.version          = '0.1.0'
  s.summary          = 'A useful extended TableView derived from UITableView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A useful extended TableView derived from UITableView. The section headers can be customized.
                       DESC

  s.homepage         = 'https://github.com/eric-nz/HoExpandableTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eric Ho' => 'eric.iosfan@gmail.com' }
  s.source           = { :git => 'https://github.com/eric-nz/HoExpandableTableView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.1'
  s.swift_version = '4.2'

  s.source_files = 'HoExpandableTableView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HoExpandableTableView' => ['HoExpandableTableView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
