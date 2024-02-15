import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
                    NavigationView {
                        MemoryShufflerView()
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
