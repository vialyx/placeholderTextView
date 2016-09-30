//
//  ViewController.swift
//  Demo
//
//  Created by Maksim Vialykh on 30.09.16.
//  Copyright © 2016 Vialyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tvMessage: PlaceholderTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMessagePlaceHolder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func configureMessagePlaceHolder() {
        //  TODO: - Create an icon
        let icon: NSTextAttachment = NSTextAttachment()
        icon.image = UIImage(named: "paper-plane")
        let iconString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: icon))
        
        tvMessage.icon = icon
        
        //  TODO: - Create an attributed placeholder string
        let textColor = UIColor.gray
        let lightFont = UIFont(name: "Helvetica-Light", size: tvMessage.font!.pointSize)
        let italicFont = UIFont(name: "Helvetica-LightOblique", size: tvMessage.font!.pointSize)
        
        let message = NSAttributedString(string: " " + "Personal Message", attributes: [ NSFontAttributeName: lightFont!, NSForegroundColorAttributeName: textColor])
        
        iconString.append(message)
        
        let option = NSAttributedString(string: " " + "Optional", attributes: [ NSFontAttributeName: italicFont!, NSForegroundColorAttributeName: textColor])
        
        iconString.append(option)
        
        tvMessage.attributedPlaceHolder = iconString
        
        tvMessage.layoutSubviews()
    }

}

