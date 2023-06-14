//
//  Setting_ViewUI.swift
//  Smart_Chat
//
//  Created by brianjien on 6/14/23.
//

import SwiftUI

struct Setting_ViewUI: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account")) {
                    NavigationLink(destination: AccountSettingsView()) {
                        Text("Account Settings")
                    }
                    NavigationLink(destination: PrivacySettingsView()) {
                        Text("Privacy Settings")
                    }
                    NavigationLink(destination: NotificationSettingsView()) {
                        Text("Notification Settings")
                    }
                }
                
                Section(header: Text("General")) {
                    NavigationLink(destination: ThemeSettingsView()) {
                        Text("Theme Settings")
                    }
                    NavigationLink(destination: LanguageSettingsView()) {
                        Text("Language Settings")
                    }
                    NavigationLink(destination: AppearanceSettingsView()) {
                        Text("Appearance Settings")
                    }
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: AboutAppView()) {
                        Text("About App")
                    }
                 
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Smart Chat Setting")
            
        }
    }
}

struct Setting_ViewUI_Previews: PreviewProvider {
    static var previews: some View {
        Setting_ViewUI()
    }
}
