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
                    .font(.system(.title3))
                Text(L10n.List.rank(movie.rank))
            }
            .foregroundColor(Asset.Colors.info)
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
            .cornerRadius(12)
            .frame(width: 75, height: 75)
        }
        .padding([.vertical, .leading], 12)
        .padding(.trailing, 8)
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
