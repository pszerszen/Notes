//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct DetailView: View {

    let note: Note
    let count: Int
    let index: Int

    @State private var creditsPresented = false
    @State private var settingsPresented = false

    var body: some View {
        VStack(alignment: .center, spacing: 3.0) {
            HeaderView()
            Spacer()

            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()

            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        settingsPresented.toggle()
                    }
                    .sheet(isPresented: $settingsPresented) {
                        SettingsView()
                    }
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        creditsPresented.toggle()
                    }
                    .sheet(isPresented: $creditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundColor(.secondary)
        }
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "Hello, World!"),
                   count: 5,
                   index: 1)
    }
}
