 //
//  CarDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI

struct CarDetailScreen: AppNavigator {
    var imageCar: String = CAR_IMG
    var nameCar: String = "MITSUBISHI XPANDER 2021"
    var address: String = "Hà Đông, Hà Nội"
    var price: String = "950,000"
    @State var startDate: Date?
    @State var endDate: Date?
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: nameCar,
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                VStack(alignment: .leading, spacing: 0){
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .leading, spacing: 17){
                            carTitleView
                            timeRentalView
                            deliveryLocationPayCar
                            limitNumberKm
                            collateralView
                            vehicleDeliveryDocuments
                            descriptionView
                            bookNow
                        }
                    }
                }
            }
        )
    }
}


extension CarDetailScreen {
    private var bookNow: some View {
        HStack(spacing: 0){
            Button(action: {
                navigator.pushToView(view: CarRentalConfirmationScreen(startDate: startDate?.toString() ?? "", endDate: endDate?.toString() ?? ""))
            }, label: {
                Text("bookNow".localized)
                    .textStyle(.ROBOTO_BOLD, size: 20)
                    .foregroundColor(Color(WHITE_FFFFFF))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color(((startDate?.toString().isEmpty) == nil) || ((endDate?.toString().isEmpty) == nil) ? GRAY_A1A1A1 : GREEN_2B4C59))
                    .cornerRadius(10)
            })
        }
        .padding(.horizontal, 16)
        .padding(.top, 5)
        .disabled(((startDate?.toString().isEmpty) == nil) || ((endDate?.toString().isEmpty) == nil))
    }
    
    private var carTitleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(imageCar)
                .resizable()
                .frame(height: 170)
                .padding(.vertical, 15)
            VStack(alignment: .leading, spacing: 10){
                Text(nameCar.uppercased())
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                Text("\("rentCost".localized) : \(price) \("vndDay".localized)")
                    .textStyle(.ROBOTO_MEDIUM, size: 16)
            }
            .foregroundColor(Color(GREEN_2B4C59))
            .padding(EdgeInsets(top: 15, leading: 16, bottom: 13, trailing: 16))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var timeRentalView: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("rentalPeriod".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
                .padding(.bottom, 16)
            DatePickerTextField(placeholder: "startDay".localized,
                                date: $startDate)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
                .padding(.bottom, 18)
            DatePickerTextField(placeholder: "endDay".localized,
                                date: $endDate,
                                onCommit: {
                if let endDate = endDate, let startDate = startDate {
                    let comparisonResult = startDate.compare(endDate)
                    if comparisonResult == .orderedDescending {
                        let confirmDialog = ConfirmDialog(content: "startDateExceedsEndDate".localized) {
                            self.startDate = Date()
                        }
                        Popup.presentPopup(alertView: confirmDialog)
                    }
                }
            })
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var deliveryLocationPayCar: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("deliveryAndReturnLocations".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            HStack(spacing: 6){
                Image(IC_LOCATION_BLACK)
                    .resizable()
                    .frame(width: 11.5, height: 17.5)
                Text(address)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var limitNumberKm: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(spacing: 0){
                Text("limitOfDay".localized)
                    .textStyle(.ROBOTO_MEDIUM, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text("340 km/Ngày")
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            Text("Phí: 3.000 VND mỗi km vượt giới hạn")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var vehicleDeliveryDocuments: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("deliveryPapers".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            HStack(spacing: 14){
                Image(IC_DRIVER_CARD)
                    .resizable()
                    .frame(width: 20, height: 15)
                Text("citizenId".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 14){
                Image(IC_DRIVER_CARD)
                    .resizable()
                    .frame(width: 20, height: 15)
                Text("driverLicense".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 14){
                Image(IC_DRIVER_CARD)
                    .resizable()
                    .frame(width: 20, height: 15)
                Text("householdPassport".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 16)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("description".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            LabelCustom(attributedText: makeContent(text: "descriptionContent".localized),
                        maxWidth: UIScreen.main.bounds.width - 32)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var collateralView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("collateral".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            LabelCustom(attributedText: makeContent(text: "collateralContent".localized),
                        maxWidth: UIScreen.main.bounds.width - 32)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
        .padding(.bottom, 16)
    }
    
    private func makeContent(text: String) -> NSMutableAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 2
        paragraph.alignment = .justified
        let attString = AttributedStringBuilder(string: text)
            .addFont(TextStyle.ROBOTO_REGULAR.uiFont(size: 14), forSubString: text)
            .addColor(UIColor(Color(BLACK_000000)), forSubString: text)
            .addParagrapStyle(paragraph, forSubString: text)
            .build()
        return attString
    }
}
