//
//  VehiclesDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/10/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct VehiclesDetailScreen: AppNavigator {
    var imageUrl: String
    var vehicleName: String
    var brandName: String
    var categoryName: String
    var color: String
    var rentalPricePerDay: Int
    var limitedKmPerDay: Int
    var description: String
    var collateral: String
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: vehicleName,
            backgroundColor: Color(GRAY_EEEEEE),
            builderContent: {
                VStack(alignment: .leading, spacing: 0){
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(alignment: .leading, spacing: 17){
                            carTitleView
                            deliveryLocationPayCar
                            limitNumberKm
                            collateralView
                            vehicleDeliveryDocuments
                            descriptionView
                        }
                    }
                }
            }
        )
    }
}


extension VehiclesDetailScreen {
    private var carTitleView: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = URL(string: imageUrl) {
                WebImage(url: img)
                    .resizable()
                    .frame(height: 200)
                    .padding(.bottom, 15)
            }
            
            VStack(alignment: .leading, spacing: 10){
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                Text(vehicleName.uppercased())
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                
                Text("Giao xe tận nơi")
                    .textStyle(.ROBOTO_MEDIUM, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .frame(height: 22)
                    .background(Color(GRAY_EEEEEE))
                    .cornerRadius(3)
                
                Text("Loại xe: \(categoryName)")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                Text("Hãng xe: \(brandName)")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                HStack(spacing: 0){
                    Text("Màu xe: \(color)")
                        .textStyle(.ROBOTO_REGULAR, size: 14)
                    Spacer()
                    Text("Giá thuê: \(rentalPricePerDay) VND/ngày")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                }
            }
            .foregroundColor(Color(BLACK_000000))
            .padding(EdgeInsets(top: 10, leading: 13, bottom: 10, trailing: 16))
        }
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
                Text(AppDataManager.shared.authenticate?.address ?? "")
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
                Text("\(limitedKmPerDay) km/Ngày")
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
            LabelCustom(attributedText: makeContent(text: description),
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
            LabelCustom(attributedText: makeContent(text: collateral),
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
