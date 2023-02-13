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
        Text("Details")
    }
}

struct DetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsView(
            viewModel: .init(
                router: DetailsView.DetailsRouterImpl(diContainer: .preview),
                diContainer: .preview
            )
        )
    }
}
