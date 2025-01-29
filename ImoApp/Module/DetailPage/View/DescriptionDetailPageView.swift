//
//  DescriptionDetailPageView.swift
//  ImoApp
//
//  Created by Boussair Samy on 07/08/2024.
//

import SwiftUI

struct DescriptionDetailPageView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Title House")
                    .font(.title)
                    .bold()

                Spacer()

                Text("200 000 €")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }

            Text("House address")
                .foregroundStyle(.gray)
                .fontWeight(.light)
                .padding(.bottom)



            ListItemDetailHouseView(viewModelItem: ItemDetailHouse.itemViewModelTest)
                .padding(.bottom)

            Text("Charmante petite maison située dans un quartier calme. La maison de 120m2 environ comporte un séjour de 35m2 environ, une cuisine, une salle de douche, un espace nuit ainsi que deux chambres de 11 m2 environ. Le plus, un sous sol complet et un agréable jardin! Mérite votre attention! Honoraires d'agence à la charge du vendeur.Information d'affichage énergétique sur ce bien DPE F indice 356 et GES G indice 83. ")
                .foregroundStyle(.gray)
                .fontWeight(.light)
        }
        .padding(.horizontal)
    }
}

#Preview {
    DescriptionDetailPageView()
}
