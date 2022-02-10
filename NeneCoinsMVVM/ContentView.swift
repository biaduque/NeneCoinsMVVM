//
//  ContentView.swift
//  NeneCoinsMVVM
//
//  Created by Beatriz Duque on 10/02/22.
//


import SwiftUI

struct ContentView: View {
    let coinsBase = CoinRepository.shared.fetchInitialData()
    
    var body: some View {
        NavigationView {
            ConversionView(conversionViewModel: ConversionViewModel(fromCoin: coinsBase.0,toCoin: coinsBase.1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
