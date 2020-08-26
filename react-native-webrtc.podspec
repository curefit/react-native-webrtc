require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name                = package['name']
  s.version             = package['version']
  s.summary             = package['description']
  s.homepage            = 'https://github.com/react-native-webrtc/react-native-webrtc'
  s.license             = package['license']
  s.author              = 'https://github.com/react-native-webrtc/react-native-webrtc/graphs/contributors'
  s.source              = { :git => 'git@github.com:curefit/react-native-webrtc.git', :tag => 'release #{s.version}' }
  s.requires_arc        = true

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'

  s.preserve_paths      = '**/*.js'
  s.source_files        = 'ios/**/*.{h,m}'
  s.libraries           = 'c', 'sqlite3', 'stdc++'
  s.public_header_files = 'ios/WebRTC.framework/Headers/**/*.h'
  s.vendored_frameworks = 'ios/WebRTC.framework'
  s.xcconfig            = { 'OTHER_LDFLAGS' => '-framework WebRTC' }
  s.dependency          'React'
end