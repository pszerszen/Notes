//
//  File.swift
//  Notes WatchKit Extension
//
//  Created by Piotr Szerszeń on 17/11/2021.
//

import Foundation

struct Note: Identifiable, Codable {

    let id: UUID
    let text: String
}
