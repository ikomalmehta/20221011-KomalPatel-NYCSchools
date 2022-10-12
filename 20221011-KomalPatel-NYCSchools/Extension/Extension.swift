//
//  Extension.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import Foundation
import UIKit

extension UIView{
    func setShadow() {
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
    }
}


extension UIViewController {
    
    func showToast(message : String,BackGroundColor:UIColor = UIColor.black.withAlphaComponent(1),textColor:UIColor = UIColor.white) {
        DispatchQueue.main.async {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-200, width: 300, height: 80))
            toastLabel.backgroundColor = BackGroundColor
            toastLabel.textColor = textColor
            toastLabel.textAlignment = .center;
            toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.numberOfLines = 0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 6.0, delay: 0.3, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    }
}
