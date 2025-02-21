//
//  AttributedString+Extension.swift
//  Pmobile3
//
//  Created by NGUYEN XUAN ANH on 18/11/2022.
//

import UIKit

class AttributedStringBuilder {
    var attributedString: NSMutableAttributedString
    init(string: String) {
        self.attributedString = NSMutableAttributedString(string: string)
    }
    init(attibutedString: NSMutableAttributedString) {
        self.attributedString = attibutedString
    }
    func build() -> NSMutableAttributedString {
        return self.attributedString
    }
    // Single substring
    func addFont(_ font: UIFont, forSubString subString: String) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.font: font],
                                            range: self.attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addColor(_ color: UIColor, forSubString subString: String) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.foregroundColor: color],
                                            range: self.attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addBackGroundColor(_ color: UIColor, forSubString subString: String) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.backgroundColor: color],
                                            range: self.attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addForgegroundColor(_ color: UIColor, forSubString subString: String) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.foregroundColor: color],
                                            range: self.attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addParagrapStyle(_ style: NSParagraphStyle, forSubString subString: String) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.paragraphStyle: style],
                                            range: self.attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addLink(_ link: String, forSubStrings subString: String) -> AttributedStringBuilder {
        if let url = link.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            attributedString.addAttribute(.link, value: url, range: self.attributedString.mutableString.range(of: subString))
        }
        return self
    }
    
    func addLink(_ link: String, atRange range: NSRange) -> AttributedStringBuilder {
        if let url = link.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            attributedString.addAttribute(.link, value: url, range: range)
        }
        return self
    }
    
    // Multiple
    func addFonts(font: UIFont, forSubStrings subStrings: [String]) -> AttributedStringBuilder {
        subStrings.forEach({
            self.attributedString.addAttributes([NSMutableAttributedString.Key.font: font],
                                                range: self.attributedString.mutableString.range(of: $0))
        })
        return self
    }
    
    func addColor(_ color: UIColor, forSubStrings subStrings: [String]) -> AttributedStringBuilder {
        subStrings.forEach({
            self.attributedString.addAttributes([NSMutableAttributedString.Key.foregroundColor: color],
                                                range: self.attributedString.mutableString.range(of: $0))
        })
        return self
    }
    
    func addLink(forSubStrings subStrings: [String]) -> AttributedStringBuilder {
        subStrings.forEach {
            if let url = $0.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                attributedString.addAttribute(.link, value: url, range: self.attributedString.mutableString.range(of: $0))
            }
        }
        return self
    }
    
    func addUnderline(forSubStrings subStrings: [String]) -> AttributedStringBuilder {

        subStrings.forEach {
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: self.attributedString.mutableString.range(of: $0))
        }

        return self
    }
    
    func addUnderline(forSubString subString: String) -> AttributedStringBuilder {

        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: self.attributedString.mutableString.range(of: subString))

        return self
    }

    func textAlignment(alignment: NSTextAlignment) -> AttributedStringBuilder {
        let style = NSMutableParagraphStyle()
        style.alignment =  alignment
        return addParagrapStyle(style, forSubString: attributedString.string)
    }
    
    func lineSpacing(lineSpacing: CGFloat) -> AttributedStringBuilder {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        return addParagrapStyle(style, forSubString: attributedString.string)
    }
    
    func addImage(image: UIImage?, tintColor: UIColor, size: CGSize) -> AttributedStringBuilder {
        let attachment = NSTextAttachment()
        attachment.image = image
        let image1String = NSAttributedString(attachment: attachment)
        attachment.bounds = CGRect(x: 5, y: -4, width: size.width, height: size.width)
        self.attributedString.append(image1String)
        return self
    }
    
    func setBaselineOffset(subString: String, offset: CGFloat) -> AttributedStringBuilder {
        self.attributedString.addAttributes([NSMutableAttributedString.Key.baselineOffset: offset],
                                            range: attributedString.mutableString.range(of: subString))
        return self
    }
    
    func addColorForMultiValues(_ color: UIColor, forSubString subString: String, options: NSString.CompareOptions = []) -> AttributedStringBuilder {
        let inputLength = self.attributedString.string.count
        let searchLength = subString.count
        var range = NSRange(location: 0, length: self.attributedString.length)
        
        while (range.location != NSNotFound) {
            range = (self.attributedString.string as NSString).range(of: subString, options: options, range: range)
            if (range.location != NSNotFound) {
                self.attributedString.addAttributes([NSMutableAttributedString.Key.foregroundColor: color], range: NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
        return self
    }
}

