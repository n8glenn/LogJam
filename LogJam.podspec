#
# Be sure to run `pod lib lint LogJam.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LogJam'
  s.version          = '0.1.0'
  s.summary          = 'LogJam is a simple yet powerful logging class which allows you to quickly and easily log the events in your app in a dynamic way.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
LogJam is a simple yet powerful logging class which allows you to quickly and easily log the events in your app in a dynamic way, by defining log statements ahead of time and enabling the ones you need on the fly as you debug.  You can add domains (strings) to describe your code modules, classes, procedures, etc.  You then call log statements setting the domain of the message, the level (Error, Debug, or Information) and the message you want displayed.  Finally, before running your app, if you want to log a function, you add domains to the logger.  As the program runs, it will print out messages associated with the domains you have chosen.  For instance, as you are writing a web client, you would add a domain for "web" to be used for all classes associated with web communications, and add domains for each class, and for each function in each class.  If you want to debug the entire web communications portion, you add the domain "web" and run your program.  If you want to debug only a specific function, you add a domain like "web.<class>.<function>".
                       DESC

  s.homepage         = 'https://github.com/n8glenn/LogJam'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'n8glenn' => 'n8glenn@gmail.com' }
  s.source           = { :git => 'https://github.com/n8glenn/LogJam.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '4.2'
  
  s.ios.deployment_target = '8.0'

  s.source_files = 'LogJam/Classes/**/*.swift'
  
  # s.resource_bundles = {
  #   'LogJam' => ['LogJam/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
