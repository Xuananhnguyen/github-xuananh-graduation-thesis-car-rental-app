//
//  SettingScreen.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 25/06/2023.
//

import SwiftUI

struct SettingScreen: AppNavigator {
    var featureSetting: [SettingType] = [.language, .setPassword]
    
    var body: some View {
        BaseNavigationView(isHiddenBackButton: false,
                           titleBackbutton: "settings",
                           builderContent: {
            VStack(spacing: 20){
                ForEach(featureSetting.indices, id: \.self) { index in
                    let item = featureSetting[index]
                    ButtonProfile(nameFeature: item.nameSetting,
                                  onPress: {
                        onPressFeature(feature: item)
                    })
                }
                Spacer()
            }
            .padding(.bottom, 80)
            .background(Color(WHITE_FFFFFF).ignoresSafeArea())
        })
    }
}

struct SettingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingScreen()
    }
}


extension SettingScreen {
    private var header: some View {
        HStack(spacing: 0){
            Image(IC_ARROW_LEFT)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color(GREEN_2B4C59))
                .frame(width: 13, height: 21)
                .onTapGesture {
                    navigator.pop()
                }
            
            Spacer()
        }
        .padding(.top, 25)
        .padding(.bottom, 6)
        .padding(.horizontal, 16)
    }
    
    private func onPressFeature(feature: SettingType) {
        switch feature {
        case .language:
            return
        case .setPassword:
            return
        }
    }

}
