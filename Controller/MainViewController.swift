//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Duale on 7/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

/*
   Checking Landscape mode : View can now be in landscape and portrait as well
 */
class MainViewController: UIViewController {
   
    @IBOutlet weak var moviesTableView: UITableView!
    let searchcontroller = UISearchController(searchResultsController: nil);
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
    var searchPlaceHolder : String {
       return "Enter a movie title to search"
    }
    var ratings : String {
        return "Ratings: "
    }
    var genreids : String {
        return "Genre Ids: "
    }
    var vote_count : String {
        return "Vote Count: "
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
        // check if movie is filtered or not and getting the count we need depending on that
        let moviess : [Movie] = (isfiltered == true) ? filteredMovs :  movies
        return moviess.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell" , for: indexPath) as! MovieCell
        let moviess : [Movie] = (isfiltered == true) ? filteredMovs :  movies
        guard let url = URL(string: UrlPath.path.sharePathImg() + moviess[indexPath.row].poster_path) else {return UITableViewCell()}
        let data = try? Data(contentsOf: url)
        guard let datac = data else  {return UITableViewCell()}
        // moviees depending on search
        cell.movieimage.beautify(image: UIImage(data: datac)!)
        cell.title.beautify(str: titleHelper +  moviess[indexPath.row].title )
        cell.popularityScore.beautify(str: populaHelper + String(moviess[indexPath.row].popularity))
        cell.releaseYear.beautify(str: releaseYHelper + GetReleaseYear(date: moviess[indexPath.row].release_date))
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
        let moviess : [Movie] = (isfiltered == true) ? filteredMovs :  movies
        guard let url = URL(string: UrlPath.path.sharePathImg() + moviess[indexPath.row].poster_path) else {return}
        let data = try? Data(contentsOf: url)
        guard let datac = data else  {return}
        guard let detVc = storyB.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        detVc.overtext =  movies[indexPath.row].overview
        detVc.image = UIImage(data: datac)!
        detVc.navigationItem.title = moviess[indexPath.row].title
        detVc.ratings = ratings + String(moviess[indexPath.row].vote_average)
        detVc.releasedate = releaseYHelper +  moviess[indexPath.row].release_date
        detVc.genere = genreids + getStrings(for:  moviess[indexPath.row].genre_ids)
        detVc.popularity = populaHelper +  String(moviess[indexPath.row].popularity)
        detVc.vote_count = vote_count + String(moviess[indexPath.row].vote_count)
        detVc.titles = titleHelper +  moviess[indexPath.row].title
        navigationController?.pushViewController(detVc, animated: true)
    }
}

//MARK:- SearchController delegate for updating
extension MainViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
       filteredMovies(for: searchBar.text!)
    }
}

//MARK:- For ViewDidLoad - Making viewdidload less crowded and just one single call function makes it better code , for the eyes
extension MainViewController  {
    func forViewDidLoad() {
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
            moviesTableView.Beautify()
            navigationItem.title = navtTile
            searchcontroller.searchResultsUpdater = self
            navigationItem.searchController = searchcontroller
            searchcontroller.searchBar.placeholder = searchPlaceHolder
            searchcontroller.obscuresBackgroundDuringPresentation = false
            definesPresentationContext = true
    }
    // grap the year of release. I found no need for date formater since the release year is in string and with "-" separator 
    func GetReleaseYear (date : String ) -> String {
           let y_m_d = date.components(separatedBy: "-")
           return y_m_d[0]
   }
    
    // Configurating the tableview
    func ConfigureCellView() {
        moviesTableView.rowHeight = UITableView.automaticDimension
        moviesTableView.estimatedRowHeight = 200
    }
  
      
}

//MARK:-  Filtering movies depending on users search
extension MainViewController {
       var isfiltered : Bool {
           return searchcontroller.isActive  && !isfilteredEmpty
       }
       var isfilteredEmpty : Bool {
           return searchcontroller.searchBar.text?.isEmpty ?? true
       }
}

//MARK:- filtering
extension MainViewController {
    func filteredMovies (for searchtext: String ) {
        filteredMovs = movies.filter { movie in
            return movie.title.lowercased().contains(searchtext.lowercased())
        }
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func getStrings (for genre_ids : [Int]? ) -> String {
        guard let genre = genre_ids else {return ""}
        var genre_stringed : String = ""
        for val in genre {
           genre_stringed += ( " " + String(val))
        }
        return genre_stringed
    }
}

