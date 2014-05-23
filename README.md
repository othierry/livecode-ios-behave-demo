livecode-ios-behave-demo
========================

LiveCode iOS - Behave.io Demo

[Cocoapods](http://guides.cocoapods.org/using/getting-started.html#installation) is required to properly setup dependencies

##### Install Cocoapods (if not installed)

```
$ sudo gem install cocoapods
```

##### Install dependencies

```
$ pod install
```

After dependencies finished to install, you can run:

```
$ open LiveCode.xcworkspace
```

Edit `LCAppDelegate.m`, spot the following line in **application:didFinishLaunchingWithOptions:**

```objective-c
[Behave sharedInstanceWithToken:@"REPLACE_WITH_YOUR_API_TOKEN"];
```

And replace **REPLACE_WITH_YOUR_API_TOKEN** with your API token. You can find it <a href="http://dashboard.behave.io/#/settings" target="_blank">here</a>

Build & Run

**Any questions? feedback? Please email us at <a href="mailto:founders@behave.io" target="_blank">founders@behave.io</a>**
