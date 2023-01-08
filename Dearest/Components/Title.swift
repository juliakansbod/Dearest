//
//  Title.swift
//  Dearest
//
//  Created by Julia Kansbod on 2023-01-06.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Dearest.")
            .font(Font.custom("GrandHotel-Regular", size: 40))
            .foregroundColor(Color("Red"))
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
