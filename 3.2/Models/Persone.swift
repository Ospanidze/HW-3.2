//
//  Persone.swift
//  3.2
//
//  Created by Айдар Оспанов on 21.03.2023.
//

struct Persone {
    
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var location: String
    var image: String
    var created: String
    
    static func getPersones(heroes: Hero) -> [Persone]? {
        var persones: [Persone] = []
        heroes.results.forEach { hero in
            let persone = Persone(
                name: hero.name,
                status: hero.status.rawValue,
                species: hero.species.rawValue,
                type: hero.type,
                gender: hero.gender.rawValue,
                location: hero.location.name,
                image: hero.image,
                created: hero.created
            )
            
            persones.append(persone)
        }
        return persones
    }
    
}
