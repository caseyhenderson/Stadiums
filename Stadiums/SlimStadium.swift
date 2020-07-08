//
//  SlimStadium.swift
//  Stadiums
//
//  Created by Casey Henderson on 06/07/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//
// FIX LAYOUT
// FIXED LAYOUT (KINDA)
// will probably make this more fancy in future: at least it's not as much of a memory hog as it was though.
// slimmed down version of StadiumDetail for inclusion in StadiumList. Less memory used, better structure, slightly uglier design.
import SwiftUI

struct SlimStadium: View {
    // object to reflect changes and access the needed data.
    @EnvironmentObject var userData: UserData
    
    @State var stadium: Stadium
    
    var stadiumIndex: Int {
        userData.stadiums.firstIndex(where: { $0.id == stadium.id })!
    }
    var body: some View {
        // layout: First the link to StadiumDetail (where the user can perform the 'favourite' action, check map, etc). Then the image, and then the name.
        Group {
            VStack(alignment: .leading){
                NavigationLink(destination: StadiumDetail(stadium: stadium)) {
                    stadium.image
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                Text("\(stadium.name)")
                .font(.subheadline)
                // can add icon back if we want here, to show whether favourite or not.
            }
      // more layout stuff.
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
        .navigationBarTitle("Stadiums of England")
            
        }

    }
}
