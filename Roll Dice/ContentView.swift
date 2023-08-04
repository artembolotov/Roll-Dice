//
//  ContentView.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var history = History()
    
    var body: some View {
        TabView {
            RollView()
                .tabItem {
                    Label("Roll", systemImage: "dice")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "list.bullet.rectangle")
                }
        }
        .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

