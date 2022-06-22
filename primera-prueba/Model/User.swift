//
//  User.swift
//  primera-prueba
//
//  Created by Brayam Mora on 13/06/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let adress: Adress
    let phone: String
    let website: String
    let company: Company
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case adress = "adress"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }
}

struct Adress: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
    
    enum CondingKeys: String, CodingKey {
        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }
    
}

struct Geo: Codable {
    let lat: String
    let long: String
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case long = "lng"
    }
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
    
    enum CondingKeys: String, CodingKey {
        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

}


