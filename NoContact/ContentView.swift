//
//  ContentView.swift
//  NoContact
//
//  Created by Fareed Quraishi on 2024-04-14.
//

import SwiftUI

struct ContentView: View {
    @State private var statusCounts: [Status] = []
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy" // Date format
        return formatter
    }()
    
    private let statusCountsKey = "statusCounts"
    
    var body: some View {
        NavigationView {
            VStack {
                if statusCounts.isEmpty {
                    Text("Please add a new status by pressing the button below.")
                        .padding()
                } else {
                    StatusListView(statusCounts: $statusCounts)
                }
                Spacer()
                AddStatusButton(addAction: addNewStatus)
            }
            .navigationTitle("Status List")
        }
        .onAppear {
            loadStatusCountsFromUserDefaults()
        }
        .onChange(of: statusCounts) {
            saveStatusCountsToUserDefaults()
        }
    }
    
    private func incrementCount(forStatus status: Status) {
        if let index = statusCounts.firstIndex(where: { $0.id == status.id }) {
            statusCounts[index].count += 1
        }
    }
    
    private func addNewStatus(_ statusType:String) {
        statusCounts.append(Status(type: statusType, date: dateFormatter.string(from: Date()), count: 0))
    }
    
    private func deleteStatus(at offsets: IndexSet) {
        statusCounts.remove(atOffsets: offsets)
    }
    
    private func saveStatusCountsToUserDefaults() {
        let data = statusCounts.map { [$0.type, $0.date, $0.count] }
        UserDefaults.standard.set(data, forKey: statusCountsKey)
    }
    
    private func loadStatusCountsFromUserDefaults() {
        if let data = UserDefaults.standard.array(forKey: statusCountsKey) as? [[Any]] {
            statusCounts = data.compactMap { tuple in
                guard tuple.count == 3, // Ensure there are three elements in the tuple
                      let type = tuple[0] as? String, // Extract type from tuple
                      let date = tuple[1] as? String,
                      let count = tuple[2] as? Int else {
                    return nil
                }
                return Status(type: type, date: date, count: count) // Create Status object
            }
        }
    }
}
