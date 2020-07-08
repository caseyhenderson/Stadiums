//
//  UserData.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import SwiftUI
import Combine
// Creates OO with two Published entries: showfavourites only (the toggle) and the stadiums.
final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var stadiums = stadiumData
    
}
