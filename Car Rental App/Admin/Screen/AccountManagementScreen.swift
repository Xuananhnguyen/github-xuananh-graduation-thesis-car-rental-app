//
//  AccountManagementScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 24/10/2023.
//

import SwiftUI

struct AccountManagementScreen: AppNavigator {
    @StateObject var viewModel = AccountManagementViewModel()
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           title: "Quản lý tài khoản",
                           builderContent: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10){
                    ForEach(viewModel.listUser, id: \.self) { item in
                        VStack(alignment: .leading, spacing: 8){
                            Text("Tên: \(item.name ?? "")")
                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                            
                            Text("Email: \(item.email ?? "")")
                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                            
                            Text("Số điện thoại: \(item.phoneNumber ?? "")")
                                .textStyle(.ROBOTO_REGULAR, size: 14)
                            
                            if let address = item.address {
                                Text("Địa chỉ: \(address.isEmpty ? "Chưa cập nhật" : address)")
                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                            }
                            
                            if let nameRole = UserRole(rawValue: item.role ?? 0) {
                                Text("Vai trò: \(nameRole.nameRole)")
                                    .foregroundColor(Color(GREEN_2B4C59))
                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                            }
                            
                            if let nameVerified = VerifiedType(rawValue: item.verified ?? 0) {
                                Text("Xác thực: \(nameVerified.nameVerified)")
                                    .foregroundColor(Color(nameVerified.colorVerified))
                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                            }
                            
                            if let idCard = item.idCard {
                                Text("CCCD: \(idCard.isEmpty ? "Chưa cập nhật" : idCard)")
                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                            }
                            
                            if let drivingLicense = item.drivingLicense {
                                Text("Bằng lái xe: \(drivingLicense.isEmpty ? "Chưa cập nhật" : drivingLicense)")
                                    .textStyle(.ROBOTO_MEDIUM, size: 14)
                            }
                            
                            Text("Trạng thái tài khoản: \(item.statusAccount ?? "")")
                                .foregroundColor(Color(BLACK_000000))
                                .textStyle(.ROBOTO_MEDIUM, size: 14)
                            
                            HStack(spacing: 10){
                                Button {
                                    viewModel.verifiedUser(status: "approved", userID: item.userId ?? 0) {
                                        viewModel.getAllUser()
                                    }
                                } label: {
                                    Text("Xác thực")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(WHITE_FFFFFF))
                                        .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                                        .background(Color(GREEN_2B4C59))
                                        .cornerRadius(5)
                                }
                                Button {
                                    viewModel.verifiedUser(status: "rejected", userID: item.userId ?? 0)
                                } label: {
                                    Text("Từ chối")
                                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                                        .foregroundColor(Color(WHITE_FFFFFF))
                                        .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                                        .background(Color(RED_C64949))
                                        .cornerRadius(5)
                                }
                            }
                            .disabled(item.verified == 1)
                        }
                        .foregroundColor(Color(BLACK_000000))
                        .padding(EdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(WHITE_FFFFFF))
                        .cornerRadius(10)
                        .shadow(radius: 8, y: 8)
                        .padding(.horizontal, 16)
                    }
                }
            }
        })
        .onAppear {
            viewModel.getAllUser()
        }
    }
}
