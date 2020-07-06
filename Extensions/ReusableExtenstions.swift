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
        self.backgroundColor = .darkGray
    }
}

extension UIImageView {
    func beautify (image : UIImage) {
        self.image = image
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
           self.backgroundColor = .darkGray
           self.adjustsFontSizeToFitWidth = true
            self.textColor = .magenta
        }
    }
}

extension UITextView  {
    func beautify(str: String ) {
        self.text = str
        self.backgroundColor = .darkGray
        self.textAlignment = .center
        self.layoutIfNeeded()
        self.font = .boldSystemFont(ofSize: 21)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.magenta.cgColor
        self.textColor = .blue
    }
}

extension UITableViewCell {
    func Beautify() {
        self.backgroundColor = .darkGray
        self.layer.borderColor = UIColor.magenta.cgColor
        self.layer.borderWidth = 1
    }
}

extension UITableView {
    func Beautify() {
        self.backgroundColor = .darkGray
    }
}


