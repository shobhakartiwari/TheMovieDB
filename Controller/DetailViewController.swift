//
//  DetailViewController.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var titlelLable: UILabel!
    @IBOutlet weak var overviewTv: UITextView!
    @IBOutlet weak var pop: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releasedat: UILabel!
    @IBOutlet weak var votecountlable: UILabel!
    @IBOutlet weak var genres: UILabel!
   
   
    var image : UIImage?
    var overtext : String?
    var popularity : String?
    var ratings : String?
    var releasedate: String?
    var genere : String?
    var titles : String?
    var vote_count : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
    }


}
extension DetailViewController {
    func forViewDidLoad() {
        guard let image = image else {return}
        guard let overviewtext = overtext else {return}
        guard let popularity = popularity else {return }
        guard let releasedate = releasedate else {return}
        guard let genera = genere else { return}
        guard let ratings = ratings else {return}
        guard let titles = titles else {return}
        guard let vote_count = vote_count else { return}
        thumbNail.beautify(image: image)
        titlelLable.beautify(str: titles)
        overviewTv.beautify(str: overviewtext)
        pop.beautify(str: popularity)
        rating.beautify(str: ratings + "/10")
        genres.beautify(str: genera)
        releasedat.beautify(str: releasedate)
        votecountlable.beautify(str: vote_count)
        
    }
}
