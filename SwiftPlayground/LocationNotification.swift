//
//  LocationNotification.swift
//  SwiftPlayground
//
//  Created by francis on 01/05/2025.
//

import SwiftUI
import UserNotifications


struct LocationNotification: View {
    
    @State private var authorized = false
    var body: some View {
        VStack{
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 150))
                .foregroundStyle(.purple,.black)
            
            
            if(authorized){
                Button("Send Notification"){
                    scheduleNotification()
                }
            }
        }.onAppear(){
            requestAuthorization()
        }
    }
    
    
    func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){ success, _ in
            if(success){
                authorized = true
            }else{
                authorized = false
            }
            
        }
    }
    
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Hola"
        content.subtitle = "Senor Francis"
        content.sound = .default
        
        let identifier = UUID().uuidString
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
//        UNUserNotificationCenter.current().delegate = self

        UNUserNotificationCenter.current().add(request)
        
    }
}




#Preview {
    LocationNotification()
}
