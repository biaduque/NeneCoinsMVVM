//
//  CoinCell.swift
//  NeneCoinsMVVM
//
//  Created by Beatriz Duque on 10/02/22.
//

import SwiftUI

struct CoinCell: View {
    var content: String
    
    var body: some View {
        VStack{
            HStack{
                Text(self.content)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
    }
}

struct CoinCell_Previews: PreviewProvider {
    static var previews: some View {
        CoinCell(content: "Oi")
    }
}
