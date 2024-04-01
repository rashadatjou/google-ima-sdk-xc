#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Error: No arguments provided."
  echo "Usage: $0 [iOS version] [tvOS version]"
  exit 1
fi

IOS_VERSION=$1
echo "iOS: $IOS_VERSION"

TVOS_VERSION=$2
echo "tvOS: $TVOS_VERSION"

if [[ ! $IOS_VERSION =~ ^[0-9]+\.[0-9]+ ]]; then
    echo "Wrong iOS version $IOS_VERSION"
    exit 1
fi

if [[ ! $TVOS_VERSION =~ ^[0-9]+\.[0-9]+ ]]; then
    echo "Wrong tvOS version $TVOS_VERSION"
    exit 1
fi

# Step 0: Define URLs for the frameworks
URL_FRAMEWORK_IOS="https://imasdk.googleapis.com/native/downloads/ima-ios-v$IOS_VERSION.zip"
URL_FRAMEWORK_TVOS="https://imasdk.googleapis.com/native/downloads/ima-tvos-v$TVOS_VERSION.zip"

# Step 1: Setup Variables
RELEASE_DIR=".release"
DOWNLOADS_DIR="$RELEASE_DIR/Downloads"
PRODUCT_DIR="$RELEASE_DIR/Product"
FRAMEWORK_NAME="GoogleInteractiveMediaAds"
FRAMEWORK_IOS="iOS"
FRAMEWORK_TVOS="tvOS"

# Step 1: Create Downloads
# Check if the Release directory exists and remove it
if [ -d "$RELEASE_DIR" ]; then
    rm -rf "$RELEASE_DIR"
fi

mkdir -p "$DOWNLOADS_DIR"

# Step 2: Download and unzip the frameworks
# Download framework iOS
curl -L $URL_FRAMEWORK_IOS -o "$DOWNLOADS_DIR/$FRAMEWORK_IOS.zip"
unzip -q "$DOWNLOADS_DIR/$FRAMEWORK_IOS.zip" -d "$RELEASE_DIR"
mv "$RELEASE_DIR/$FRAMEWORK_NAME.xcframework" $RELEASE_DIR/$FRAMEWORK_IOS

# Download framework tvOS
curl -L $URL_FRAMEWORK_TVOS -o "$DOWNLOADS_DIR/$FRAMEWORK_TVOS.zip"
unzip -q "$DOWNLOADS_DIR/$FRAMEWORK_TVOS.zip" -d "$RELEASE_DIR"
mv "$RELEASE_DIR/$FRAMEWORK_NAME.xcframework" $RELEASE_DIR/$FRAMEWORK_TVOS

# Step 3: Prepare new XCFramework structure
MERGED_XCFRAMEWORK_DIR="$PRODUCT_DIR/$FRAMEWORK_NAME.xcframework"
mkdir -p "$MERGED_XCFRAMEWORK_DIR"

# Step 4: Copy the individual frameworks into the new structure
# Assuming the frameworks from 'ios' and 'tvOS' are already extracted to $RELEASE_DIR
cp -R "$RELEASE_DIR/$FRAMEWORK_IOS/ios-arm64" "$MERGED_XCFRAMEWORK_DIR"
cp -R "$RELEASE_DIR/$FRAMEWORK_IOS/ios-arm64_x86_64-simulator" "$MERGED_XCFRAMEWORK_DIR"
cp -R "$RELEASE_DIR/$FRAMEWORK_TVOS/tvos-arm64" "$MERGED_XCFRAMEWORK_DIR"
cp -R "$RELEASE_DIR/$FRAMEWORK_TVOS/tvos-arm64_x86_64-simulator" "$MERGED_XCFRAMEWORK_DIR"

# Step 5: Generate the new Info.plist
cat << EOF > "$MERGED_XCFRAMEWORK_DIR/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>AvailableLibraries</key>
    <array>
        <dict>
            <key>LibraryIdentifier</key>
            <string>ios-arm64</string>
            <key>LibraryPath</key>
            <string>GoogleInteractiveMediaAds.framework</string>
            <key>SupportedArchitectures</key>
            <array>
                <string>arm64</string>
            </array>
            <key>SupportedPlatform</key>
            <string>ios</string>
        </dict>
        <dict>
            <key>LibraryIdentifier</key>
            <string>ios-arm64_x86_64-simulator</string>
            <key>LibraryPath</key>
            <string>GoogleInteractiveMediaAds.framework</string>
            <key>SupportedArchitectures</key>
            <array>
                <string>arm64</string>
                <string>x86_64</string>
            </array>
            <key>SupportedPlatform</key>
            <string>ios</string>
            <key>SupportedPlatformVariant</key>
            <string>simulator</string>
        </dict>
        <dict>
            <key>LibraryIdentifier</key>
            <string>tvos-arm64</string>
            <key>LibraryPath</key>
            <string>GoogleInteractiveMediaAds.framework</string>
            <key>SupportedArchitectures</key>
            <array>
                <string>arm64</string>
            </array>
            <key>SupportedPlatform</key>
            <string>tvos</string>
        </dict>
        <dict>
            <key>LibraryIdentifier</key>
            <string>tvos-arm64_x86_64-simulator</string>
            <key>LibraryPath</key>
            <string>GoogleInteractiveMediaAds.framework</string>
            <key>SupportedArchitectures</key>
            <array>
                <string>arm64</string>
                <string>x86_64</string>
            </array>
            <key>SupportedPlatform</key>
            <string>tvos</string>
            <key>SupportedPlatformVariant</key>
            <string>simulator</string>
        </dict>
    </array>
    <key>CFBundlePackageType</key>
    <string>XFWK</string>
    <key>XCFrameworkFormatVersion</key>
    <string>1.0</string>
</dict>
</plist>
EOF

# No step 6 is needed since we've manually merged. Display completion message.
echo "Merge completed. The merged XCFramework is located at: $MERGED_XCFRAMEWORK_DIR"
