//
//  FWFallingWordsRootViewController.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import UIKit

class FWFallingWordsRootViewController: UIViewController {

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions

    @IBAction func startButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: .gameViewSegue, sender: nil)
    }
}

// MARK: - Navigation

extension FWFallingWordsRootViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case gameViewSegue
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segueIdentifierForSegue(segue: segue) {
        case .gameViewSegue:
            // Pass data if needed
            break
        }
    }
}
