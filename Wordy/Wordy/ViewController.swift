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
}

extension ViewController: WordDelegate {
    func showWord(_ word: String) {
        DispatchQueue.main.async {
            self.headingLabel.text = word
        }
    }
}

