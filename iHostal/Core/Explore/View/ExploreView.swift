//
//  ExploreView.swift
//  iHostal
//
//  Created by duverney muriel on 7/11/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
//    TODO: organizar la view Model de explore view
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    
    var body: some View {
        NavigationStack{
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)            }else{
                ScrollView{
                    //                Search View
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    LazyVStack(spacing:32){
                        ForEach(viewModel.listings){listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                            }
                        }
                    }
                }.navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing, cameraPosition: .region(.init(center: .Valencia, span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))))
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
