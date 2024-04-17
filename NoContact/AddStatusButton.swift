//
//  AddStatusButton.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import SwiftUI

struct AddStatusButton: View {
    let addAction: (String) -> Void
    @State private var isRequestingStatusType = false
    @State private var newStatusType: String = ""
    
    var body: some View {
        Button(action: {
            isRequestingStatusType.toggle()
        }) {
            Text("Add New Status")
        }
        .alert("Create a new type to monitor", isPresented: $isRequestingStatusType) {
            TextField("Example: Stalked Socials", text: $newStatusType)
            Button("OK", action: authenticate)
            Button("Cancel", role: .cancel) { }
                .padding()
        }
    }
        
    func authenticate() {
        addAction(newStatusType)
    }
}

//#Preview {
//    AddStatusButton(addAction: {})
//}
