//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage(Constants.lineCount) var lineCount = 1

    var body: some View {
        VStack(spacing: 8.0) {
            HeaderView(title: "Settings")

            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)

            Slider(value: Binding(get: {
                return Double(lineCount)
            }, set: { newValue in
                lineCount = Int(newValue)
            }), in: 1...4, step: 1)
                .tint(.accentColor)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
