//
//  Helper.swift
//  Stadiums
//
//  Created by Casey Henderson on 06/07/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import UIKit
// this helper contains our fucntions for the favourite functionality.
struct Helper {
    // as name suggests checks if the given item is a favourite item. Useful for the fav-specific list.
    static func isFavourite(name: String) -> Bool {
        return getFavourites().contains(where: {($0.name == name)})
    }
    // add and remove functionality: this is tied to the button in SD
    static func addRemoveFavourite(stadium: Stadium) {
        
        var favourites = getFavourites()
        if !isFavourite(name: stadium.name) {
            favourites.append(stadium)
        } else {
            favourites.removeAll(where: { $0.name == stadium.name})
        }
        
        let data = try! JSONEncoder().encode(favourites)
        UserDefaults.standard.set(data, forKey: "favourites")
        
    }
    // getFavourites:  returns the array of favourite stadiums. Also useful for the list.
    static func getFavourites() -> [Stadium] {
        if let data = UserDefaults.standard.data(forKey: "favourites")
        {
            let array = try! JSONDecoder().decode([Stadium].self, from: data)
            return array
        }
        return [Stadium]()
    }

    
}
