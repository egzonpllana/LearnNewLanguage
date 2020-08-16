//
//  FWFallingWordsViewController.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import UIKit

class FWFallingWordsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var wrongButtonView: UIView!
    @IBOutlet weak var correctButtonView: UIRoundedView!
    @IBOutlet weak var wordToGuessLabel: UILabel!
    @IBOutlet weak var fallingWordLabel: UILabel!
    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var lifesCounterLabel: UILabel!
    @IBOutlet weak var pointsCounterLabel: UILabel!

    // MARK: - Properties


    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Methods


    // MARK: - Actions

    @IBAction func thumbsUpButton(_ sender: Any) {
        // TODO: handle given answer
        // TODO: bubble the button view
    }

    @IBAction func thumbsDownPressed(_ sender: Any) {
        // TODO: handle given answer
        // TODO: bubble the button view
    }

    @IBAction func exitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
