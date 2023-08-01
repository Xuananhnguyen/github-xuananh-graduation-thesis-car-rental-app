//
//  HomeScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI
import VNavigator

struct HomeScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    @State private var searchText: String = ""
    
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
                .padding(.top, 15)
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
            
            Text("Nguyen Xuan Anh")
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
    
    private var searchView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("searchCar".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
            
            SearchBar(text: $searchText)
            
            ButtonAuth(title: "findCar".localized,
                       onPress: {
                navigator.pushToView(view: ViewMoreScreen())
            })
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(Color(WHITE_FFFFFF))
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
}
