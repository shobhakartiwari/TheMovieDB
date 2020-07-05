//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var testView: UIImageView!
    var testcolors: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
    }


}

extension DetailViewController {
    func forViewDidLoad() {
        guard let color = testcolors else {return}
        testView.backgroundColor = color
    }
}
