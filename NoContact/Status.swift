//
//  Status.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import Foundation

struct Status: Identifiable, Equatable {
    let id = UUID()
    let type: String
    let date: String
    var count: Int
}
