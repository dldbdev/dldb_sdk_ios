//created by christophe@dld.io

import SwiftUI
import SQLite

struct ContentView: SwiftUI.View {
    private let myDLDB: DLDB_C = DLDB_C()
    private var documentsDirectory: URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }

    var body: some SwiftUI.View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .padding()
            Button("Send Heartbeat", action: {
                myDLDB.heartbeat()
            })
            Button("log events", action: {
                myDLDB.addEvents(nil, eventsAsJson: "{\"button\":\"log in\", \"batteryLevel\" : 55 }")
            })
        }
        .onAppear() {
            myDLDB.start(documentsDirectory.path,
                         dldbApiKey: "1688e135-f5b1-4659-b84a-96ff15c07f57",
                         registerCallback: nil,
                         dictionary: "{\"button\" : \"t\",\"batteryLevel\" : \"i\"}")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        ContentView()
    }
}
