//
//  ListingImageCarouselView.swift
//  iHostal
//
//  Created by duverney muriel on 21/11/23.
//

import SwiftUI

struct ListingImageCarouselView: View {

    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id: \.self){ image in
                Image(image).resizable().scaledToFill()
            }
        }
       
        .tabViewStyle(.page)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
