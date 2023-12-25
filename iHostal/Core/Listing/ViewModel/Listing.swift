//
//  Listing.swift
//  iHostal
//
//  Created by duverney muriel on 6/12/23.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable{
    let id: String
    let ownerUid: String
    let ownername: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let imageURLs: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
    
}

enum ListingFeatures:Int, Identifiable, Codable, Hashable{
    case selfCheckIn
    case superHost
    
    var imageName: String{
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String{
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String{
        switch self {
        case .selfCheckIn: return "Abre la puerta con tu codigo"
        case .superHost: return "Superhost somos experimentados, altamente recomendados por quienes vienen a visitarnos, ofrecemos lo mejor para los huespedes"
        }
    }
    
    var id: Int { return self.rawValue}
}

enum ListingAmenities:Int, Identifiable, Codable, Hashable{
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String{
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "Tv"
        case .alarmSystem: return "AlarmSystem"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String{
        switch self{
        case .pool: return "figure.pool.swm"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.fill"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
  
    
    
    var id: Int { return self.rawValue}
    
}

enum ListingType: Int,Codable,Identifiable,Hashable{
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String{
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villaa"
        }
    }
    
    var id: Int { return self.rawValue}
}
