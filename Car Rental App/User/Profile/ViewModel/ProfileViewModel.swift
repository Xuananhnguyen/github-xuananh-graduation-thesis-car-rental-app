//
//  ProfileViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 21/11/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var userLicense: UserLicenseModel?
    @Published var userProfileModel: UserProfileModel?
    
    func userProfile() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.userProfile() { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.userProfileModel = response.data
            } else {
                LoadingViewModel.share.onShowProgress(isShow: false)
                let confirmDialog = ConfirmDialog(content: response.message?.removingPercentEncoding ?? "")
                Popup.presentPopup(alertView: confirmDialog)
            }
        } failBlock: { error in
            LoadingViewModel.share.onShowProgress(isShow: false)
            let confirmDialog = ConfirmDialog(content: error.localizedDescription)
            Popup.presentPopup(alertView: confirmDialog)
        }
    }
    
    func geUserLicense() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        ProfileServices.shared.userLicense() { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.userLicense = response.data
            } else {
                LoadingViewModel.share.onShowProgress(isShow: false)
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
