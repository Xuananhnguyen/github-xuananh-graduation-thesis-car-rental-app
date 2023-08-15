//
//  BaseNavigationView.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 07/12/2022.
//

import SwiftUI

struct BaseNavigationView<CustomHeader: View, Content: View>: View {
    @Environment (\.navigator) var navigator
    private var isHiddenBackButton: Bool = false
    private var onPressBack: (() -> Void)? = nil
    private var titleBackbutton: String = ""
    private var title: String = ""
    private var builderContent: Content
    private var builderHeader: CustomHeader
    private var backGroundColor: Color = Color(WHITE_FFFFFF)
    private var navigatorBarBackgroundColor: Color = Color(WHITE_FFFFFF)
    private var paddingBottom: CGFloat = 2
    private var textStyleTitle: Font = TextStyle.ROBOTO_MEDIUM.font(size: 20)
    private var rightIcon: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            if !isHiddenBackButton {
                if builderHeader is EmptyView {
                    renderDefaultHeader
                        .padding(.bottom, paddingBottom)
                    
                } else {
                    builderHeader
                        .frame(maxWidth: .infinity)
                }
            }
            builderContent
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(backGroundColor)
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    var renderDefaultHeader: some View {
        HStack(spacing: 0) {
            BackHeader(
                backgroundColor: navigatorBarBackgroundColor,
                title: title,
                textStyleTitle: textStyleTitle,
                onPressBack: {
                    if let onPressback = onPressBack {
                        onPressback()
                    } else {
                        navigator.pop()
                    }
                }
            )
        }
    }
}

extension BaseNavigationView {
    init(
        isHiddenBackButton: Bool = false,
        onPressBack: (() -> Void)? = nil,
        titleBackbutton: String = "",
        title: String = "",
        backgroundColor: Color = Color(WHITE_FFFFFF),
        navigatorBarBackgroundColor: Color = Color(WHITE_FFFFFF),
        paddingBottom: CGFloat = 2,
        textStyleTitle: Font = TextStyle.ROBOTO_MEDIUM.font(size: 20),
        rightIcon: String = "",
        @ViewBuilder builderHeader: () -> CustomHeader,
        @ViewBuilder builderContent: () -> Content
    ) {
        self.title = title
        self.isHiddenBackButton = isHiddenBackButton
        self.onPressBack = onPressBack
        self.titleBackbutton = titleBackbutton
        self.backGroundColor = backgroundColor
        self.navigatorBarBackgroundColor = navigatorBarBackgroundColor
        self.paddingBottom = paddingBottom
        self.textStyleTitle = textStyleTitle
        self.builderContent = builderContent()
        self.builderHeader = builderHeader()
        self.rightIcon = rightIcon
    }
}

extension BaseNavigationView where CustomHeader == EmptyView {
    init(
        isHiddenBackButton: Bool = false,
        onPressBack: (() -> Void)? = nil,
        titleBackbutton: String = "",
        title: String = "",
        backgroundColor: Color = Color(WHITE_FFFFFF),
        navigatorBarBackgroundColor: Color = Color(WHITE_FFFFFF),
        paddingBottom: CGFloat = 2,
        rightIcon: String = "",
        textStyleTitle: Font = TextStyle.ROBOTO_MEDIUM.font(size: 20),
        @ViewBuilder builderContent: () -> Content
    ) {
        self.init(
            isHiddenBackButton: isHiddenBackButton,
            onPressBack: onPressBack,
            titleBackbutton: titleBackbutton,
            title: title,
            backgroundColor: backgroundColor,
            navigatorBarBackgroundColor: navigatorBarBackgroundColor,
            paddingBottom: paddingBottom,
            textStyleTitle: textStyleTitle,
            rightIcon: rightIcon,
            builderHeader: { EmptyView() },
            builderContent: builderContent
        )
    }
}

