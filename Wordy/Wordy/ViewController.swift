//
//  ViewController.swift
//  Wordy
//
//  Created by Andreas Gjaerum on 04/10/2021.
//

import UIKit

class ViewController: UIViewController {
    var networkModel: NetworkModel? = nil

    @IBOutlet var headingLabel: UILabel!

    @IBAction func wordButtonTapped(_ sender: Any) {
        networkModel?.getWord()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate: WordDelegate = self
        networkModel = NetworkModel(delegate: delegate)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WordTableViewController,
           let orignalWordyWords = UserDefaults.standard.array(forKey: "wordyWords"),
           let orignalWordyWords = orignalWordyWords as? [String] {
                destination.wordList = orignalWordyWords
        }
    }
}

extension ViewController: WordDelegate {
    func showWord(_ word: String) {
        let userDefaults = UserDefaults.standard

        if let orignalWordyWords = userDefaults.array(forKey: "wordyWords"), var orignalWordyWords = orignalWordyWords as? [String] {
            orignalWordyWords.append(word)
            userDefaults.set(orignalWordyWords, forKey: "wordyWords")
        } else {
            userDefaults.set([word], forKey: "wordyWords")
        }

        DispatchQueue.main.async {
            self.headingLabel.text = word
        }
    }
}

