//
//  SelectionView.swift
//  NeneCoinsMVVM
//
//  Created by Beatriz Duque on 10/02/22.
//

import SwiftUI

struct SelectionView: View {
    
    
    ///  No swiftUI nao temos um acesso direto a navigationController, entao precisamos chamar o dismiss atraves do environment que da pop na navegacao mais recebte
    @Environment (\.dismiss) private var dismiss
    
    /// variavel que ira conversar com as duas telas, para selecionar a var coin
    @Binding var selectedCoin: Coin
    
    /// observedObject -> aquele que é usado para a populacao da table
    @ObservedObject var selectionViewModel: SelectionViewModel
    
    var title: String
    
    var body: some View {
        List{
            ForEach (selectionViewModel.coins, id: \.name){ coin in
                Button {
                    /// dismiss para voltar na tela inicial ao clicar
                    selectedCoin = coin
                    dismiss()
                } label:{
                    HStack{
                        Text(coin.name)
                            .foregroundColor(Color.primary)
                        Spacer()
                    }
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationBarTitle(title)
        ///quando a view for aparecer, o conteudo é coletado
        .onAppear{self.selectionViewModel.fetchAllCoins()}
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(selectedCoin: .constant(Coin(name: "Real", abbreviation: "BRL", conversionFactor: 1)), selectionViewModel: SelectionViewModel(), title: "To")
    }
}
