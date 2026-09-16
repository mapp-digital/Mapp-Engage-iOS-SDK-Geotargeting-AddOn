# MappSDKGeotargeting

MappSDKGeotargeting provides the Mapp Engage iOS geotargeting add-on. It wraps the vendored `AppoxeeLocationServices.xcframework` and exposes `AppoxeeLocationManager` for enabling and disabling geofence monitoring.

## Requirements

- iOS 16.0 or later
- Xcode with Swift Package Manager support
- Mapp Engage iOS SDK integrated in the host app
- Location usage descriptions in the host app `Info.plist`
- Background modes configured for location/background fetch when the app uses background geofence monitoring

## Swift Package Manager

Add this repository as a package dependency and link either product:

- `MappSDKGeotargeting`
- `Mapp-Engage-iOS-SDK-Geotargeting-AddOn`

The second product name is kept for compatibility. New integrations should prefer `MappSDKGeotargeting`.

```swift
dependencies: [
    .package(url: "https://github.com/mapp-digital/Mapp-Engage-iOS-SDK-Geotargeting-AddOn.git", from: "6.0.8")
]
```

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "MappSDKGeotargeting", package: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn")
    ]
)
```

The geotargeting binary depends on the main Mapp Engage iOS SDK at runtime/link time. Make sure the host app also links the main SDK package/framework before enabling location monitoring.

```

## Usage

Enable geotargeting only after the main Mapp Engage SDK is ready.

### Objective-C

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[Appoxee shared] engageAndAutoIntegrateWithLaunchOptions:launchOptions
                                                  andDelegate:nil
                                                         with:EMC_US];
    [[Appoxee shared] addObserver:self
                        forKeyPath:@"isReady"
                           options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                           context:NULL];

    return YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"isReady"]) {
        [[Appoxee shared] removeObserver:self forKeyPath:@"isReady"];
        [[AppoxeeLocationManager shared] enableLocationMonitoring];
    }
}
```

### Swift

```swift
import MappSDK
import MappSDKGeotargeting

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    Appoxee.shared()?.engageAndAutoIntegrate(launchOptions: launchOptions, andDelegate: nil)
    Appoxee.shared()?.addObserver(self, forKeyPath: "isReady", options: [.new, .old], context: nil)

    return true
}

override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?,
    change: [NSKeyValueChangeKey: Any]?,
    context: UnsafeMutableRawPointer?
) {
    guard keyPath == "isReady" else {
        super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        return
    }

    Appoxee.shared()?.removeObserver(self, forKeyPath: "isReady")
    AppoxeeLocationManager.shared()?.enableLocationMonitoring()
}
```

## License

See [MappLicence.txt](MappLicence.txt) or https://mapp.com/contracts/.
