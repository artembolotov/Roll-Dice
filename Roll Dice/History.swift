//
//  History.swift
//  Roll Dice
//
//  Created by artembolotov on 03.08.2023.
//

import Foundation

class History: ObservableObject {
    
    private(set) var results: [HistoryItem]
    private let fileName = "results.json"
    
    init() {
        let loadURL = FileManager.documentsDirectory.appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: loadURL)
            results = try JSONDecoder().decode([HistoryItem].self, from: data)
        } catch {
            print("Can't load data from \(fileName)")
            results = []
        }
    }
    
    private func save() {
        let saveURL = FileManager.documentsDirectory.appendingPathComponent(fileName)
        
        do {
            let encoded = try JSONEncoder().encode(results)
            try encoded.write(to: saveURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Can't save results to \(fileName)")
        }
    }
    
    func append(_ item: HistoryItem) {
        objectWillChange.send()
        results.append(item)
        save()
    }
    
    func clearAll() {
        objectWillChange.send()
        results.removeAll()
        save()
    }
}

struct HistoryItem: Codable, Hashable {
    let result: [Int]
    let date: Date
}
