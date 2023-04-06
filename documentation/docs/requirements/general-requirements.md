---
sidebar_position: 3
---

# General Requirements

1. A smartphone (iOS or Android)
2. A stable internet connection or cellular data
3. At least one social media account (Discord, Instagram, Snapchat, Facebook, SMS, etc.)

<h2> Running The Project </h2>

### Android


#### Precompiled (Recommended for Users)

Precompiled APK binaries can be found under the [Releases](https://github.com/Capstone-Projects-2023-Spring/project-groupmeet/releases) tab on Github.

Further instructions on how to sideload APK files can be found [here](https://www.lifewire.com/install-apk-on-android-4177185).


#### From Source (For Developers or iOS Users)

Download The Required Packages:<br/>
Android Studios - https://developer.android.com/studio?gclid=Cj0KCQjwtsCgBhDEARIsAE7RYh3GLldIaM0FTlhDIounMzKd5c-MJrDKD7v7xqhQNtEqvpgtDDfMWqMaAjDNEALw_wcB&gclsrc=aw.ds<br/>
Flutter SDK - https://docs.flutter.dev/get-started/install?gclid=Cj0KCQjwtsCgBhDEARIsAE7RYh2nAMF4Wf0BBWiHCr23FdQzAFEU5jo0ZYbOUzh4WztsIqaX2AsCFkoaAimtEALw_wcB&gclsrc=aw.ds<br/>

Prepare the IDE:

<p>
-Open Android Studios, and under the plugins section install the Dart and Flutter plug-ins.<br/>
-Create an android studios emulator using the following instructions: <br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select the Device Manager (this tends to be on the top right, and has a small phone icon with a droid logo on the bottom right)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select "Create Device", and then choose a phone and System of your choice (Recommend system image of 29+)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;-Select "Finish", and then press the play button on the device manager to start running your emulator.<br/>
-Download the most recent release of this project, and open the "project" directory in Android Studios<br/>
-Once it is running, you should be able to select the Run button in Android Studios, and it should play on your emulator!<br/>
</p>


### iOS

Note: You must have a device running macOS to perform these steps. 

To install on iOS, we recommend first getting the app running in the Android emulator. This will ensure certain common requirements are met including Flutter. Instructions can be found in the Android > From Source section of this document.

After those steps are followed, install the latest version of Xcode from the Apple Mac App Store. Upon downloading, launch Xcode and install the necessary developer tools. Then open Runner.xcworkspace located in the project/ios folder. If not enabled, enable developer mode on your iPhone in Settings > Privacy & Security > Developer Mode. Connect your device to your Mac and select it from the dropdown at the top of Xcode. To codesign, open Runner.xcodeproj and navigate to Signing and Capabilities. Under Team: Sign in with your personal Apple ID. Then click the run button. After it compiles and installs, on your iPhone, navigate to Settings > General > VPN & Device Management. Select your Apple ID name under Developer App and trust it. You may then rerun the app using Xcode.

Troubleshooting Tip: If an error occurs related to Cocoapods, using the Terminal, navigate to the project's root directory, then the project/ios folder. Run `pod install`. If that fails try running `pod update Firebase/Database` or other general Cocoapods troubleshooting tips (eg: Look it up on DuckDuckGo).