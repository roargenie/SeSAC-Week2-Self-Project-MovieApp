//
//  ThridViewController.swift
//  SeSAC Week2 Self Project MovieApp
//
//  Created by 이명진 on 2022/07/15.
//

import UIKit

class ThridViewController: UIViewController, UISearchControllerDelegate {
    
    var moviesArray: [Movie] = [
        Movie(movieImage: UIImage(named: "7번방의선물.png"), movieName: "7번방의선물"),
        Movie(movieImage: UIImage(named: "겨울왕국2.png"), movieName: "겨울왕국2"),
        Movie(movieImage: UIImage(named: "광해.png"), movieName: "광해"),
        Movie(movieImage: UIImage(named: "괴물.png"), movieName: "괴물"),
        Movie(movieImage: UIImage(named: "국제시장.png"), movieName: "국제시장"),
        Movie(movieImage: UIImage(named: "극한직업.png"), movieName: "극한직업"),
        Movie(movieImage: UIImage(named: "도둑들.png"), movieName: "도둑들"),
        Movie(movieImage: UIImage(named: "명량.png"), movieName: "명량"),
        Movie(movieImage: UIImage(named: "베테랑.png"), movieName: "베테랑"),
        Movie(movieImage: UIImage(named: "부산행.png"), movieName: "부산행"),
        Movie(movieImage: UIImage(named: "신과함께인과연.png"), movieName: "신과함께인과연"),
        Movie(movieImage: UIImage(named: "신과함께죄와벌.png"), movieName: "신과함께죄와벌"),
        Movie(movieImage: UIImage(named: "아바타.png"), movieName: "아바타"),
        Movie(movieImage: UIImage(named: "알라딘.png"), movieName: "알라딘"),
        Movie(movieImage: UIImage(named: "암살.png"), movieName: "암살"),
        Movie(movieImage: UIImage(named: "어벤져스엔드게임.png"), movieName: "어벤져스엔드게임"),
        Movie(movieImage: UIImage(named: "왕의남자.png"), movieName: "왕의남자"),
        Movie(movieImage: UIImage(named: "태극기휘날리며.png"), movieName: "태극기휘날리며"),
        Movie(movieImage: UIImage(named: "택시운전사.png"), movieName: "택시운전사"),
        Movie(movieImage: UIImage(named: "해운대.png"), movieName: "해운대")
        
    ]
    
    var filteredArr: [String] = []
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
        
    }
    
    @IBOutlet weak var thirdTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchController()
        
        
        
        
            
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = true
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    func setupTableView() {
        self.thirdTableView.delegate = self
        self.thirdTableView.dataSource = self
        self.thirdTableView.rowHeight = 80
    }
    

    
}


extension ThridViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let movie = moviesArray.map { $0.movieName }
        
        return self.isFiltering ? self.filteredArr.count : movie.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = thirdTableView.dequeueReusableCell(withIdentifier: "ThirdMovieCell", for: indexPath) as! SearchTableViewCell
        
        let movie = moviesArray[indexPath.row]
        
//        cell.movieImageView.image = movie.movieImage
//        cell.movieNameLabel.text = movie.movieName
//        cell.movieNameLabel?.text = movie.movieName
        
        if self.isFiltering {
            cell.movieNameLabel?.text = self.filteredArr[indexPath.row]
            cell.movieImageView.image = movie.movieImage
        } else {
            cell.movieImageView.image = movie.movieImage
            cell.movieNameLabel?.text = movie.movieName
        }
        
        
        return cell
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        self.filteredArr = self.moviesArray.map({ movie in
            String(movie.movieName)
        }).filter { $0.lowercased().contains(text) }
        
        self.thirdTableView.reloadData()
    }
       
}
