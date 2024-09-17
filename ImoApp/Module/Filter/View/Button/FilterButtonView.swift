//
//  SwiftUIView.swift
//  ImoApp
//
//  Created by Boussair Samy on 16/09/2024.
//

import SwiftUI

struct FilterButtonView: View {
    var cell: FilterViewModel.Button
    let action: (SelectedFilterItem) -> Void
    @State private var test: Bool = false

    var body: some View {
        HStack {
            Text(cell.title)

            Spacer()

            Button {
                test.toggle()
            } label: {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black)
                        .foregroundStyle(test ? Color.random : .clear)
                    if test {
                        ImageLoaderView(dvImage: .systemName("checkmark"),
                                        contentMode: .fill)
                    }
                }
                .frame(width: 20, height: 20)
            }


//            Button("", systemImage: test ? "checkmark.square" : "square") {
//                test.toggle()
//            }
//            .tint(.random)
        }
    }
}
