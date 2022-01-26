Pod::Spec.new do |spec|
  spec.name         = "DLDB"
  spec.version      = "0.9.6"
  spec.summary      = "DLDB SDK as ObjC xcframework"
  spec.description  = <<-DESC
DLDB provides behavioural analytics for mobile applications with privacy by design.
DLDB architecture relies on an SDK to be integrated into a mobile application, and a dashboard https://dashboard.dldb.io/ to build, query and analyze the behaviour of the application users.
For the application, DLDB deploys a distributed database, where each database instance is inside the mobile application scope. All the analytics queries are run by the devices and no raw data ever leaves the devices. Only the statistical KPI-s are sent to the DLDB dashboard.
From the DLDB dashboard, developers, analysts and app owners can build their own queries and analyze the results. No need to have any additional storage or analytics platform: DLDB provides an end-to-end solution.
DLDB SDK is written in C and has bindings to most common languages - works natively on iOS, available as pod DLDB containing objectiveC xcframework.
                   DESC
  spec.homepage     = "https://dldb.io"
  spec.license      = "MIT"
  spec.author             = { "Christophe" => "support@dldb.io" }
  spec.platform     = :ios, "15.0"
  spec.vendored_frameworks = "DLDB.xcframework"
  spec.source       = { :git => 'https://github.com/dldbdev/dldb_sdk_ios.git', :tag => "v#{spec.version}" }
end
