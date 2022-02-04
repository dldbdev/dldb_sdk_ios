# DLDB SDK xcframework for iOS and Simulators

DLDB SDK packaged as an xcframework

## Getting Started

### Xcode and ObjectiveC

* using CocoaPods : 
add `pod 'DLDB' , '0.9.7'` into your Podfile,
run `Pod install`

* download `DLDB.xcframework` and drag the resulting folder into the `Frameworks` section of Project Explorer in Xcode
![xcframework in Xcode](docs/Xcode_with_DLDB.png)


### Xcode and Swift

* using CocoaPods : 
add `pod 'DLDB' , '0.9.7'` into your Podfile,
run `Pod install`

* custom integration :
1. download `DLDB.xcframework` and drag the resulting folder into the `Frameworks` section of Project Explorer in Xcode
![xcframework in Xcode](docs/Xcode_with_DLDB.png)
2. add `libz.tbd` and `libc++.tbd` in the `General/Frameworks, Libraries, and Embedded Content` section

3. Select `File > New... > File...` and then from `iOS/Source` choose `Header file` using the .h icon. You can give this header file any name you choose (it is called a "Bridging Header"). Add the following import directive into this file :
``` C
#import "DLDB_C.h"
```

4. build the project

## Usage

1. create a unique instance
```Swift
    let myDLDB: DLDB_C = DLDB_C()
```

2. start DLDB SDK after user consent
```Swift
    private var documentsDirectory: URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    myDLDB.start(documentsDirectory.path, 
                dldbApiKey: "11111111-1111-1111-1111-111111111111", 
                registerCallback: nil,
                dictionary: "{\"button\" : \"t\",\"batteryLevel\" : \"i\"}")
```

3. use wherever needed into the application
``` Swift
    // once per day
    myDLDB.heartbeat();
...
    // on a very regular basis, when app idle ?
    myDLDB.runQueriesIfAny();
...
    // wherever useful
    myDLDB.addEvents("{\"button\":\"log in\", \"batteryLevel\" : 55 }");
    // location and event
    CLLocation loc ...
    myDLDB.addEventsWithLocation(
        loc 
        eventsAsJson : '{"batteryLevel" : 5 }');
    // location only
    CLLocation loc ...
    myDLDB.addLocation(
        loc,
        eventsAsJson: "");

```


