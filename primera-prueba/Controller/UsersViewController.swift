//
//  ViewController.swift
//  primera-prueba
//
//  Created by Brayam Mora on 13/06/22.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var UsersTableView: UITableView!
    
    private var arrayUsers: [User] = []
    
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
        arrayUsers = [
            User(
                id: 1,
                name: "Pepe",
                username: "Pepito",
                email: "pepe12@jijojo",
                adress: Adress(
                    street: "3",
                    suite: "f",
                    city: "lolo",
                    zipcode: "00090",
                    geo: Geo(
                        lat: "0.987",
                        long: "89.76"
                    )
                ),
                phone: "342546",
                website: "",
                company: Company(
                    name: "pepelol",
                    catchPhrase: "jijij",
                    bs: "hsudu"
                )
            ),
            User(
                id: 2,
                name: "Juan",
                username: "Pepito",
                email: "juan12@jijojo",
                adress: Adress(
                    street: "3",
                    suite: "f",
                    city: "lolo",
                    zipcode: "00090",
                    geo: Geo(
                        lat: "0.987",
                        long: "89.76"
                    )
                ),
                phone: "0986543",
                website: "",
                company: Company(
                    name: "pepelol",
                    catchPhrase: "jijij",
                    bs: "hsudu"
                )
            ),
            User(
                id: 1,
                name: "Maria",
                username: "Pepito",
                email: "maria20@jijojo",
                adress: Adress(
                    street: "3",
                    suite: "f",
                    city: "lolo",
                    zipcode: "00090",
                    geo: Geo(
                        lat: "0.987",
                        long: "89.76"
                    )
                ),
                phone: "78654098",
                website: "",
                company: Company(
                    name: "pepelol",
                    catchPhrase: "jijij",
                    bs: "hsudu"
                )
            )
        ]
        
        UsersTableView.reloadData()
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


