//
//  ListCardView.swift
//  Projekti_Mobile
//
//  Created by user253361 on 2/25/24.
//

import SwiftUI
import SwiftData


struct ListCardView: View {
    @Bindable var reminderList: ReminderList
    @State private var linkIsActive = false
    
    var body: some View {
        Button {
            linkIsActive = true
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    listIcon
                    Spacer()
                    Text("\(reminderList.reminder.count)")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.trailing)
                }
                Text(reminderList.name)
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(.secondary)
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
        }
        .overlay(
            NavigationLink(isActive: $linkIsActive,
                           destination: { ReminderListView(reminderList: reminderList) },
                           label: { EmptyView() }
                          ).opacity(0)
        ).buttonStyle(.plain)
    }
    
    var listIcon: some View {
        ZStack {
            Circle()
                .frame(width: 27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }
    }
}

#Preview {

    ListCardView()

    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self, configurations: config)
        let example = ReminderList(name: "Scheduled", iconName: "calendar", reminder: [Reminder(name: "Coffee with Qeqa")])
        
        return ReminderListView(reminderList: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }

}
