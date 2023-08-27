//
//  CarRentalConfirmationScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/08/2023.
//

import SwiftUI
import VNavigator

struct CarRentalConfirmationScreen: AppNavigator {
    var imageCar: String = CAR_IMG
    var nameCar: String = "MITSUBISHI XPANDER 2021"
    var address: String = "Hà Đông, Hà Nội"
    var price: String = "950,000"
    var startDate: String = ""
    var endDate: String = ""
    var days: Int = 1
    var totalPrice: String = "950,000"
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: "titleConfirmation".localized,
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                VStack(alignment: .leading, spacing: 0){
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .leading, spacing: 17){
                            carTitleView
                            timeRentalView
                            priceDetails
                            limitNumberKm
                            descriptionView
                            collateralView
                            vehicleDeliveryDocuments
                            carRentalButton
                        }
                    }
                }
            }
        )
    }
}

extension CarRentalConfirmationScreen {
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
            Text(startDate)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
                .padding(.bottom, 18)
            Text(endDate)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
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
    
    private var priceDetails: some View {
        VStack(alignment: .leading, spacing: 17) {
            Text("priceDetail".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            HStack(spacing: 0){
                Text("rentalUnitPrice".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text(price)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(GREEN_2B4C59))
            
            HStack(spacing: 0){
                Text("totalCarRentalFee".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text("\(price) x \(days) ngày")
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(GREEN_2B4C59))
            
            HStack(spacing: 0){
                Text("totalPrice".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text(totalPrice)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 0){
                Text("totalPile".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text(totalPrice)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 0){
                Text("payTheCarOwnerAtTheEnd".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text(totalPrice)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
        .padding(.bottom, 16)
    }
    
    private var carRentalButton: some View {
        HStack(spacing: 0){
            VStack(spacing: 8){
                Text("totalPrice".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 20)
                    .foregroundColor(Color(GREEN_2B4C59))
                Text("\(price) đ")
                    .textStyle(.ROBOTO_MEDIUM, size: 20)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            Spacer()
            Button(action: {
                navigator.pushToView(view: SuccessScreen())
            }, label: {
                Text("carRental".localized)
                    .textStyle(.ROBOTO_BOLD, size: 20)
                    .foregroundColor(Color(WHITE_FFFFFF))
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                    .frame(width: 112, height: 50)
                    .background(Color(GREEN_2B4C59))
                    .cornerRadius(10)
            })
        }
        .padding(EdgeInsets(top: 18, leading: 16, bottom: 18, trailing: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
        .padding(.bottom, 16)
    }
}
