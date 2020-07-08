//
//  StadiumDetail.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
// The View that is displayed when a user selects a stadium. Map of the surrounding area at the top, circular image in the middle, credit as caption and stadium info towards the bottom. Wikipedia and favourite/visited button there too.

import SwiftUI
import MapKit
struct StadiumDetail: View {
    // using stadium index to access/update so we always get correct version
    @EnvironmentObject var userData: UserData
    
    @State var stadium: Stadium
    // state for when stadium changes: this helps us pass favourites across and ensure they are persistent
    var stadiumIndex: Int {
        userData.stadiums.firstIndex(where: { $0.id == stadium.id })!
    }
    // Hey App Review Team, hope you're having a good day!
    
    var body: some View {
        //contained in a vstack for layout purposes
        VStack {
            // mapview displaying local area.
            MapView(coordinate: stadium.locationCoordinate)
                .edgesIgnoringSafeArea(.all)
                 // again change to .top if necessary still deciding
                 // also could set fixed height???????
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            // image of stadium, cropped to be a nice circle.
            CircleImage(image: stadium.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            //credit for image
            Text(stadium.credit)
                .font(.caption)
            // another VStack, containing stadium name, club name, county, and fav/visited button.
            VStack(alignment: .leading) {
                HStack {
                    // stadium name as title
                    Text(stadium.name)
                        .font(.title)
                    // button to add favourite
        
                    Button(action: {
                        Helper.addRemoveFavourite(stadium: self.stadium)
                        self.userData.stadiums[self.stadiumIndex].favourite.toggle()
                    }) {
                        Image(systemName: Helper.isFavourite(name: stadium.name) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                    }
 
                }
                // Smaller HStack containing club name and county name, which are aligned and subheadlines.
                HStack (alignment: .top) {
                    Text(stadium.club)
                            .font(.subheadline)
                    Spacer()
                    Text(stadium.county)
                            .font(.subheadline)
                }
            }
            .padding()

            
            // separate HStack containing the wikipedia button.
        HStack (alignment: .center) {
            // Handles button and URL link.
            Button("View on Wikipedia", action: { guard let link = URL(string: self.stadium.wikiLink), UIApplication.shared.canOpenURL(link) else {
                    return
                }
                // opens relevant wiki entry for stadium.
                UIApplication.shared.open(link, options: [:],
                                          completionHandler: nil)
                
            })
        }

        }
    }
}



//struct StadiumDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        let userData = UserData()
//        return StadiumDetail(stadium: userData.stadiums[0], favs: favs[]).environmentObject(userData)
//    }
//}

// array of favs
// then set defaults
