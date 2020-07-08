//
//  CircleImage.swift
//  Stadiums
//
//  Created by Casey Henderson on 02/04/2020.
//  Copyright © 2020 Casey Henderson. All rights reserved.
//

import SwiftUI
// makes the image into a circle. Looks nice.
struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }            
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("keepmoat"))
    }
}
