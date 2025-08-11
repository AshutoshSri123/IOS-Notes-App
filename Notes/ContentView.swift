import SwiftUI

struct ContentView: View {
    // Sample notes
    @State private var notes = [
        "Buy groceries",
        "Call Alice",
        "Prepare presentation"
    ]
    @State private var selectedNoteIndex: Int? = nil
    
    func deleteNotes(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }



    var body: some View {
        NavigationStack {
            List {
                ForEach(notes.indices, id: \.self) { index in
                    Text(notes[index])
                        .onTapGesture {
                            selectedNoteIndex = index
                        }
                }
                .onDelete(perform: deleteNotes)
            }

            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        notes.append("New Note \(notes.count + 1)")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: Binding<Bool>(
                get: { selectedNoteIndex != nil },
                set: { newValue in
                    if !newValue { selectedNoteIndex = nil }
                })
            ) {
                if let index = selectedNoteIndex {
                    EditNoteView(note: $notes[index])
                }
            }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


