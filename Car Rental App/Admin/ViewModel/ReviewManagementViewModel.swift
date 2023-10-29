//
//  ReviewManagementViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class ReviewManagementViewModel: ObservableObject {
    @Published var listReview: [ReviewModel] = []
    
    func getAllReview() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.getAllReview { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.listReview = response.data ?? []
            } else {
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }

    }
}
