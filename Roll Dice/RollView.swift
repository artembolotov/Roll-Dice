//
//  RollView.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import SwiftUI

struct RollView: View {
    @State private var sides = 6
    @State private var count = 2
    @State private var result = [Int]()
    
    @EnvironmentObject var history: History
    
    
    var score: Int {
        result.sum()
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Number of sides", selection: $sides) {
                        ForEach(allowedSides, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Count of dices", selection: $count) {
                        ForEach(allowedCounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Button("Roll", action: roll)
                }
                
                if score > 0 {
                    Section {
                        HStack {
                            Text("Score:")
                            Spacer()
                            Text("\(score)")
                                .foregroundColor(.secondary)
                        }
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(result.map { value in NumberItem(value: value) } ) {
                                DiceResultView(value: $0.value)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Roll dice")
        }
    }
    
    private func roll() {
        result = (1...count).map { _ in Int.random(in: 1...sides) }
        history.append(HistoryItem(result: result, date: Date()))
    }
}

private let allowedSides = [4, 6, 8, 10, 12, 20, 100]
private let allowedCounts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView()
            .environmentObject(History())
    }
}
