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
        Text("List")
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
