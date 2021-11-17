//
//  SwiftUIView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct HeaderView: View {

    var title = ""

    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
                .font(.title3)
                .fontWeight(.bold)
            .foregroundColor(.accentColor)
            }

            HStack {
                Capsule().frame(height: 1)
                Image(systemName: "note.text")
                Capsule().frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
