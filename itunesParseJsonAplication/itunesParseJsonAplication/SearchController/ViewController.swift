//
//  ViewController.swift
//  itunesParseJsonAplication
//
//  Created by Fedii Ihor on 18.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var timer: Timer?
    let network = NetworkLayer()
    
    private var datasource: [Track] = [] {
        didSet {
            table.reloadData()
            datasource.forEach{print($0.trackName)}
            
        }
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search "
         setupTableView()
         setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    
    private func setupTableView() {
        table.register(UINib(nibName: SearchCell.id, bundle: nil), forCellReuseIdentifier: SearchCell.id)
        table.dataSource = self
        table.delegate = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: SearchCell.id, for: indexPath) as! SearchCell
        cell.setupCell(by: datasource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            self.network.getTracks(by: searchText) {[weak self] result in
                switch result {
                    
                case .success(let res):
                    res.results.forEach { t in
                        print(t.trackName)
                    }
                    self?.datasource = res.results
                case .failure(let error):
                    print(error)
                    
                    self?.searchController.searchBar.text = ""
               }
            }
        }
    }
}
