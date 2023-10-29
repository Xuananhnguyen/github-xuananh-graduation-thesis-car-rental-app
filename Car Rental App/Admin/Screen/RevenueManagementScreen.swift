//
//  RevenueManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct RevenueManagementScreen: View {
    @StateObject var viewModel = RevenueManagementViewModel()
    private var title: String = "Quản lý doanh thu"
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý doanh thu") {
            
        }
    }
}
