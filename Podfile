platform :ios, '15.0'

target 'TestTaskApp' do
  use_frameworks!

  pod 'SwiftLint', '0.50.3'
  pod 'SwiftGen', '6.6.2'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end