//
//  ReminderListRowView.swift
//  Projekti_Mobile
//
//  Created by user253361 on 2/22/24.
//

import SwiftUI
import SwiftData

struct ReminderListRowView: View {
    @Bindable var reminderList: ReminderList
    var body: some View {
        HStack{
            listIcon
            Text(reminderList.name)
            Spacer()
            Text("\(reminderList.reminder.count)")
        }
    }
    var listIcon: some View{
        ZStack{
            Circle()
                .fill(.primary)
                .frame(width:27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }    }
}


#Preview {
    do{
        let config=ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReminderList.self,
                                           configurations: config)
        let example = ReminderList(name: "App",iconName: "iphone",reminder: [Reminder(name: "Talk to Same"),Reminder(name: "Collect bounty")])
        return ReminderListRowView(reminderList: example)
            .modelContainer(container)
    }catch{
        fatalError("Failed to create model container")
    }
    
}
