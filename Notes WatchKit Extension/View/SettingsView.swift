//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("lineCount") var lineCount = 1
    @State private var value: Float = 1.0

    var body: some View {
        VStack(spacing: 8.0) {
            HeaderView(title: "Settings")

            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)

            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
        }
    }

    private func update() {
        lineCount = Int(value)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
