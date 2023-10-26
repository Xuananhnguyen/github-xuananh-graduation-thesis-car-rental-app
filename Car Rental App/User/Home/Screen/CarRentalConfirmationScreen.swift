//
//  CarRentalConfirmationScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 27/08/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CarRentalConfirmationScreen: AppNavigator {
    @StateObject var viewModel = CarRentalSubmitViewModel()
    @State private var invoiceCode: Int = 0
    @State private var noteString: String = ""
    var carModel: CarModel
    var startDay: Date
    var endDay: Date
    var days: Int
    var vehicleID: Int
    
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
                            noteView
                            vehicleDeliveryDocuments
                            carRentalButton
                        }
                    }
                }
                .onTapGesture {
                    self.dimissKeyBoard()
                }
            }
        )
        .onAppear {
            invoiceCode = Int(viewModel.generateRandomNumber()) ?? 0
        }
    }
}

extension CarRentalConfirmationScreen {
    private var carTitleView: some View {
        VStack(alignment: .leading, spacing: 0){
            if let img = URL(string: carModel.imageUrl ?? "") {
                WebImage(url: img)
                    .resizable()
                    .frame(height: 200)
                    .padding(.bottom, 15)
            }
            
            VStack(alignment: .leading, spacing: 10){
                Divider()
                    .frame(height: 1)
                    .background(Color(GREEN_2B4C59))
                
                Text(carModel.vehicleName?.uppercased() ?? "")
                    .textStyle(.ROBOTO_MEDIUM, size: 18)
                
                Text("Giao xe tận nơi")
                    .textStyle(.ROBOTO_MEDIUM, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    .frame(height: 22)
                    .background(Color(GRAY_EEEEEE))
                    .cornerRadius(3)
                
                Text("Loại xe: \(carModel.categoryName ?? "")")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                Text("Hãng xe: \(carModel.brandName ?? "")")
                    .textStyle(.ROBOTO_REGULAR, size: 14)
                
                HStack(spacing: 0){
                    Text("Màu xe: \(carModel.color ?? "")")
                        .textStyle(.ROBOTO_REGULAR, size: 14)
                    Spacer()
                    Text("Giá thuê: \(carModel.rentalPricePerDay ?? 0) VND/ngày")
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
                Text("\(carModel.limitedKmPerDay ?? 0) km/Ngày")
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
    
    private var noteView: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Ghi chú".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            
            TextFieldView(inputContent: $noteString)
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
            LabelCustom(attributedText: makeContent(text: carModel.description ?? ""),
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
            LabelCustom(attributedText: makeContent(text: carModel.collateral ?? ""),
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
                Text(" \(carModel.rentalPricePerDay ?? 0) ")
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
                Text(" \(carModel.rentalPricePerDay ?? 0) x \(days) ngày")
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
                Text("\(calculatorTotalPrice())")
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 0){
                Text("totalPile".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                Text(" \(calculatorTotalPile())")
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            
            HStack(spacing: 0){
                Text("payTheCarOwnerAtTheEnd".localized)
                    .textStyle(.ROBOTO_REGULAR, size: 13)
                    .foregroundColor(Color(GREEN_2B4C59))
                Spacer()
                let payTheCarOwnerAtTheEnd = calculatorTotalPrice() - calculatorTotalPile()
                Text("\(payTheCarOwnerAtTheEnd)")
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
                Text("\(calculatorTotalPrice()) đ")
                    .textStyle(.ROBOTO_MEDIUM, size: 20)
                    .foregroundColor(Color(GREEN_2B4C59))
            }
            Spacer()
            Button(action: {
                                          viewModel.submitCarRental(vehicleID: vehicleID,
                                          startDay: startDay.toString(),
                                          endDay: endDay.toString(),
                                          numberOfRentalDays: days,
                                          totalAmount: calculatorTotalPrice(),
                                          note: "",
                                          invoiceCode: invoiceCode) {
                    navigator.pushToView(view: SuccessScreen())
                }
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
    
    func calculatorTotalPrice() -> Int {
        return (carModel.rentalPricePerDay ?? 0) * days
    }
    
    func calculatorTotalPile() -> Int {
        return Int(Double(calculatorTotalPrice()) * 0.3)
    }
}
