//
//  HomeScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 13/11/2022.
//

import SwiftUI

struct HomeScreen: AppNavigator {
    @StateObject var viewModel = HomeViewModel()
    @State var minPrice: String = ""
    @State var maxPrice: String = ""
    @State var startDay: Date?
    @State var endDay: Date?
    @State private var brandCar: DropdownMenuOption? = nil
    @State private var categoryCar: DropdownMenuOption? = nil
    @State private var yearCar: DropdownMenuOption? = nil
    @State private var colorCar: DropdownMenuOption? = nil
    @State var advancedSearch: Bool = false
    @State var pageIndex: Int = 0
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           backgroundColor: Color(GRAY_EEEEEE),
                           builderHeader: {
            topHeader
        }, builderContent: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    selectDescribe
                    searchView
                    voucherView
                    easyToUseView
                    rulesView
                    cancellationView
                }
                .padding(.vertical, 16)
            }
            .onTapGesture {
                self.dimissKeyBoard()
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
            
            Text(AppDataManager.shared.authenticate?.name ?? "EmptyName")
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
    
    private var easyToUseView: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Sử dụng đơn giản")
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 2){
                    ForEach(viewModel.listThumbNails.indices, id: \.self) { index in
                        let item = viewModel.listThumbNails[index]
                        Image(item)
                            .resizable()
                            .frame(width: 340, height: 190, alignment: .center)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var voucherView: some View {
        VStack(alignment: .leading, spacing: 15){
            Text("voucher".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
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
    
    private var selectDescribe: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Tiêu chí chọn xe".localized)
                .multilineTextAlignment(.center)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
            
            HStack {
                Button {
                    advancedSearch.toggle()
                } label: {
                    Text("Tìm kiếm nâng cao")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(5)
                }
                
                Button {
                    brandCar = nil
                    categoryCar = nil
                    colorCar = nil
                    yearCar = nil
                } label: {
                    Text("Reset")
                        .textStyle(.ROBOTO_MEDIUM, size: 14)
                        .foregroundColor(Color(WHITE_FFFFFF))
                        .padding(EdgeInsets(top: 5, leading: 14, bottom: 5, trailing: 14))
                        .background(Color(GREEN_2B4C59))
                        .cornerRadius(5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Lựa chọn khoảng giá")
                .textStyle(.ROBOTO_MEDIUM, size: 16)
                .foregroundColor(Color(GREEN_2B4C59))
            
            HStack(spacing: 0){
                TextFieldShortView(title: "Từ", inputContent: $minPrice)
                Spacer()
                TextFieldShortView(title: "Đến", inputContent: $maxPrice)
            }
            
            DropdownMenu(
                selectedOption: self.$categoryCar,
                placeholder: "Chọn loại xe",
                options: DropdownMenuOption.allCategory
            )
            
            if advancedSearch {
                DropdownMenu(
                    selectedOption: self.$brandCar,
                    placeholder: "Chọn hãng xe",
                    options: DropdownMenuOption.allBrandCar
                )
                
                DropdownMenu(
                    selectedOption: self.$colorCar,
                    placeholder: "Chọn màu xe",
                    options: DropdownMenuOption.allColor
                )
                
                DropdownMenu(
                    selectedOption: self.$yearCar,
                    placeholder: "Chọn năm sản xuất",
                    options: DropdownMenuOption.allYear
                )
            }
        }
        .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
    
    private var searchView: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("rentalPeriod".localized)
                .textStyle(.ROBOTO_MEDIUM, size: 18)
                .foregroundColor(Color(GREEN_2B4C59))
            
            DatePickerTextField(placeholder: "startDay".localized,
                                date: $startDay)
                .textStyle(.ROBOTO_REGULAR, size: 16)
                .padding(.horizontal, 16)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(height: 44)
                .background(Color(WHITE_F0F0F0))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
            
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
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                }
            
            ButtonAuth(title: "findCar".localized,
                       onPress: {
                if AppDataManager.shared.authenticate?.verified == 1 {
                    navigator.pushToView(view: CarResultScreen(startDay: startDay,
                                                               endDay: endDay,
                                                               brandID: viewModel.getBrandCarNumber(brandCar: brandCar?.option ?? ""),
                                                               color: colorCar?.option ?? "",
                                                               year: yearCar?.option ?? "",
                                                               categoryID: viewModel.getCategoryCarNumber(categoryCar: categoryCar?.option ?? ""),
                                                               minPrice: minPrice,
                                                               maxPrice: maxPrice))
                } else {
                    Popup.presentPopup(alertView: AccountVerifiedDialog(confirmAction: {
                        navigator.pushToView(view: LisenceScreen())
                    }))
                }
            })
        }
        .padding(EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(WHITE_FFFFFF))
    }
}
