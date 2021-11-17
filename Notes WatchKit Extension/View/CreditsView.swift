//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import SwiftUI

struct CreditsView: View {

    @State private var randomNumber = Int.random(in: 1...3)

    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }

    var body: some View {
        VStack {
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)

            HeaderView(title: "Credits")

            Text("Piotr Szerszeń")
                .fontWeight(.bold)
                .foregroundColor(.primary)

            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
