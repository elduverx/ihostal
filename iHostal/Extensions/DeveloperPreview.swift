//
//  DeveloperPreview.swift
//  iHostal
//
//  Created by duverney muriel on 6/12/23.
//

import Foundation

class DeveloperPreview{
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownername: "duver", ownerImageUrl: "setfolder-4", numberOfBedrooms: 4, numberOfBathrooms: 2, numberOfGuests: 5, numberOfBeds: 4, pricePerNight: 950, latitude: 39.4247, longitude: -0.397403, imageURLs: ["listing-1","listing-2","listing-3", "listing-4"], address: "Calle Nuestra señora del Socorro", city: "Alfafar", state: "Valencia", title: "Chalet Benetusser", rating: 4.97, features: [.selfCheckIn,.superHost], amenities: [.balcony,.kitchen, .laundry, .office], type: .villa),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownername: "Elduverx", ownerImageUrl: "setfolder-2", numberOfBedrooms: 4, numberOfBathrooms: 2, numberOfGuests: 5, numberOfBeds: 4, pricePerNight: 740, latitude: 3.43722, longitude: -76.5225, imageURLs: ["listing-5","listing-6","listing-8","listing-9"], address: "Martin Sorolla", city: "Cali", state: "Colombia", title: "Apartamento ", rating: 4.5, features: [.selfCheckIn,.superHost], amenities: [.balcony,.kitchen, .laundry, .office], type: .apartment),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownername: "Elduverx", ownerImageUrl: "setfolder-3", numberOfBedrooms: 4, numberOfBathrooms: 2, numberOfGuests: 5, numberOfBeds: 4, pricePerNight: 860, latitude: 39.4347, longitude: -0.397413, imageURLs: ["listing-12","listing-11","listing-10"], address: "Calle Doctor Gomez Ferrer", city: "Masanassa", state: "Valencia", title: "Casa Pueblo", rating: 4.3, features: [.selfCheckIn,.superHost], amenities: [.balcony,.kitchen, .laundry, .office], type: .house),
        
    ]
}
