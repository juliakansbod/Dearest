//
//  AddNewView.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct AddNewView: View {
    
    @EnvironmentObject var entryModel: EntryModel
    @Environment(\.self) var env
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            HStack {
                Text("What's on your mind today?")
                    .font(.title).bold()
                Spacer()
                
                Image(systemName: "xmark")
                    .fontWeight(.bold)
                    .onTapGesture {
                        env.dismiss()
                    }
            }
            .foregroundColor(Color("Red"))
    
            TextField("Add title", text: $entryModel.title)
            
            Text("Write down your thoughts...")
                .font(.title2.bold())
                .foregroundColor(Color("Red")).opacity(0.7)
            
            TextEditor(text: $entryModel.entryBody)
            
            Button(showImage: false, text: entryModel.editEntry != nil ? "Save changes" : "Add new entry")
                .onTapGesture {
                    Task{
                        if await entryModel.addEntry(context: env.managedObjectContext) {
                            env.dismiss()
                        }
                    }
                }
                .disabled(!entryModel.doneStatus())
                .opacity(entryModel.doneStatus() ? 1 : 0.6)
            
        }
        .padding(30)
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
            .environmentObject(EntryModel())
    }
}
