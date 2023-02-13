//
//  ListView.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                Button {
                    viewModel.handle(movie: movie)
                } label: {
                    MovieRow(movie: movie)
                }
            }
        }
        .refreshable {
            viewModel.reload()
        }
        .navigationTitle(L10n.List.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView(
            viewModel: .init(
                router: ListView.ListRouterImpl(diContainer: .preview),
                diContainer: .preview
            )
        )
    }
}
