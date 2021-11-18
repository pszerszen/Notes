//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct ContentView: View {

    @AppStorage(Constants.lineCount) var lineCount = 1

    @State private var notes = [Note]()

    var body: some View {
        VStack {
            NewItemView(saveAction: save)

            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink {
                            DetailView(note: notes[i], count: notes.count, index: i)
                        } label: {
                            NoteLabel(text: notes[i].text)
                        }
                    }
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        }
        .navigationTitle("Notes")
        .onAppear(perform: load)
    }


    private func save(_ input: String?) {
        if let input = input {
            notes.append(Note(id: UUID(), text: input))
        }
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent(Constants.notes)
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }

    private func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent(Constants.notes)
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
            }
        }
    }

    private func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save(nil)
        }
    }

    private func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
