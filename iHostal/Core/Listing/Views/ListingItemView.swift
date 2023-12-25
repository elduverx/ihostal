//
//  ListingItemView.swift
//  iHostal
//
//  Created by duverney muriel on 15/11/23.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8){
//            search View
            
            
            //            images
            TabView{
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            //            listing details
            HStack(alignment: .top){
                //            details
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    Text("7.4 km distancia")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("€\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("month")
                    }
                }
                
                Spacer()
                HStack(spacing: 4){
                    //            rating
                    Image(systemName: "star.fill")
                    Text("\(listing.rating.toCurrency())")
                }
            }
            .foregroundStyle(.black )
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
