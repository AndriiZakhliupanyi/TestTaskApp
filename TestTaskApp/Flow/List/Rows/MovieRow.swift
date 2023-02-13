//
//  MovieRow.swift
//  TestTaskApp
//
//  Created by Andrii Zakhliupanyi on 13.02.2023.
//

import SwiftUI

struct MovieRow: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .foregroundColor(Asset.Colors.info)
                Text(L10n.List.rank(movie.rank))
                    .foregroundColor(Asset.Colors.info)
            }
            Spacer()
            AsyncImage(url: movie.imageURL) { phase in
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
            .frame(width: 75, height: 75)
        }
        .padding(12)
    }
}

struct MovieRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            MovieRow(movie: .placeholder)
                .preferredColorScheme(.light)
            MovieRow(movie: .placeholder)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
