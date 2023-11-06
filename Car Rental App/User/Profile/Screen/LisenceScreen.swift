//
//  LisenceScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 22/10/2023.
//

import SwiftUI

struct LisenceScreen: View {
    @StateObject var viewModel = LisenceViewModel()
    @State var idCard: String = ""
    @State var drivingLicense: String = ""
    
    var body: some View {
        BaseNavigationView(title: "Giấy tờ cá nhân",
                           builderContent: {
            VStack(spacing: 20) {
                    TextFieldView(title: "\("Căn cước công dân".localized):",
                                  inputContent: $idCard)

                    TextFieldView(title: "\("Bằng lái xe".localized):",
                                  inputContent: $drivingLicense)
                    Spacer()
                
                if AppDataManager.shared.authenticate?.verified == 0 {
                    Button(action: {
                        viewModel.updateLicense(idCard: idCard, drivingLicense: drivingLicense)
                    }, label: {
                        Text("Lưu thay đổi")
                            .textStyle(.ROBOTO_BOLD, size: 20)
                            .foregroundColor(Color(WHITE_FFFFFF))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color(GREEN_2B4C59))
                            .cornerRadius(10)
                    })
                }
            }
            .padding(.horizontal, 16)
            .onChange(of: idCard) { newValue in
                idCard = newValue
            }
            .onChange(of: drivingLicense) { newValue in
                drivingLicense = newValue
            }
            .onTapGesture {
                self.dimissKeyBoard()
            }
        })
    }
}
