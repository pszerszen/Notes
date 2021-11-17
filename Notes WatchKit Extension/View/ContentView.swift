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
    @State private var text = ""

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6.0) {
                TextField("Add New Note", text: $text)

                Button {
                    guard !text.isEmpty else {return}
                    notes.append(Note(id: UUID(), text: text))
                    save()

                    text = ""
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)

            }
            Spacer()

            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink {
                            DetailView(note: notes[i], count: notes.count, index: i)
                        } label: {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5.0)
                            }
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


    private func save() {
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
            save()
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
