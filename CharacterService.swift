//
//  CharacterService.swift
//  TheBigBigProblem
//
//  Created by Assem on 4/12/20.
//  Copyright © 2020 Assem. All rights reserved.
//

import Foundation

class CharacterService {
    static let shared = CharacterService()

      func DownloadCharacters(pageNum: String, completion: @escaping (DownloadCharacterResponse) -> Void) {
              guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page="+pageNum) else { return }
              
              var request = URLRequest(url: url)
              request.httpMethod = "GET"
              
              let task = URLSession.shared.dataTask(with: request) { data, response, error in
                  guard let data = data else {
                      if let error = error {
                          print(error)
                      }
                      return
                  }
                  do {
                      let decoder = JSONDecoder()
                      let response = try decoder.decode(DownloadCharacterResponse.self, from: data)
                      
                      
                      DispatchQueue.main.async {
                          completion(response)
                      }
                  } catch {
                      print(error)
                  }
          }
              task.resume()
      }
      
      
      
      class DownloadCharacterResponse : Codable {
          var characters: [Character]
          
          enum CodingKeys: String, CodingKey {
              case characters = "results"
          }
      }
}
