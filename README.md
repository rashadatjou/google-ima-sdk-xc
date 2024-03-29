# Unofficial Combined Google IMA SDK iOS and tvOS

This is a project adds support for multi-platform XCFramework, Swift Package and CocoaPods to the Google Interactive Media Ads (IMA) SDK.

## Checksum

```
5f7afb56bd88087a73fa2ffe6700ad0bb6c7cc43db4ffe607d42ad0d4faab170
```

## Current supported version:

iOS: `3.19.1`

tvOS: `4.9.2`

## Getting Started

### Swift Package Manager

To use this Swift Package in your Xcode project, follow these steps:

1. Open your project in Xcode.
2. Go to File > Swift Packages > Add Package Dependency.
3. Enter the URL of this repository https://github.com/rashadatjou/swift-google-ima-spm.git and click Next.
4. Choose the version rule you want to use (e.g. "Up to Next Major") and click Next.
5. Select the target you want to add the package to and click Finish.
6. Import the GoogleInteractiveMediaAds module in your Swift files where you want to use the IMA SDK.

```Swift
import GoogleInteractiveMediaAds
```

7. You're now ready to use the IMA SDK in your app!

### CocoaPods

To use this Pod in your Xcode project, follow these steps:

1. Open your Podfile
2. Add the following code to it:

```ruby
pod `GoogleInteractiveMediaAdsXC`
```

3. Run `pod install` in your terminal.

## Resources

For more information on how to use the IMA SDK, see the official documentation.

iOS: https://developers.google.com/interactive-media-ads/docs/sdks/ios/client-side

tvOS: https://developers.google.com/interactive-media-ads/docs/sdks/tvos/client-side
