//
//  StadiumRow.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import SwiftUI
// StadiumRow: a nice, handy view for the row of stads.
struct StadiumRow: View {
    var stadium: Stadium
    var body: some View {
        HStack {
            stadium.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(stadium.name)
            Spacer()
            if stadium.favourite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.blue)
            
            }
            
        }
    }
}

struct StadiumRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StadiumRow(stadium: stadiumData[0])
            StadiumRow(stadium: stadiumData[1])

        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
