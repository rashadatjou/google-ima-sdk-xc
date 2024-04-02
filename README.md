# Unofficial Combined Google IMA SDK iOS and tvOS

This project adds support for multi-platform XCFramework, Swift Package, and CocoaPods to the Google Interactive Media Ads (IMA) SDK. Due to the fact that both of the Google IMA iOS SDK and the Google IMA tvOS SDK were built from the same source but have been separated into different XCFrameworks that share the same name, it is possible to use them combined inside of a single XCFramework. Multi-platform projects will benefit from this variant of the IMA SDK.

## Checksum

```
e66013b366cca686e3199fd50c38ef439ceb7912ab1233ca37d515297632dbae
```

## Current supported version:

iOS: `3.20.0` – [Google Release](https://developers.google.com/interactive-media-ads/docs/sdks/ios/client-side/download)

tvOS: `4.11.1` – [Google Release](https://developers.google.com/interactive-media-ads/docs/sdks/tvos/client-side/download)

## Getting Started

### Swift Package Manager

To use this Swift Package in your Xcode project, follow these steps:

1. Open your project in Xcode.
2. Go to File > Swift Packages > Add Package Dependency.
3. Enter the URL of this repository https://github.com/rashadatjou/google-ima-sdk-xc and click Next.
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
