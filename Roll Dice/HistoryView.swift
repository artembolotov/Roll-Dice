//
//  HistoryView.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: History
    
    var body: some View {
        NavigationStack {
            
            List(history.results.sorted { $0.date > $1.date }, id: \.self) { historyItem in
                VStack {
                    makeTitle(historyItem)
                    makeDetails(historyItem.result)
                }
            }
            .navigationTitle("History")
            .toolbar {
                Button("Clear", action: history.clearAll)
            }
        }
    }
    
    @ViewBuilder private func makeTitle(_ item: HistoryItem) -> some View {
        HStack {
            Text(item.date.prettyFormatted())
            Spacer()
            Text("\(item.result.sum())")
                .foregroundColor(.secondary)
        }
    }
    
    @ViewBuilder private func makeDetails(_ result: [Int]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(result.map { value in NumberItem(value: value) } ) {
                    DiceResultView(value: $0.value)
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(History())
    }
}
