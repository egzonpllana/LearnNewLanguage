//
//  FWFallingWordsViewController.swift
//  FallingWords
//
//  Created by Egzon Pllana on 8/16/20.
//  Copyright © 2020 Native Coders. All rights reserved.
//

import UIKit

class FWFallingWordsViewController: UIViewController, HasDependencies {

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

    private lazy var gameEngineService: GameEngineService = dependencies.gameEngineService()
    private var fallingWordYPossition: CGFloat = 0
    private var fallingWord: RandomWordViewModel? {
        didSet {

            // Make sure that falling word is not nill
            guard let wordToPresent = fallingWord else {
                return
            }

            // Finish previous falling animation
            finishFallignWordView()

            // Update labels text
            wordToGuessLabel.text = wordToPresent.englishWord
            fallingWordLabel.text = wordToPresent.spanishWord

            // Start falling animation after one second
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                guard let self = self else { return }
                self.startFallignWordView()
            }
        }
    }

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get New Word
        getNewWord()

        // Do any additional setup after loading the view.
    }

    // MARK: - Methods

    private func getNewWord() {
        gameEngineService.getRandomWord { (result) in
            switch result {
            case .success(let wordModel):
                self.fallingWord = wordModel
            case .failure(let error):
                self.fallingWord = nil
                // TODO: Handle alert view
                print(error.localizedDescription)
            }
        }
    }

    private func handleNoAnswer() {
        gameEngineService.handleNoAnswer { (result) in
            switch result {
            case .success(let gameResult):
                self.lifesCounterLabel.text = String(gameResult.lifes)
                self.pointsCounterLabel.text = String(gameResult.points)
                self.getNewWord()
            case .failure(let error):
                if error == .gameOver {
                     self.restartGame()
                } else if error == .wrongAnswer {
                    self.getNewWord()
                } else if error == .getRandomWordNotPossible {
                    print(error.errorDescription ?? "/")
                }
            }
        }
    }

    private func handleGivenAnswer(didAnswer answer: Bool) {
        guard let wordFalling = fallingWord else {
            assertionFailure()
            return
        }

        gameEngineService.handleUserAnswer(onWordModel: wordFalling, withAnswer: answer) { (result) in
            switch result {
            case .success(let gameResult):
                self.lifesCounterLabel.text = String(gameResult.lifes)
                self.pointsCounterLabel.text = String(gameResult.points)
                self.getNewWord()
            case .failure(let error):
                if error == .gameOver {
                     self.restartGame()
                } else if error == .getRandomWordNotPossible {
                    print(error.errorDescription ?? "/")
                }
            }
        }
    }

    private func restartGame() {
        // Finish current falling word view animations.
        self.finishFallignWordView()

        // Instantiate Alert View Controller.
        let alertController: UIAlertController = UIAlertController(title: GameOverAlertDetails.title.rawValue, message: GameOverAlertDetails.message.rawValue, preferredStyle: .alert)
        let restartAction: UIAlertAction = UIAlertAction(title: GameOverAlertDetails.restartText.rawValue, style: .default) { (_) in
            self.gameEngineService.restartGame { (result) in
                switch result {
                case .success(let gameResult):
                    self.lifesCounterLabel.text = String(gameResult.lifes)
                    self.pointsCounterLabel.text = String(gameResult.points)
                    self.getNewWord()
                case .failure(let error):
                    // TODO: Handle alert
                    print(error.localizedDescription)
                }
            }
        }

        let dontRestartAction: UIAlertAction = UIAlertAction(title: GameOverAlertDetails.cancelText.rawValue, style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
        }

        alertController.addAction(dontRestartAction)
        alertController.addAction(restartAction)

        self.present(alertController, animated: true, completion: nil)
    }

    private func startFallignWordView() {
        UIView.animateKeyframes(withDuration: 7, delay: 0.0, options: .beginFromCurrentState, animations: {

            if self.fallingWordYPossition == 0 {
                self.fallingWordYPossition = self.fallingWordLabel.frame.origin.y
            }

            self.fallingWordLabel.frame.origin.y+=self.animateView.frame.height-self.fallingWordLabel.frame.height
        },completion: { _ in
            if self.fallingWordLabel.frame.origin.y > self.animateView.frame.height-self.fallingWordLabel.frame.height {
                self.handleNoAnswer()
            }
        })
    }

    private func finishFallignWordView() {
        fallingWordLabel.layer.removeAllAnimations()
        fallingWordLabel.frame.origin.y = fallingWordYPossition
    }

    // MARK: - Actions

    @IBAction func thumbsUpButton(_ sender: Any) {
        handleGivenAnswer(didAnswer: true)
        correctButtonView.bubble()
    }

    @IBAction func thumbsDownPressed(_ sender: Any) {
        handleGivenAnswer(didAnswer: false)
        wrongButtonView.bubble()
    }

    @IBAction func exitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
