//
//  EntryModel.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI
import CoreData

class EntryModel: ObservableObject {
    
    @Published var addNewEntry: Bool = false
    
    @Published var title: String = ""
    @Published var entryBody: String = ""
    @Published var date: Date = Date()
    
    @Published var editEntry: Entry?
    
    func addEntry(context: NSManagedObjectContext)async -> Bool{
        
        var entry: Entry!
        
        if let editEntry = editEntry {
            entry = editEntry //if we are editing, we are replacing entry with editEntry. If not, a normal new entry is created.
        } else {
            entry = Entry(context: context)
        }
        
        entry.title = title
        entry.body = entryBody
        entry.date = date
        
        if let _ = try? context.save(){
            return true
        }
        
        return false
    }
    
    func resetData() {
        title = ""
        entryBody = ""
        date = Date()
        editEntry = nil
    }
    
    func restoreEditData(){
        if let editEntry = editEntry {
            title = editEntry.title ?? ""
            entryBody = editEntry.body ?? ""
            date = editEntry.date ?? Date()
        }
    }
    
    func doneStatus()->Bool{
        
        if title == "" || entryBody == ""{
            return false
        }
        
        return true
    }
    
}
