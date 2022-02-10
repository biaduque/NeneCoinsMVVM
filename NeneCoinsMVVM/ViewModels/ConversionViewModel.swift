//
//  ConversionViewModel.swift
//  NeneCoinsMVVM
//
//  Created by Beatriz Duque on 10/02/22.
//

import Foundation
class ConversionViewModel: ObservableObject {
    /// @ Published permite que as variaveis sejam alteradas
    @Published var fromCoin: Coin
    @Published var toCoin: Coin
    @Published var inputedValue: String
    @Published var result: String
    
    init(fromCoin: Coin, toCoin: Coin){
        self.fromCoin = fromCoin
        self.toCoin = toCoin
        self.inputedValue = ""
        self.result = "0.0"
    }
    
    public func calculate(){
        let stringValue = inputedValue.replacingOccurrences(of: ",", with: ".")
        /// le fromCoin
        guard let value = Double(stringValue) else {
            if stringValue == ""{
                self.result = "0.0"
                return
            }
            self.result = "Valor inválido"
            return
        }
        let from = self.fromCoin.conversionFactor
        let to = self.toCoin.conversionFactor
        self.result = String((from/to)*value)
        
    }
    public func invert(){
        let previous = self.fromCoin
        self.fromCoin = self.toCoin
        self.toCoin = previous
    }
}
