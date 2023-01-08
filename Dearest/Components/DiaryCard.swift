//
//  DiaryCard.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct DiaryCard: View {
    
    var title: String
    var entryBody: String
    var date: Date
    
    var body: some View {
        
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20).fill(Color("Pink")).frame(width: 100.0, height: 100.0)
                Text(date.formatted(.dateTime.month().day()))
                    .foregroundColor(Color("Red"))
                    .font(Font.custom("GrandHotel-Regular", size: 35))
            }
            
            VStack(alignment: .leading){
                
                Text(date.formatted(.dateTime.weekday().hour().minute()))
                    .foregroundColor(Color("Pink"))
                    .font(.caption).bold()
                
                //MARK: Diary title
                Group {
                    if title.count < 20{
                        Text(title)
                    } else {
                        Text(title.prefix(20) + "...")
                    }
                }
                .foregroundColor(Color("Red"))
                .font(.title3)
                .fontWeight(.bold)
                
                //MARK: Diary body
                Group {
                    if entryBody.count < 60 {
                        Text(entryBody)
                    } else {
                        Text(entryBody.prefix(60) + "...")
                            .multilineTextAlignment(.leading)
                    }
                }
                .font(.system(size: 16))
                .foregroundColor(.gray)
            }
        }
    }
    
}

struct DiaryCard_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCard(title: "Today was a good day", entryBody: "I started the day with drinking coffee and listening to my spotify playlist. I started slowly and quickly realized how much better I feel when I take my time in the morning. I started the day with drinking coffee and listening to my spotify playlist. I started slowly and quickly realized how much better I feel when I take my time in the morning.", date: Date())
    }
}
