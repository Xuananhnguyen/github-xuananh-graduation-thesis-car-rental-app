//
//  CarRentalViewModel.swift
//  Car Rental App
//
//  Created by Chiến Lê on 01/08/2023.
//

import Foundation

class CarRentalViewModel: ObservableObject {
    @Published var carRentalData: [CarRentalResponse] = []
    
    func getListCarRental() {
        carRentalData = CarRentalDataMock.carRentalMock
    }
}

struct CarRentalDataMock {
    static var carRentalMock: [CarRentalResponse] = [CarRentalResponse(imageCar: IMG_CAR,
                                                                       status: "Chờ đặt cọc",
                                                                       titleCar: "MITSUBISHI XPANDER 2021",
                                                                       price: "990.000đ",
                                                                       dateFrom: "17/06/2023",
                                                                       dateTo: "16/07/2023",
                                                                       statusType: "pending"),
                                                     CarRentalResponse(imageCar: IMG_CAR,
                                                                       status: "Đã hủy",
                                                                       titleCar: "MITSUBISHI XPANDER 2021",
                                                                       price: "990.000đ",
                                                                       dateFrom: "17/06/2023",
                                                                       dateTo: "16/07/2023",
                                                                       statusType: "cancel"),
                                                     CarRentalResponse(imageCar: IMG_CAR,
                                                                       status: "Kết thúc",
                                                                       titleCar: "MITSUBISHI XPANDER 2021",
                                                                       price: "990.000đ",
                                                                       dateFrom: "17/06/2023",
                                                                       dateTo: "16/07/2023",
                                                                       statusType: "done"),
                                                     CarRentalResponse(imageCar: IMG_CAR,
                                                                       status: "Chờ đặt cọc",
                                                                       titleCar: "MITSUBISHI XPANDER 2021",
                                                                       price: "990.000đ",
                                                                       dateFrom: "17/06/2023",
                                                                       dateTo: "16/07/2023",
                                                                       statusType: "pending")]
}
