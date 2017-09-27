#
# Be sure to run `pod lib lint GitHub.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GitHub'
  s.version          = '0.1.0'
  s.summary          = 'Implementation of GitHub API using Sweeft'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mathiasquintero/GitHub'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mathiasquintero' => 'me@quintero.io' }
  s.source           = { :git => 'https://github.com/mathiasquintero/GitHub.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'GitHub/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GitHub' => ['GitHub/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Sweeft', '~> 0.12'
end
