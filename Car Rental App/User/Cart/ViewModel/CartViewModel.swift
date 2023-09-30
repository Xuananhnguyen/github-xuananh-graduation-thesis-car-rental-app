//
//  CartViewModel.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 11/12/2022.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartList: [CartModel] = listCart
    }
