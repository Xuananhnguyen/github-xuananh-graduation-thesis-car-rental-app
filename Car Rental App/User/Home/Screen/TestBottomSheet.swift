//
//  TestBottomSheet.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 28/09/2023.
//

import SwiftUI

struct TestBottomSheet: AppNavigator {
    var body: some View {
        VStack {
            Button {
                navigator.presentView(view: showBottomsheet())
            } label: {
                Text("Show")
            }
        }
    }
}

struct showBottomsheet: AppNavigator {
    var body: some View {
        HStack {
            Button {
                navigator.dismiss()
            } label: {
                Text("Cancel")
            }
            Spacer()
            Button {
                navigator.presentView(view: showBottomsheet2())
            } label: {
                Text("Submit 1")
            }
        }
    }
}

struct showBottomsheet2: AppNavigator {
    var body: some View {
        HStack {
            Button {
                navigator.dismiss()
            } label: {
                Text("Cancel")
            }
            Spacer()
            Button {
                navigator.dismiss()
            } label: {
                Text("Submit 2")
            }
        }
    }
}


struct TestBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        TestBottomSheet()
    }
}
