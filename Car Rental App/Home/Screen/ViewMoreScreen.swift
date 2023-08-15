//
//  ViewMoreScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI
import VNavigator

struct ViewMoreScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    @State var search: String = ""
    let columns = [GridItem(.flexible()),
                    GridItem(.flexible())]
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: "titleSearchCar".localized,
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 16) {
                        ForEach(0...5, id: \.self) { _ in
                            CarPreviewView {
                                navigator.pushToView(view: CarDetailScreen())
                            }
                        }
                    }
                    .padding(16)
                }
                .background(Color(GRAY_EEEEEE))
                .ignoresSafeArea(.all)
            })
    }
}

extension ViewMoreScreen {
    private var EmptyView: some View {
        VStack {
            Text("noResult".localized)
        }
    }
}
