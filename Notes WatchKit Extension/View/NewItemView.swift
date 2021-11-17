//
//  NewItemView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct NewItemView: View {

    @State private var text = ""
    var saveAction: (String) -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 6.0) {
            TextField("Add New Note", text: $text)
                .cornerRadius(16)

            Button {
                guard !text.isEmpty else {return}
                saveAction(text)

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
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView { text in
        }
    }
}
