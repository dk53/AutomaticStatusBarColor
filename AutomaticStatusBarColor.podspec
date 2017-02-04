#
# Be sure to run `pod lib lint AutomaticStatusBarColor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutomaticStatusBarColor'
  s.version          = '1.0.1'
  s.summary          = 'A one line component to manage status bar color automaticly throughout your application '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Don't worry anymore about the pain of managing status bar thru all your controllers. Simply add one line in your appDelegate and let the plugin do his work.
  You can disable for one controller, or change by youtself the status bar color.
                       DESC

  s.homepage         = 'https://github.com/dk53/AutomaticStatusBarColor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Victor Carmouze' => 'victor.carmouze@gmail.com' }
  s.source           = { :git => 'https://github.com/dk53/AutomaticStatusBarColor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.source_files = 'AutomaticStatusBarColor/Classes/*'
  
end
