//
//  EditNoteView.swift
//  Notes
//
//  Created by Ashutosh Srivastava on 8/12/25.
//

import SwiftUI

struct EditNoteView: View {
    @Binding var note: String

    var body: some View {
        VStack {
            TextEditor(text: $note)
                .padding()
                .navigationTitle("Edit Note")
        }
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView(note: .constant("Sample Note"))
    }
}
