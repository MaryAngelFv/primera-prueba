//
//  ViewController.swift
//  primera-prueba
//
//  Created by Brayam Mora on 13/06/22.
//

import UIKit
import Alamofire

class UsersViewController: UIViewController {
    
    @IBOutlet weak var UsersTableView: UITableView!
    
    private var arrayUsers: [User] = []
    private let urlBase = "https://jsonplaceholder.typicode.com/"
    private let endpointGetUsers = "users"
    let searchController = UISearchController(searchResultsController: nil)
    var filteredUsers: [User] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }

    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Buscar"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true

    }
    
    private func configureTableView() {
        UsersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        UsersTableView.dataSource = self
    }
    
    private func getData() {
        let completeUrl = "\(urlBase)\(endpointGetUsers)"
        AF.request(completeUrl).responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let users):
                self.arrayUsers = users
                self.UsersTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
      filteredUsers = arrayUsers.filter { (user: User) -> Bool in
        return user.name.lowercased().contains(searchText.lowercased())
      }
      
      UsersTableView.reloadData()
    }


}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
      if isFiltering {
        return filteredUsers.count
      }
        
      return arrayUsers.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user: User
        if isFiltering {
            user = filteredUsers[indexPath.row]
        } else {
            user = arrayUsers[indexPath.row]
        }
        cell.configure(user.name, user.phone, user.email)
        return cell
    }

}

extension UsersViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      filterContentForSearchText(searchBar.text!)

  }
}



