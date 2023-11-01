# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end

target 'Car Rental App' do
	project '/Users/nguyenxuananh/github-xuananh-graduation-thesis-car-rental-app/Car Rental App.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Car Rental App

pod 'Alamofire'
pod 'SwiftEntryKit', '2.0.0'
pod 'SwiftyJSON', '~> 4.0'

end
