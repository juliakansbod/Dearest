//
//  SettingsView.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-08.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.self) var env
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            
            HStack{
                Spacer()
                
                Image(systemName: "xmark")
                    .foregroundColor(Color("Red"))
                    .fontWeight(.bold)
                    .onTapGesture {
                        env.dismiss()
                    }
            }
            
            Text("Not yet created.")
            
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(30)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
