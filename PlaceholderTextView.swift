//
//  PlaceholderTextView.swift
//  Demo
//
//  Created by Maksim Vialykh on 30.09.16.
//  Copyright © 2016 Vialyx. All rights reserved.
//

import UIKit

class PlaceholderTextView: UITextView {

    let placeHolderTag: Int = 999
    var drawBorder: Bool = true
    var placeHolder: String = ""
    var placeHolderLabel: UILabel = UILabel()
    var icon: NSTextAttachment?
    var attributedPlaceHolder: NSAttributedString = NSAttributedString(string: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func configure() {
        self.placeHolderLabel.lineBreakMode = .byWordWrapping
        self.placeHolderLabel.numberOfLines = 0
        self.placeHolderLabel.font = self.font
        self.placeHolderLabel.backgroundColor = UIColor.clear;
        self.placeHolderLabel.textColor = UIColor.lightGray;
        self.placeHolderLabel.alpha = 0.0;
        self.placeHolderLabel.tag = placeHolderTag;
        self.addSubview(self.placeHolderLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(PlaceholderTextView.textChanged), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textChanged()
    }
    
    func textChanged() {
        if placeHolder.isEmpty && attributedPlaceHolder.string.isEmpty {
            return
        }
        
        if self.text.isEmpty || (self.attributedPlaceHolder.length > 0 && self.attributedText.length < 3) {
            self.viewWithTag(placeHolderTag)?.alpha = 1.0
        } else {
            self.viewWithTag(placeHolderTag)?.alpha = 0.0
        }
        
        if self.icon != nil {
            if self.attributedText.length < 3 {
                setDefaultAttributeText()
            } else {
                applyFontToAttributeText()
            }
        }
    }
    
    func setDefaultAttributeText() {
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: icon!))
        attributedString.append(NSAttributedString(string: " "))
        self.attributedText = attributedString
    }
    
    func applyFontToAttributeText() {
        let attributedString = NSMutableAttributedString(attributedString: self.attributedText)
        attributedString.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14.0)], range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.placeHolderLabel.frame = CGRect(x: 5, y: 8, width: self.bounds.size.width - 16, height: 0)
        
        if !attributedPlaceHolder.string.isEmpty {
            self.placeHolderLabel.attributedText = self.attributedPlaceHolder
            self.placeHolderLabel.sizeToFit()
            self.sendSubview(toBack: self.placeHolderLabel)
        } else if (!placeHolder.isEmpty) {
            self.placeHolderLabel.text = self.placeHolder
            self.placeHolderLabel.sizeToFit()
            self.sendSubview(toBack: self.placeHolderLabel)
        }
        
        self.layer.cornerRadius = 5.0
        
        if (drawBorder) {
            self.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
        }
        
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        if (self.text.isEmpty && !self.placeHolder.isEmpty) {
            self.placeHolderLabel.alpha = 1.0
        }
    }

}
