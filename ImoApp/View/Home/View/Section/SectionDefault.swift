//
//  SectionDefault.swift
//  ImoApp
//
//  Created by Boussair Samy on 10/08/2024.
//

import SwiftUI

struct SectionDefault: View {
    var section: HomeViewModel.SectionViewModel

    var body: some View {
        Section {
            LazyVStack {
                ForEach(0..<100) { i in
                    CardView()
                }
            }
        } header: {
            VStack(alignment: .leading) {
                CarouselHeaderView(title: section.titleSection.rawValue)
            }
            .padding()
        }
    }
}

#Preview {
    SectionDefault(section: HomeViewModel.SectionViewModel(titleSection: .lyon,
                                                           itemHouse: Array(repeating: .viewModelTest,
                                                                            count: 10)))
}
