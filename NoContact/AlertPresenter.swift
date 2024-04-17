//
//  AlertPresenter.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct AlertPresenter<Content: View>: View {
    @Binding var isPresented: Bool
    let content: Content
    
    var body: some View {
        content.alert(isPresented: $isPresented) {
            Alert(title: Text("Add New Status"), content: {
                TextField("Enter status", text: $text)
            })
        }
    }
    
    init(alert: Alert, isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }
}

//#Preview {
//    AlertPresenter()
//}
