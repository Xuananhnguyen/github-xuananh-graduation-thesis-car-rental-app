//
//  AccountManagementViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class AccountManagementViewModel: ObservableObject {
    @Published var listUser: [UserModel] = []
    
    func getAllUser() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.getAllUser { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.listUser = response.data ?? []
            } else {
                let confirmDialog = ConfirmDialog(content: response.message ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func verifiedUser(status: String,
                      userID: Int,
                      completions: (() -> Void)? = nil) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.verifiedUser(status: status, userID: userID) { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                let confirmDialog = ConfirmDialog(content: response.message ?? "",
                                                  confirmAction: completions)
                Popup.presentPopup(alertView: confirmDialog)
            } else {
                let confirmDialog = ConfirmDialog(content: response.message ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
}
