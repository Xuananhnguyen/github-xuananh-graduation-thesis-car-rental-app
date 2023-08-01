//
//  LabelCustom.swift
//  Car Rental App
//
//  Created by NGUYEN XUAN ANH on 01/08/2023.
//

import SwiftUI

struct LabelCustom: UIViewRepresentable {
    typealias UIViewType = UILabel
    var attributedText: NSMutableAttributedString
    var maxWidth: CGFloat = UIScreen.main.bounds.width
    var lineNumber: Int = 0
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = attributedText
        uiView.numberOfLines = lineNumber
    }
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = lineNumber
        label.preferredMaxLayoutWidth = maxWidth
        label.attributedText = attributedText
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }
}
