//
//  CarResultViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 12/10/2023.
//

import Foundation

class CarResultViewModel: ObservableObject {
    @Published var listCarResult: [CarResultModel] = []
    
    func carResult(startDay: Date,
                   endDay: Date,
                   brandID: String,
                   color: String,
                   year: String,
                   categoryID: String,
                   minPrice: String,
                   maxPrice: String) {
        LoadingViewModel.share.onShowProgress(isShow: true)
        CarRentailServices.shared.searchCar(startDay: formatDateToString(startDay),
                                            endDay: formatDateToString(endDay),
                                            brandID: brandID,
                                            color: color,
                                            year: year,
                                            categoryID: categoryID,
                                            minPrice: minPrice,
                                            maxPrice: maxPrice) { response in
            if response.code == 1 {
                LoadingViewModel.share.onShowProgress(isShow: false)
                self.listCarResult = response.data ?? []
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
    
    func formatDateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
