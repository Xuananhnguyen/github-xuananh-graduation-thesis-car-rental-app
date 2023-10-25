//
//  VehiclesManagementViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import Foundation

class VehiclesManagementViewModel: ObservableObject {
    @Published var listCar: [CarModel] = []
    
    func getAllCar() {
        LoadingViewModel.share.onShowProgress(isShow: true)
        AdminServices.shared.getAllCar { response in
            LoadingViewModel.share.onShowProgress(isShow: false)
            if response.code == 1 {
                self.listCar = response.data ?? []
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
