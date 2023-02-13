//
//  DetailsView.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(viewModel.movie.title)
                .font(.system(.title))
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(L10n.Details.titleCount(viewModel.titleCount))
                    Text(L10n.Details.imDbRating(viewModel.movie.imDbRating))
                    Text(L10n.Details.rank(viewModel.movie.rank))
                }
                Spacer()
                AsyncImage(url: viewModel.movie.imageURL) { phase in
                    if let image = phase.image {
                        image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Asset.Images.placeholder.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        ProgressView()
                    }
                }
                .cornerRadius(12)
                .frame(width: 100, height: 100)
            }
            Spacer()
        }
        .foregroundColor(Asset.Colors.info)
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsView(
            viewModel: .init(
                movie: .placeholder,
                router: DetailsView.DetailsRouterImpl(diContainer: .preview),
                diContainer: .preview
            )
        )
    }
}
