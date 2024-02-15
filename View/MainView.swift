import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Memory.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Memory.date, ascending: true)
        ],
        animation: .default
    )
    private var memories: FetchedResults<Memory>
    
    @State private var showNewMemory: Bool = false
    @State private var searchText: String = ""
    @State private var selectedMemory: Memory?
    

   
    
    var body: some View {
        
        
        ScrollView{
            NavigationView {
                List {
                    
                    if let memory = selectedMemory {
                        MemoryListRow(memory: memory)
                    }
                }
                .listStyle(PlainListStyle())

                .sheet(isPresented: $showNewMemory) {
                    NewMemoryView(isShow: self.$showNewMemory)
                        .offset(y:30)
                }
            }   .navigationBarTitle("Shuffled Memories")
                .navigationBarItems(
                    leading: Button(action: {
                        self.selectedMemory = memories.filter { searchText.isEmpty ? true : $0.name.contains(searchText) }.randomElement()
                    }) {
                        Image(systemName: "shuffle")
                            .foregroundColor(.accentColor)
                    },
                    trailing: Button(action: {
                        self.showNewMemory = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.accentColor)
                    }
                )

        }.onAppear {

            if let firstMemory = memories.first {
                self.selectedMemory = firstMemory
            }
        }
    }
}
#Preview {
    MainView()
}
