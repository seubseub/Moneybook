# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Moneybook' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Moneybook
  pod 'FSCalendar'
  pod 'Charts', :git => 'https://github.com/danielgindi/Charts.git', :branch => 'master'
  pod 'RealmSwift', '~> 2.0.2'
  pod 'CorePlot', '~> 2.2'
  pod 'Alamofire', '~> 4.0'
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'


  target 'MoneybookTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MoneybookUITests' do
    inherit! :search_paths
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDART_LIBRARIES'] = 'NO'
      end
    end
  end
end
