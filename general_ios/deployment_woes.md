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

## Clean Build
Sometimes when your build fail, it is because you need to clean build folder. You can do this via Product --> Clean Build Folder

## codesign wants to access key "access" in your bunch of keys
Click allow always and input your computer password

## Warning: unable to build chain to self-signed root for signer
There was no need for me to delete all my certs.

[source](https://developer.apple.com/forums/thread/86161)

Identifying the bad certificate:

### From you Keychains select Login
1. From Category select Certificates
1. Find any Apple Certificate that has the blue +
1. Double click on the certificate.
1. Expand the Trust
1.If it's messed up then the "When using this certificate" is set to "Always Trust" along with the blue +

### Fixing the bad certificate:

1. Just set it to "Use System Defaults" and close it.
1. You'll get a pop up. Type in your password to update settings.
1. Close KeyChain. Go back to your project, clean and run. Problem should have gone away.
1. If that didn't work then go back to Keychain and just double check and see if there are any other Apple certificates that are set to Always Trust and repeat the process.