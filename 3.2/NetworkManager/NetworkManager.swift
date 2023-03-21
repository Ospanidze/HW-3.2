//
//  NetworkManager.swift
//  3.2
//
//  Created by Айдар Оспанов on 21.03.2023.
//

import Foundation

class NetworkManager {
    
    private let apikey = "https://rickandmortyapi.com/api/character"
    
    func fetchPesone(completionHandler: @escaping([Persone]) -> Void) {
        guard let url = URL(string: apikey) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            //print(String(data: data, encoding: .utf8)!)
            if let persone = self.parseJSON(withData: data) {
                completionHandler(persone)
            }
        }.resume()
    }
    
    func parseJSON(withData data: Data) -> [Persone]? {
        let decoder = JSONDecoder()
        
        do {
            let heroData = try decoder.decode(Hero.self, from: data)
            guard let persone = Persone.getPersones(heroes: heroData) else {
                return nil
            }
            return persone
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
