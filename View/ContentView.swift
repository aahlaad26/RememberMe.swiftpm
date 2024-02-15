import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
                    NavigationView {
                        MainView()
                    }
                    .tabItem {
                        Label("Main", systemImage: "list.bullet")
                    }

                    NavigationView {
                        MemoryPoolView()
                    }
                    .tabItem {
                        Label("Memory Pool", systemImage: "square.grid.2x2")
                    }
                }
        
    }
    

}
