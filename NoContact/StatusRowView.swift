//
//  StatusCell.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import SwiftUI

struct StatusRowView: View {
    let type: String
    let date: String
    let count: Int
    let incrementAction: () -> Void
    
    var body: some View {
        HStack {
            Text(type)
            Spacer()
            Text(date)
            Spacer()
            Button(action: incrementAction) {
                Text("\(count)")
            }
        }
    }
}

#Preview {
    StatusRowView(type: "Example",
                  date: "Apr 14, 2024",
                  count: 0,
                  incrementAction: {})
        .previewLayout(.fixed(width: 300, height: 50))
}
