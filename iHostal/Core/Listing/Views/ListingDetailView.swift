//
//  ListingDetailView.swift
//  iHostal
//
//  Created by duverney muriel on 21/11/23.
//


import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    let listing: Listing
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing, cameraPosition: MapCameraPosition) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "Cali" ? .Cali : .Benetusser
                                            , span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView(.vertical){
            ZStack(alignment:.topLeading){
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                }label:{
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black).background(){Circle().fill(.white).frame(width: 32, height: 32)
                        }.padding(.vertical,52)
                        .padding(.leading,32)
                }
            }
            VStack(alignment: .leading, spacing: 8){
                Text("\(listing.city), \(listing.state)").font(.title2.bold())
                
                VStack(alignment: .leading){
                    HStack(spacing:2){
                        Image(systemName: "star.fill")
                        Text("\(listing.rating.toCurrency())")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.black)
                    Text("\(listing.city), \(listing.state)")
                }
                
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Divider()
            //            host info view
            HStack{
                VStack(alignment: .leading){
                    Text("Completo \(listing.type.description) hospedado por \(listing.ownername)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    //                    propertie info
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) invitados")
                        Text("\(listing.numberOfBedrooms) habitaciones")
                        Text("\(listing.numberOfBeds) camas")
                        Text("\(listing.numberOfBathrooms) servicios")
                    }.font(.caption)
                }
                .frame(width: 300,alignment: .leading)
                Spacer()
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }.padding()
            
            Divider()
            
            //            listin Features
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.features) {feature in
                    HStack(spacing: 12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
            
            //
            VStack(alignment: .leading, spacing: 16) {
                Text("Donde vivirás.")
                    .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 16){
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self){ bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132,height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .padding()
            .scrollTargetBehavior(.paging)
            
            Divider()
            
//   listing amenities
            VStack(alignment: .leading,spacing: 16) {
                Text("Incluye el sitio").font(.headline)
                ForEach(listing.amenities){ amenity in
                    HStack{
                        Image(systemName: amenity.imageName).frame(width: 32)
                        
                        Text(amenity.title).font(.footnote)
                        Spacer()
                    }
                }
            }.padding()
            
            Divider()
//
            VStack(alignment: .leading,spacing: 16) {
                Text("Tú estarás aquí").font(.headline)
                
                Map(position: $cameraPosition) {
                    
                }.frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("€\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total sin IVA").font(.footnote)
                        Text("Dic 15 - 23").font(.footnote).fontWeight(.semibold).underline()
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reservar")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView( listing: DeveloperPreview.shared.listings[0], cameraPosition: .region(.init(center: .Valencia, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))))
}
