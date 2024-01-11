//
//  LocationListView.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/13.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject var viewModel: LocationListViewModel

    var body: some View {
        List {
            ForEach(viewModel.saveLocations) { element in
                Text(element.name)
            }
            .onDelete(perform: { indexSet in
                print("Delete")
                viewModel.removeSaveLocation(indexSet: indexSet)
            })
            .onTapGesture(perform: {
                print("Tap")
            })
        }
    }
}


struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(viewModel: LocationListViewModel(saveLocationRepository: SaveLocationRepositoryMock()))
    }
}
