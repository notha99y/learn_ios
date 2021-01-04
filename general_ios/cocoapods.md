# Cocoapods
## Useful link

## Setup

```bash
sudo gem install cocoapods
```
If this throws an error try the following ((source)[https://stackoverflow.com/questions/20939568/error-error-installing-cocoapods-error-failed-to-build-gem-native-extension])
```bash
brew cleanup -d -v
brew install cocoapods
pod setup --verbose # gets the latest cocoapods github
pod --version # check installation is working
```
## Useful Pod commands
```bash
pod setup --verbose # gets the latest cocoapods github
```
```bash
pod --version # get pod version number
```
```bash
pod init # creates a new pod file
```
```bash
pod install # installs dependencies specified in Podfile and creates xcworkspace
```

## Add Cocoapods to your App
1. Navigate to the directory where your project lives
1. run `pod init`
1. run `pod install`
1. close any Xcode sessions and use the new `xcworkspace` (the white file instead of the blue one) for the project from now on