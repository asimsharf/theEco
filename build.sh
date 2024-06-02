#!/bin/bash

# Print the current date and time
date

# Clean Flutter and iOS build artifacts
flutter clean

# Remove lock files and directories
rm -rf pubspec.lock
rm -rf ios/Podfile.lock
rm -rf ios/Pods
rm -rf ios/.symlinks
rm -rf ios/build
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/Flutter.podspec

# Clean CocoaPods cache
if command -v pod &> /dev/null
then
    pod cache clean --all
else
    echo "CocoaPods not installed, skipping pod cache clean"
fi

# Get and upgrade Flutter packages
flutter pub get
flutter pub upgrade

# Navigate to iOS directory and run CocoaPods commands
if [ -d "ios" ]; then
    cd ios/ || exit

    if command -v pod &> /dev/null
    then
        pod install
        pod update
        pod repo update
        pod deintegrate
        pod install
    else
        echo "CocoaPods not installed, skipping pod commands"
    fi

    cd ../
else
    echo "iOS directory not found, skipping iOS specific steps"
fi

# Navigate to Android directory and run Gradle commands
if [ -d "android" ]; then
    cd android/ || exit

    if [ -f "./gradlew" ]; then
        ./gradlew clean
        ./gradlew build
    else
        echo "Gradlew not found, skipping Gradle commands"
    fi

    cd ../
else
    echo "Android directory not found, skipping Android specific steps"
fi

# Run Flutter build runner
flutter packages pub run build_runner build

# Print the current date and time again
date
