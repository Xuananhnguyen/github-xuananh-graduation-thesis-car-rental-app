//
//  Enum+Client.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 03/10/2023.
//

import Foundation

enum BaseError: Error {
    case internalServer(statusCode: Int, errorMess: String)
    case requestTimeout
    case networkError
    case parseObjectError(object: CarRentalBaseResponse)
    case unknowError(errorMess: String)
    case orther(statusCode: String, errorMess: String)
    
    var message: String {
        switch self {
        case .internalServer(_, let errorMess):
            return errorMess
        case .requestTimeout:
            return "Hết thời gian yêu cầu"
        case .networkError:
            return "Lỗi kết nối internet"
        case .parseObjectError(object: _):
            return "object Error"
        case .unknowError( let errorMessage):
            return errorMessage
        case .orther(_, let errorMess):
            return errorMess
        }
    }
}
