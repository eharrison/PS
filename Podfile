platform :ios, '9.0'

use_frameworks!

# Shared Pods

def shared_data_pod
    pod 'AwesomeData', git: 'https://github.com/iOSWizards/AwesomeData.git', tag: '0.5.4'
end

def shared_firebase_pod
    pod 'Firebase/Core'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
end

# ====== iOS App =======

target 'PS' do
      shared_data_pod
      shared_firebase_pod
end

target 'PS-Editor' do
    shared_data_pod
    shared_firebase_pod
end
