//
//  ReusableExtenstions.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func Decorate () {
        self.backgroundColor = .lightGray
    }
}

extension UIImageView {
    func beautify () {
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
}

extension UILabel {
    func beautify (str : String ) {
        self.text = str
        if (str.contains("Title")) {
            self.textColor = .green
            self.textAlignment = .center
            self.numberOfLines = 0
            self.adjustsFontSizeToFitWidth = true
        } else {
            
           self.textAlignment = .center
           self.backgroundColor = .lightGray
           self.adjustsFontSizeToFitWidth = true
        
        }
       
    }
}

extension UITableViewCell {
    func Beautify() {
        self.backgroundColor = .lightGray
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
}

extension UITableView {
    func Beautify() {
        self.backgroundColor = .clear
    }
}


