import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
                    NavigationView {
                        MemoryShufflerView()
                    }
                    .tabItem {
                        Label("Memory Shuffler", systemImage: "shuffle")
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
