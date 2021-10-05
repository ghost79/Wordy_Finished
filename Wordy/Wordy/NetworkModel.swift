//
//  NetworkModel.swift
//  StoryboardConstraints
//
//  Created by Andreas Gjaerum on 04/10/2021.
//

import Foundation

class NetworkModel {
    var delegate: WordDelegate

    init(delegate: WordDelegate) {
        self.delegate = delegate
    }

    func getWord() {
        guard let url = URL(string: "https://random-word-api.herokuapp.com/word?number=1&swear=1") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
                // Handle network call error here
                return
            }

            guard let data = data else {
                // If there's no error and no data it's a weird world...
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String], let word = json.first {
                    print(word)
                    self.delegate.showWord(word)
                } else {
                    self.delegate.showWord("Placeholder")
                }
            } catch {
                print(error)
                // Handle JSON parse error here
            }
        }.resume()
    }
}
