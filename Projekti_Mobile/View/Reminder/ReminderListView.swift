//
//  ReminderListView.swift
//  Projekti_Mobile
//
//  Created by user253361 on 2/22/24.
//

import SwiftUI
import SwiftData

struct ReminderListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var reminderList: ReminderList
    
    var body: some View {
        VStack(alignment: .leading, spacing:5){
            HStack{
                Text(reminderList.name)
                Spacer()
                Text("\($reminderList.reminder.count)")
            }
            .font(.system(.largeTitle,design: .rounded))
            .foregroundColor(.primary)
            .padding(.horizontal)
            .bold()
            
            List{
                ForEach(reminderList.reminder){
                    reminders in Text(reminders.name)
                }
            }
            .listStyle(.inset)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button{
                    reminderList.reminder.append()
                }
            }
        }
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for:  ReminderList.self, configurations: config)
        let example = ReminderList(name: "Scheduled", iconName: "calendar", reminder: [Reminder(name: "Lunch with June!")])
        return ReminderListView(reminderList: example)
            .modelContainer(container)
    }catch{
        fatalError("Failed to create model container")
        
    }
}
