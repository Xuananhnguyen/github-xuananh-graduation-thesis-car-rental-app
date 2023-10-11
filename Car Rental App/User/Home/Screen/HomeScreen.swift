//
//  HomeScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI

struct HomeScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    @State var startDay: Date?
    @State var endDay: Date?
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           backgroundColor: Color(GRAY_EEEEEE),
                           builderHeader: {
            topHeader
        }, builderContent: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    searchView
                    voucherView
                    rulesView
                    cancellationView
                }
                .padding(.vertical, 16)
            }
        })
    }
}

extension HomeScreen {
    private var topHeader: some View {
        HStack(spacing: 0) {
            Image(IMG_CAR)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing, 13)
            
            Text("User name")
                .textStyle(.ROBOTO_MEDIUM, size: 20)
                .foregroundColor(Color(WHITE_FFFFFF))
            
            Spacer()
            Button(action: {
                navigator.pushToView(view: ProfileScreen())
            }, label: {
                Image(IC_THREE_LINE)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 27, height: 17.5)
                    .foregroundColor(Color(WHITE_FFFFFF))
            })
            .frame(width: 41, height: 35, alignment: .center)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 17)
        .background(Color(GREEN_2B4C59)).ignoresSafeArea(.all, edges: .bottom)
    }
    
    private var voucherView: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("voucher".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            Image(IMG_SALE)
                .resizable()
                .frame(width: 357, height: 158, alignment: .center)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var rulesView: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("rules".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            LabelCustom(attributedText: makeContent(text: "rulesTilte".localized),
                        maxWidth: UIScreen.main.bounds.width - 32)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var cancellationView: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("cancellation".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            LabelCustom(attributedText: makeContent(text: "cancellationTilte".localized),
                        maxWidth: UIScreen.main.bounds.width - 32)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(Color(WHITE_FFFFFF))
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
    
    private var searchView: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("rentalPeriod".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
                .padding(.bottom, 16)
            DatePickerTextField(placeholder: "startDay".localized,
                                date: $startDay)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .background(Color(WHITE_F0F0F0))
                .cornerRadius(10)
            
            DatePickerTextField(placeholder: "endDay".localized,
                                date: $endDay,
                                onCommit: {
                if let endDate = endDay, let startDate = startDay {
                    let comparisonResult = startDate.compare(endDate)
                    if comparisonResult == .orderedDescending {
                        let confirmDialog = ConfirmDialog(content: "startDateExceedsEndDate".localized) {
                            self.startDay = Date()
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
            
            ButtonAuth(title: "findCar".localized,
                       onPress: {
                navigator.pushToView(view: CarResultScreen(startDay: startDay, endDay: endDay))
            })
        }
        .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
}
