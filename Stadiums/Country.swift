//
//  Country.swift
//  Stadiums
//
//  Created by Casey Henderson on 22/06/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
// The work's done by CountryMap: this is the swift file containing the actual view displaying the national map.

import SwiftUI

struct Country: View {
    //bring in all the objects we need: the map's been pre-populated in CountryMap.
    @EnvironmentObject var userData: UserData
    var stadium: Stadium
    var stadiumIndex: Int {
        userData.stadiums.firstIndex(where: { $0.id == stadium.id })!
    }
    // view that brings in CountryMap
    var body: some View {
        CountryMap(coordinate: stadium.locationCoordinate, stadium: stadiumData[0])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            // change if needed to .top
    }
    // needed to separate Country and CountryMap, otherwise map would not pre-populate with the pins showing the stadiums.
}

struct Country_Previews: PreviewProvider {
    static var previews: some View {
        Country(stadium: stadiumData[0])
    }
}
