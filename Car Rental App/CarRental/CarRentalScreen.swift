//
//  CarRentalScreen.swift
//  Car Rental App
//
//  Created by Chiến Lê on 31/07/2023.
//

import SwiftUI
import VNavigator

struct CarRentalScreen: AppNavigator {
    @ObservedObject var viewModel = CarRentalViewModel()
    var colorStatus: ColorStatus = .cancel
    var body: some View {
        BaseNavigationView {
            headerCarRentalView(numberNoti: 10)
        } builderContent: {
            makeListCarRental()
        }
        .onAppear {
            viewModel.getListCarRental()
        }
    }
}

extension CarRentalScreen {
    // MARK: Make Header
    func headerCarRentalView(numberNoti: Int = 0) -> some View {
        HStack {
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            
            Text("settings".localized)
                .textStyle(.ROBOTO_BOLD, size: 23)
                .foregroundColor(Color(BLACK_000000))
            Spacer()
            
            Image(IC_MSG)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(BLACK_000000))
                .frame(width: 42, height: 42)
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(RED_C64949))
                        let number = (numberNoti > 9) ? "9+" : "\(numberNoti)"
                        Text(number)
                            .font(.system(size: 12))
                            .foregroundColor(Color(WHITE_FFFFFF))
                    }
                }
                .onTapGesture {
                    // tap on message
                }
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: Make body
    func makeListCarRental() -> some View {
        ScrollView(showsIndicators: false) {
            ForEach(viewModel.carRentalData, id: \.self) { item in
                itemCarRentalView(statusType: item.statusType ?? "", imageCar: item.imageCar ?? "", status: item.status ?? "", titleCar: item.titleCar ?? "", price: item.price ?? "", dateFrom: item.dateFrom ?? "", dateTo: item.dateTo ?? "")
            }
        }
    }
    
    // MARK: Item CarRental view
    func itemCarRentalView(statusType: String?,
                           imageCar: String?,
                           status: String?,
                           titleCar: String?,
                           price: String?,
                           dateFrom: String?,
                           dateTo: String?) -> some View {
        var backgroundButton: Color = Color(.clear)
        var textColor: Color = Color(BLACK_000000)
        if let colorType = ColorStatus(rawValue: statusType ?? "") {
            textColor = Color(colorType.retColor)
            backgroundButton = Color(colorType.retColor).opacity(0.5)
        }
        return VStack(spacing: 16) {
            HStack(spacing: 16) {
                Image(imageCar ?? "")
                    .resizable()
                    .frame(width: 57, height: 57)
                    .background(Color.red)
                    .cornerRadius(8)
                VStack(alignment: .leading, spacing: 8) {
                    Text(titleCar ?? "")
                        .textStyle(.ROBOTO_MEDIUM, size: 18)
                        .foregroundColor(Color(GREEN_2B4C59))
                    Text(status ?? "")
                        .foregroundColor(textColor)
                        .textStyle(.ROBOTO_REGULAR, size: 12)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 16)
                        .background(backgroundButton)
                        .cornerRadius(16)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(textColor, lineWidth: 1)
                        }
                    Group {
                        Text("priceRental")
                            .foregroundColor(Color(GRAY_676767))
                        + Text(price ?? "")
                            .foregroundColor(Color(RED_C64949))
                    }.textStyle(.ROBOTO_BOLD, size: 16)                }
                Spacer()
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(GRAY_A1A1A1))
            HStack {
                Text(String(format: "from".localized, dateFrom ?? ""))
                Spacer()
                Text(String(format: "to".localized, dateTo ?? ""))
            }
            .textStyle(.ROBOTO_MEDIUM, size: 16)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .padding(.bottom, 8)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 8, y: 8)
        .padding(8)
        .padding(.top, 8)
    }
}

struct CarRentalScreen_Previews: PreviewProvider {
    static var previews: some View {
        CarRentalScreen()
    }
}
