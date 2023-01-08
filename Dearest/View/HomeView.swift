//
//  HomeView.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager //Authentication Manager for logging out
    
    @FetchRequest(entity: Entry.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Entry.date, ascending: false)], predicate: nil, animation: .easeInOut) var entries: FetchedResults<Entry>
    
    @StateObject var entryModel: EntryModel = .init()
    
    var body: some View {
        
        VStack{
            //MARK: Title, Settings and Logout button
            HStack {
                
                Title()
                
                Spacer()
                
                Button(showImage: false, text: "Log Out")
                    .onTapGesture {
                        authenticationManager.logout()
                    }
                
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gear")
                        .foregroundColor(Color("Red"))
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }

            }
            
            //MARK: Diary entries
            if !entries.isEmpty {
                ZStack {
                    ScrollView {
                        
                        GreetingCard()
                            .padding(.bottom, 10)
                        
                        ForEach(entries) { entry in
                            NavigationLink {
                                EntryView(entry: entry)
                            } label: {
                                DiaryCard(title: entry.title!, entryBody: entry.body!, date: entry.date!)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                    //MARK: Add Button
                    VStack {
                        Spacer()
                        AddButton()
                            .onTapGesture {
                                entryModel.addNewEntry.toggle()
                            }
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                }
                
            } else { //MARK: No entries yet
                
                    GreetingCard()
                    
                    Spacer()
                    
                    Image("home-icon")
                        .resizable()
                        .frame(width: 270.0, height: 270.0, alignment: .center)
                    
                    Spacer()
                    //MARK: Add Button, "Add first" text, Arrow
                    HStack {
                        Text("Add your first entry")
                        Spacer()
                        Image(systemName: "arrow.right")
                        
                        Spacer()
                        AddButton()
                            .onTapGesture {
                                entryModel.addNewEntry.toggle()
                            }
                    }
                    .font(.title).bold()
                    .foregroundColor(Color("Red"))
                
            }
            
            //MARK: Add new entry button
        }
        .padding(30)
        .frame(maxHeight: .infinity, alignment: .top)
        .sheet(isPresented: $entryModel.addNewEntry){
            entryModel.resetData()
        } content: {
            AddNewView()
                .environmentObject(entryModel)
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
