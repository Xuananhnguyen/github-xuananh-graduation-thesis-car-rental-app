//
//  LoadingViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 05/03/2023.
//

import Foundation

class LoadingViewModel: ObservableObject {
    static let share = LoadingViewModel()
    private init() {}
    @Published var isProgressShow = false
    @Published var refreshing = false
    
    func onShowProgress(isShow: Bool) {
        if refreshing {
            self.refreshing = isShow
        }
        isProgressShow = isShow
        
        if isProgressShow {
            if Thread.isMainThread {
                LoadingView.shared.showLoading()
            } else {
                DispatchQueue.main.async {
                    LoadingView.shared.showLoading()
                }
            }
        } else {
            LoadingView.shared.hideLoading()
        }
    }
}
