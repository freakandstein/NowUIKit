#
# Be sure to run `pod lib lint NowUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'NowUIKit'
    s.swift_version    = '5.2'
    s.version          = '1.0.0'
    s.summary          = 'A short description of NowUIKit.'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    NowUIKit is design system dynamic framework, specifically implemented to provide UIUX components to the nobuneo by Nobu Bank iOS application.
    DESC

    s.homepage         = 'https://github.com/freakandstein/NowUIKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'satrio' => 'freakandstein@gmail.com' }
    s.source           = { :git => 'https://github.com/freakandstein/NowUIKit.git', :tag => s.version.to_s }
    s.ios.deployment_target = '12.0'
    s.source_files = 'NowUIKit/Classes/**/*'
    s.resource = 'NowUIKit/Resource/*'
end
