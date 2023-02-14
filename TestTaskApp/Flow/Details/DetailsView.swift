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
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.movie.title)
                .font(.system(.title))
                .foregroundColor(Asset.Colors.accept)
            middleView
            Text(L10n.Details.crew(viewModel.movie.crew))
                .foregroundColor(Asset.Colors.info)
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .navigationTitle(L10n.Details.title)
    }
    
    var middleView: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text(L10n.Details.titleCount(viewModel.titleCount))
                Text(L10n.Details.imDbRating(viewModel.movie.imDbRating))
                Text(L10n.Details.rank(viewModel.movie.rank))
                Text(L10n.Details.year(viewModel.movie.year))
            }
            .foregroundColor(Asset.Colors.info)
            Spacer()
            RemoteImage(url: viewModel.movie.imageURL)
                .cornerRadius(12)
                .frame(width: 100, height: 100)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            DetailsView(
                viewModel: .init(
                    movie: .placeholder,
                    router: DetailsView.DetailsRouterImpl(diContainer: .preview),
                    diContainer: .preview
                )
            )
            .preferredColorScheme(.light)
            .previewDisplayName("Light")
            DetailsView(
                viewModel: .init(
                    movie: .placeholder,
                    router: DetailsView.DetailsRouterImpl(diContainer: .preview),
                    diContainer: .preview
                )
            )
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")
        }
        .environmentObject(ImageCacheManager())
    }
}
