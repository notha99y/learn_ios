# Deployment woes

## Xcode 11 and running on an iOS 12 device or lower
source: https://fluffy.es/allow-app-created-in-xcode-11-to-run-on-ios-12-and-lower/

If you create a new app in Xcode 11 and try to run it on an iOS 12 device or lower, you will get a bunch of errors. This is because of the new SceneDelegrate.swift file which allows the multi-window feature introduced in iOS 13. As iOS 12 and earlier don't have these features, we will get these error messages.

## iPhone is not available. Please reconnect the device
source: https://stackoverflow.com/questions/61863826/iphone-is-not-available-please-reconnect-the-device#:~:text=If%20you're%20still%20encountering,It%20worked%20for%20me!&text=Developers%20who%20are%20using%20Xcode,will%20also%20see%20this%20message.

Most of the time, it is a version incompatiability between xcode and iOS. You can check this by clicking Window > Devices and Simulators

## Invalid code signature due to inadequate entitlements
source: https://stackoverflow.com/questions/61865231/invalid-code-signature-due-to-inadequate-entitlements

To solve this issue, go to the device Setting > General > Profiles or Settings > Device Management, depending on the device type and iOS version you are running, Trust the developer and allow the apps to run.


## Using Camera
When building apps that uses camera, you have to add a line to Info.plist, explaining to user why you want to use the camera

Tag: Privacy- Camera Usage Description

## Unknown class in Interface Builder file
source: https://developer.apple.com/forums/thread/122947
Sometimes you would have this error when building the app. This can be fixed by checking the Module of the sotryboard file in Identity Inspector, check if it is the same with your project and not "none" or something else.


## Removing Caches
Sometimes you would have some double IBActions links, etcs... this can be fixed by removing the cache in your project folders in `/Library/Developer/Xcode/DerivedData/` and all the files in `yourhomepath/Library/Developer/Xcode/DerivedData/ModuleCache.noindex`.

Please ensure that you close all xcode projects before doing this.

No assistant found: Give xcode sometime to reindex the files, and the assistant view would be available.