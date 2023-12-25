//
//  ExploreService.swift
//  iHostal
//
//  Created by duverney muriel on 9/12/23.
//

import Foundation

class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
