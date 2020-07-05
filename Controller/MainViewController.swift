//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
    @IBOutlet weak var moviesTableView: UITableView!
    let dummyArray : [UIColor] = [.red , .blue , .black , .gray]  // dummy array to test functionality . will remove later
    let arrayStrings : [String] = ["Red" , "Blue" , "Black" , "Gray"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "The Movies"
    }
}

 //MARK:- TableView DataSource

extension MainViewController : UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell" , for: indexPath) as! MovieCell
        cell.backgroundColor = dummyArray[indexPath.row]
        return cell
    }
}

//MARK:- TableView Delegate
extension MainViewController : UITableViewDelegate   {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        guard let detVc = storyB.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        detVc.navigationItem.title = arrayStrings[indexPath.row]
        detVc.testcolors = dummyArray[indexPath.row]
        navigationController?.pushViewController(detVc, animated: true)
    }
}

