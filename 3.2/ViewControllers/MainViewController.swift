//
//  ViewController.swift
//  3.2
//
//  Created by Айдар Оспанов on 20.03.2023.
//

import UIKit
import Foundation

final class MainViewController: UIViewController {
    
    private let apikey = "https://rickandmortyapi.com/api/character"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHero()
    }
}


private extension MainViewController {
    
    func fetchHero() {
        guard let url = URL(string: apikey) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let heroes = try decoder.decode(Hero.self, from: data)
                heroes.results.forEach { hero in
                    print(hero.description)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
