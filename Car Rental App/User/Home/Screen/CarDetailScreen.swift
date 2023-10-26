 //
//  CarDetailScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarDetailScreen: AppNavigator {
    @StateObject var viewModel = CarDetailViewModel()
    var vehicleID: Int
    var startDay: Date
    var endDay: Date
    
    var body: some View {
        BaseNavigationView(
            isHiddenBackButton: false,
            title: viewModel.carDetail?.vehicleName ?? "",
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
        .onAppear {
            viewModel.carDetail(vehicleID: vehicleID)
        }
    }
}


extension CarDetailScreen {
    private var bookNow: some View {
        HStack(spacing: 0){
            Button(action: {
                if let carModel = viewModel.carDetail,
                   let days = calculateDayDifference(startDay: startDay, endDay: endDay) {
                    navigator.pushToView(view: CarRentalConfirmationScreen(carModel: carModel,
                                                                           startDay: startDay,
                                                                           endDay: endDay,
                                                                           days: days,
                                                                           vehicleID: vehicleID))
                }
            }, label: {
                Text("bookNow".localized)
                    .textStyle(.ROBOTO_BOLD, size: 20)
                    .foregroundColor(Color(WHITE_FFFFFF))
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color(GREEN_2B4C59))
                    .cornerRadius(10)
            })
        }
        .padding(.horizontal, 16)
        .padding(.top, 5)
    }
    
    private var carTitleView: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = URL(string: viewModel.carDetail?.imageUrl ?? "") {
                WebImage(url: img)
                    .resizable()
                    .frame(height: 200)
                    .padding(.bottom, 15)
            }
            
            VStack(alignment: .leading, spacing: 10){
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                Text(viewModel.carDetail?.vehicleName?.uppercased() ?? "")
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                
                Text("Giao xe tận nơi")
                    .textStyle(.ROBOTO_MEDIUM, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .frame(height: 22)
                    .background(Color(GRAY_EEEEEE))
                    .cornerRadius(3)
                
                Text("Loại xe: \(viewModel.carDetail?.categoryName ?? "")")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                Text("Hãng xe: \(viewModel.carDetail?.brandName ?? "")")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                HStack(spacing: 0){
                    Text("Màu xe: \(viewModel.carDetail?.color ?? "")")
                        .textStyle(.ROBOTO_REGULAR, size: 14)
                    Spacer()
                    Text("Giá thuê: \(viewModel.carDetail?.rentalPricePerDay ?? 0) VND/ngày")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                }
            }
            .foregroundColor(Color(BLACK_000000))
            .padding(EdgeInsets(top: 10, leading: 13, bottom: 10, trailing: 16))
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
            Text("\(startDay.toString())")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 44)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
                .padding(.bottom, 18)
            Text("\(endDay.toString())")
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(maxWidth: .infinity, alignment: .leading)
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
                Text("\(viewModel.carDetail?.limitedKmPerDay ?? 0) km/Ngày")
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
            LabelCustom(attributedText: makeContent(text: viewModel.carDetail?.description ?? ""),
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
            LabelCustom(attributedText: makeContent(text: viewModel.carDetail?.collateral ?? ""),
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
