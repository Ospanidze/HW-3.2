//
//  Welcome.swift
//  3.2
//
//  Created by Айдар Оспанов on 20.03.2023.
//

struct Hero: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let location: Location
    let image: String
    let created: String
    
    var description: String {
        """
        Name: \(name)
        Status: \(status)
        Gender: \(gender.rawValue)
        """
    }
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Decodable {
    let name: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
