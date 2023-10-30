//
//  BottomSheet.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 28/09/2023.
//

import SwiftUI

struct BottomSheet<Content: View>: AppNavigator {
    @State private var offset: CGSize = .zero
    var isSwipeDown: Bool
    var isDismissWhenTappedAnywhere: Bool
    let content: Content
    var onHide: ()->Void
    var onIndicator: Bool = false
    var body: some View {
        VStack {
            if !isSwipeDown {
                content
            } else {
                if onIndicator {
                    VStack {
                        itemMainView
                    }
                    .overlay(alignment: .top, content: {
                        
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .frame(width: 0.14.w, height: 0.006.h)
                            .padding(8)
                            .offset(x: 0, y: offset.height > 0 ? offset.height : 0)
                    })
                    .mask( {
                        RoundedRectangle(cornerRadius: 30,style: .continuous)
                    })
                } else {
                    itemMainView
                }
            }
        }
        .expanded(alignment: .bottom)
        .background(
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                if isDismissWhenTappedAnywhere {
                    navigator.dismiss() {
                        onHide()
                    }
                }
            }
        )
    }
    
    var itemMainView: some View {
        content
            .offset(x: 0, y: offset.height > 0 ? offset.height : 0)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { _ in
                        if self.offset.height > 100 {
                            navigator.dismiss() {
                                onHide()
                            }
                        } else {
                            self.offset = .zero
                        }
                    }
            )
    }
}
