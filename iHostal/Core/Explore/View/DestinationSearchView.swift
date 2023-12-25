//
//  DestinationSearchView.swift
//  iHostal
//
//  Created by duverney muriel on 28/11/23.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack{
                
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateLiostingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
            
                if !viewModel.searchLocation.isEmpty{
                    Button("Limpiar"){
                        viewModel.searchLocation = ""
                        viewModel.updateLiostingsForLocation()
                    }.foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                }
                
            }.padding()
            
            VStack(alignment: .leading){
                if selectedOption == .location {
                    Text("¿Dónde quieres ir?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Buscar destinos", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateLiostingsForLocation()
                                show.toggle()
                        }
                    } .frame(height: 44)
                        .padding(.horizontal)
                        .overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.0)
                                .foregroundStyle(Color(.systemGray4))
                        }
                }else{
                    CollapsedPickerView(title: "Donde", description: "agregar destino")
                }
                
            }.modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120: 64)
           
            .onTapGesture {
                withAnimation(.snappy){selectedOption = .location}
            }
            
            //            fechas view
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    Text("Cuando viajas?").font(.title2).fontWeight(.semibold)
                    VStack{
                        DatePicker("Desde", selection: $startDate,displayedComponents: .date)
                        Divider()
                        
                        DatePicker("Hasta", selection: $endDate,displayedComponents: .date)
                    }.foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }else{
                    CollapsedPickerView(title: "Cuando", description: "ver fechas")
                    
                }
            }.modifier(CollapsibleDestinationViewModifier())
                .frame(height: selectedOption == .dates ? 180: 64)
                .onTapGesture {
                    withAnimation(.snappy){selectedOption = .dates}
                }
            //            quienes view
            
            VStack(alignment:.leading){
                if selectedOption == .guests{
                    Text("Quiénes van?").font(.title2).fontWeight(.semibold)
                    
                    HStack{
                        Stepper {
                            Text("\(numGuests) Adults")
                        } onIncrement: {
                            numGuests += 1
                        } onDecrement: {
                            guard numGuests > 0 else {return}
                            numGuests -= 1
                        }
                    }
                }else{
                    CollapsedPickerView(title: "Quienes", description: "agregar invitados")
                    
                }
            }.modifier(CollapsibleDestinationViewModifier())
               .frame(height: selectedOption == .guests ? 120: 64)
                .onTapGesture {
                    withAnimation(.snappy){selectedOption = .guests}
                }
            Spacer()
        }
        
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .padding()
           .background(.white)
           .clipShape(RoundedRectangle(cornerRadius: 12))
           .padding()
           .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title).foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold).font(.subheadline)
        }
    }
}
