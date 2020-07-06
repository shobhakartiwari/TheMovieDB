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
//    let dummyArray : [UIColor] = [.red , .blue , .black , .gray]  // dummy array to test functionality . will remove later
//    let arrayStrings : [String] = ["Red" , "Blue" , "Black" , "Gray"]
    var movies = [Movie]()
    var networkHandler = Networking()
    var filteredMovs = [Movie]()
    var navtTile : String {
         return "The Movies"
    }
    var titleHelper : String {
        return "Title: "
    }
    var populaHelper : String {
        "Popularity Score: "
    }
    var releaseYHelper : String {
        return  "Release Year: "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
        response()
        ConfigureCellView()
    }

   func response ()  {
        networkHandler.response(url: UrlPath.path.sharePathUrl()) { (movs: Movies ) in
            print(UrlPath.path.sharePathUrl())
            self.movies = movs.results
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
}

 //MARK:- TableView DataSource

extension MainViewController : UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell" , for: indexPath) as! MovieCell
        guard let url = URL(string: UrlPath.path.sharePathImg() + movies[indexPath.row].poster_path) else {return UITableViewCell()}
        let data = try? Data(contentsOf: url)
        guard let datac = data else  {return UITableViewCell()}
        cell.movieimage.beautify(image: UIImage(data: datac)!)
        cell.title.beautify(str: titleHelper + movies[indexPath.row].title )
        cell.popularityScore.beautify(str: populaHelper + String(movies[indexPath.row].popularity))
        cell.releaseYear.beautify(str: releaseYHelper + GetReleaseYear(date: movies[indexPath.row].release_date))
        cell.containerView.Decorate()
        cell.Beautify()
        return cell
    }
}

//MARK:- TableView Delegate
extension MainViewController : UITableViewDelegate   {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        guard let detVc = storyB.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        detVc.navigationItem.title = movies[indexPath.row].title
        navigationController?.pushViewController(detVc, animated: true)
    }
}

//MARK:- For ViewDidLoad - Making viewdidload less crowded and just one single call function makes it better code , for the eyes
extension MainViewController  {
    func forViewDidLoad() {
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
            moviesTableView.Beautify()
            navigationItem.title = navtTile
    }
    
    func GetReleaseYear (date : String ) -> String {
           let y_m_d = date.components(separatedBy: "-")
           return y_m_d[0]
   }
    func ConfigureCellView() {
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 200
    }
  
      
}

