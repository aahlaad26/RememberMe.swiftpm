import SwiftUI

struct NewMemoryView: View {
    @Binding var isShow: Bool
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var memoryName: String = ""
    @State private var memoryPara: String = ""
    @State private var isEditing: Bool = false // to track if TextField is being editit or not
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker = false
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {
        ScrollView{
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        TextField("Add new memory", text: $memoryName)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                                        .padding()
                                        .textFieldStyle(.roundedBorder)
                                        .offset(x:-30)
                        Spacer()
                        Button(action: {
                            self.isShow = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title3)
                                .foregroundColor(.orange)
                        } //: Button
                    } //: HStack
                    
                                     // Optional: Adds a rounded border to the text field
                                    .padding()
                    TextEditor(text: self.$memoryPara)
                        .frame(width: 320,height: 400)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom)
                    
                    
                    
                    
                    HStack{Text("Date Of Memory: ")
                            .fontWeight(.semibold)
                        Spacer()
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                                    .frame(maxWidth: .infinity)
                    }

                
                
                            
                
                    Button (action: {
                        // to make sure that memory description is not empty
                        guard self.memoryName.trimmingCharacters(in: .whitespaces) != "" else { return }
                        
                        self.isShow = false
                        self.addNewMemory(name: self.memoryName,date: self.selectedDate,para: self.memoryPara)
                    }) {
                        Text("Add new Memory")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.orange)
                    } //: Button
                    .cornerRadius(10)
                    .padding(.vertical)
                } //: VStack
                .padding()
                .background(Color.white)
                .cornerRadius(10, antialiased: true)
                .offset(y: self.isEditing ? -320 : 0) // to prevent the system keyboard to overlay on this view
            } //: VStack
            .edgesIgnoringSafeArea(.bottom)
            
        }

    }
    
    private func addNewMemory(name: String, date : Date,para : String) -> Void {
        let newMemory = Memory(context: viewContext)
        newMemory.id = UUID()
        newMemory.name = name
        newMemory.date = date
        newMemory.para = para
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct NewMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewMemoryView(isShow: .constant(true))
    }
}
