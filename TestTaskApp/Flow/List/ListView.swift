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
            switch viewModel.state {
            case .error:
                infoView(text: L10n.List.Movies.error + " 🤷")
            case .loading:
                infoView(text: L10n.List.Movies.loading + " ⌛")
            case .movies(let movies):
                if movies.isEmpty {
                    infoView(text: L10n.List.Movies.empty + " 😞")
                } else {
                    moviesView(items: movies)
                }
            }
        }
        .searchable(text: $viewModel.searchText, prompt: L10n.List.Search.placeholder)
        .refreshable {
            viewModel.reload()
        }
        .onAppear {
            viewModel.handleAppear()
        }
        .navigationTitle(L10n.List.title)
    }
    
    func infoView(text: String) -> some View {
        HStack {
            Spacer()
            Text(text)
                .foregroundColor(Asset.Colors.info)
            Spacer()
        }
        .frame(height: 100)
    }
    
    func moviesView(items: [Movie]) -> some View {
        ForEach(items, id: \.id) { movie in
            Button {
                viewModel.handle(movie: movie)
            } label: {
                MovieRow(movie: movie)
            }
        }
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
