source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

def common

  # UI
  pod 'PKHUD'

  # Automatisation
  pod 'SwiftGen'
  pod 'SwiftLint'

  # Misc
  pod 'SwiftyBeaver'
end

target 'PassGen' do
  common

  pod 'GMStepper'
end

abstract_target :unit_tests do
  target 'UnitTests'
  common
end


# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
#      config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods-PassGen/Pods-PassGen-acknowledgements.plist'

# puts 'pwd => ' + pods_acknowledgements_path
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowl\
edgements.plist", :remove_destination => false)
  end
end

