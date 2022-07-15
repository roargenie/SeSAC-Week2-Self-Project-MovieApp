//
//  ViewController.swift
//  SeSAC Week2 Self Project MovieApp
//
//  Created by 이명진 on 2022/07/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var moviesArray: [Movie] = [
        
    
    
    
    
    
    ]

    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 대리자 설정
        homeTableView.dataSource = self
        
        
        navigationController?.hidesBarsOnSwipe = true
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    

    
    
    
    
    
    
    
    
}

