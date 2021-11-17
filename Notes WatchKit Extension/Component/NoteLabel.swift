//
//  NoteLabel.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct NoteLabel: View {

    @AppStorage(Constants.lineCount) var lineCount = 1

    let text: String

    var body: some View {
        HStack {
            Capsule()
                .frame(width: 4)
                .foregroundColor(.accentColor)
            Text(text)
                .lineLimit(lineCount)
                .padding(.leading, 5.0)
        }
    }
}

struct NoteLabel_Previews: PreviewProvider {
    static var previews: some View {
        NoteLabel(text: "Sample Note")
    }
}
