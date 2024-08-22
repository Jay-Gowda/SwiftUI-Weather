//
//  AccessibilityVoiceOver.swift
//  SwiftUI-Weather
//
//  Created by Jayanth Gowda on 16/08/24.
//

import SwiftUI

struct AccessibilityVoiceOver: View {
    @State private var isActive:Bool = true
    var body: some View {
        Form{
            Section {
                HStack{
                    Text("Favourite")
                    Toggle("Volume", isOn: $isActive)
                }
            } header: {
                Text("Preferences")
            }

        }
    }
}

#Preview {
    AccessibilityVoiceOver()
}
