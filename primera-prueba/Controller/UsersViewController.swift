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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
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
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = arrayUsers[indexPath.row]
        cell.configure(user.name, user.phone, user.email)
        return cell
    }
    
    
}


