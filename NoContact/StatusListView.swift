//
//  StatusListView.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import SwiftUI

struct StatusListView: View {
    @Binding var statusCounts: [Status]
    
    var body: some View {
        List {
            ForEach(statusCounts) { status in
                StatusRowView(type: status.type,
                              date: status.date,
                              count: status.count,
                              incrementAction: { self.incrementCount(forStatus: status) })
            }
            .onDelete(perform: deleteStatus)
        }
    }
    
    private func incrementCount(forStatus status: Status) {
        if let index = statusCounts.firstIndex(where: { $0.id == status.id }) {
            statusCounts[index].count += 1
        }
    }
    
    private func deleteStatus(at offsets: IndexSet) {
        statusCounts.remove(atOffsets: offsets)
    }
}

struct StatusListView_Previews: PreviewProvider {
    static var previews: some View {
        StatusListView(statusCounts: .constant([
            Status(type: "Example", date: "Apr 12, 2024", count: 3),
            Status(type: "Example", date: "Apr 13, 2024", count: 5),
            Status(type: "Example", date: "Apr 14, 2024", count: 2)
        ]))
    }
}
