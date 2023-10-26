//
//  DropdownMenuListRow.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 22/10/2023.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption
    
    /// An action called when user select an action.
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void
    
    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .textStyle(.ROBOTO_REGULAR, size: 16)
        .foregroundColor(Color(BLACK_000000))
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

