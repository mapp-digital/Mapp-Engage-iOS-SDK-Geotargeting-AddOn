MappSDKGeotargeting
===========

This repository contains the Mapp Geotargeting iOS SDK, which can be use for push messages sendout at region of interests.

Integration
-----------
**Cocoa pods**

```ruby
target 'project_name' do
    pod 'MappSDKGeotargeting'
end
```

**OR**

```ruby
target 'project_name' do
    pod 'MappSDKGeotargeting', :git => 'https://github.com/MappCloud/MappSDKGeotargeting.git', :tag => '6.0.6'
end
```

**Manual**

* Drag and drop the ```AppoxeeSDK.framework``` to your project.
* Drag and drop the ```AppoxeeSDKResources.bundle``` to your project.
* Drag and drop the ```AppoxeeLocationServices.framework``` to your project.
* Link ```CoreLocation.framework``` and ```SQLite3``` to your project.

**Configuration file**
Make sure to provide an **AppoxeeConfig.plist** file for **AppoxeeSDK**.

Implementation
-----------

**Objective-C**

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        [[Appoxee shared] engageAndAutoIntegrateWithLaunchOptions:launchOptions andDelegate:nil with:EMC_US];
        [[Appoxee shared] addObserver:self forKeyPath:@"isReady" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];

    return YES;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"isReady"]) {

        [[Appoxee shared] removeObserver:self forKeyPath:@"isReady"];

        [[AppoxeeLocationManager shared] enableLocationMonitoring];
    }
}
```

**Swift**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        Appoxee.shared()?.engageAndAutoIntegrate(launchOptions: launchOptions, andDelegate: nil)
        Appoxee.shared()?.addObserver(self, forKeyPath: "isReady", options: ([.new, .old]), context: nil)

        return true
}

override func observeValue(forKeyPath keyPath: String?, of object: AnyObject?, change: [NSKeyValueChangeKey : AnyObject]?, context: UnsafeMutablePointer<Void>?) {

        if (keyPath == "isReady") {

            Appoxee.shared()?.removeObserver(self, forKeyPath: "isReady")
            AppoxeeLocationManager.shared().enableLocationMonitoring()
        }
}
```

License
-------
https://mapp.com/contracts/
