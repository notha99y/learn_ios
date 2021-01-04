# Deployment woes

## Xcode 11 and running on an iOS 12 device or lower
source: https://fluffy.es/allow-app-created-in-xcode-11-to-run-on-ios-12-and-lower/

If you create a new app in Xcode 11 and try to run it on an iOS 12 device or lower, you will get a bunch of errors. This is because of the new SceneDelegrate.swift file which allows the multi-window feature introduced in iOS 13. As iOS 12 and earlier don't have these features, we will get these error messages.