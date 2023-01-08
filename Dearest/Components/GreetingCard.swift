//
//  GreetingCard.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct GreetingCard: View {
    
    @State var date = Date() //Date used for dynamic greeting function
    
    var body: some View {
        VStack(spacing: 10){
            Text(greeting())
                .font(.title2).bold()
                .foregroundColor(Color("Red"))
            
            Text(question())
                .font(.body).bold()
                .foregroundColor(.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(30)
        .background(Color("Pink"))
        .cornerRadius(20)
    }
    
    //MARK: Dynamic greeting
    func greeting() -> String {
        var greet = ""
        
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 0, of: date)!
        let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: date)!
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
        let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 0, of: date)!
        let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: date)!
        let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 0, of: date)!
        let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: date)!
        let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 0, of: date)!
        let midnight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= midNight0) && (nightEnd >= date)) {
            greet = "Good Night!"
        } else if ((date >= morningStart) && (morningEnd >= date)) {
            greet = "Good Morning!"
        } else if ((date >= noonStart) && (noonEnd >= date)) {
            greet = "Good Afternoon!"
        } else if ((date >= eveStart) && (eveEnd >= date)) {
            greet = "Good Evening!"
        } else if ((date >= nightStart) && (midnight24 >= date)) {
            greet = "Good Night!"
        }
        
        return greet
    }
    
    func question() -> String {
        
        var question = ""
        
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 0, of: date)!
        let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: date)!
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
        let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 0, of: date)!
        let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: date)!
        let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 0, of: date)!
        let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: date)!
        let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 0, of: date)!
        let midnight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= midNight0) && (nightEnd >= date)) {
            question = "What is on your mind tonight?"
        } else if ((date >= morningStart) && (morningEnd >= date)) {
            question = "What is on your mind this morning?"
        } else if ((date >= noonStart) && (noonEnd >= date)) {
            question = "What is on your mind this afternoon?"
        } else if ((date >= eveStart) && (eveEnd >= date)) {
            question = "What is on your mind this evening?"
        } else if ((date >= nightStart) && (midnight24 >= date)) {
            question = "What is on your mind tonight?"
        }
        
        return question
        
    }
    
}

struct GreetingCard_Previews: PreviewProvider {
    static var previews: some View {
        GreetingCard()
    }
}
