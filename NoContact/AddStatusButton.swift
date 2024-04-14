//
//  AddStatusButton.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import SwiftUI

struct AddStatusButton: View {
    let addAction: () -> Void
    
    var body: some View {
        Button(action: {
            addAction()
        }) {
            Text("Add New Status")
        }
        .padding()
    }
}

#Preview {
    AddStatusButton(addAction: {})
}
