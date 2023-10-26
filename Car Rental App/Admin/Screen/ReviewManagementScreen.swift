//
//  ReviewManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct ReviewManagementScreen: View {
    @StateObject var viewModel = ReviewManagementViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý đánh giá") {
        }
    }
}
