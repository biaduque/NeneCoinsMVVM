//
//  ConversionView.swift
//  NeneCoinsMVVM
//
//  Created by Beatriz Duque on 10/02/22.
//

import SwiftUI
struct ConversionView: View {
    @ObservedObject var conversionViewModel: ConversionViewModel
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Spacer()
                Button(action: {
                    conversionViewModel.invert()
                    conversionViewModel.calculate()
                },label: {
                    Label("Invert", systemImage: "repeat")
                })
            }
            .padding(.trailing, 16)
            
            VStack{
                ///ligando uma celula com outra view
                /// É necessário colocar o $ ja que é uma Binding
                NavigationLink(destination:
                                {SelectionView(selectedCoin: $conversionViewModel.fromCoin,
                                               selectionViewModel: SelectionViewModel(),
                                               title: "From")},
                               label:
                                {CoinCell(content: "From: \(conversionViewModel.fromCoin.name)")}
                )
                NavigationLink(destination:
                                {SelectionView(selectedCoin: $conversionViewModel.toCoin,
                                               selectionViewModel: SelectionViewModel(),
                                               title: "To")},
                               label:
                                {CoinCell(content: "To: \(conversionViewModel.toCoin.name)")}
                )
                
                TextField(conversionViewModel.fromCoin.abbreviation,text: $conversionViewModel.inputedValue)
                
                    /// quando mudar, irá performar a ação chamada
                    .onChange(of: conversionViewModel.inputedValue, perform: { newValue in
                        conversionViewModel.calculate()
                    })
                    .cornerRadius(6)
                    .keyboardType(.decimalPad)
                    .padding()
            }
            .padding()
            .background(Color(uiColor: .secondarySystemBackground))
            .cornerRadius(10)
            .padding(.horizontal,16)
            .padding(.bottom,16)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(uiColor: .secondarySystemBackground))
                    .frame(width: 300, height: 300)
                VStack{
                    Text("Your result is:")
                    Text("\(conversionViewModel.toCoin.abbreviation) \(conversionViewModel.result)")
                }
            }
            Spacer()
        }
        .onAppear(perform: {
            /// utilizado para calcular quando "volta"
            conversionViewModel.calculate()
        })
        .navigationTitle("Neneccoins")
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        let coinsBase = CoinRepository.shared.fetchInitialData()
        ConversionView(conversionViewModel: ConversionViewModel(fromCoin: coinsBase.0,
                                                                toCoin: coinsBase.1))
    }
}

