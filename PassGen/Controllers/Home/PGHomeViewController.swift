//
//  PGHomeViewController.swift
//  PassGen
//
//  Created by Maxime Le Coat on 30/12/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import UIKit
import GMStepper

final class PGHomeViewController: UIViewController {

    // MARK: - Global

    // MARK: - Privates
    private var passwordManager: PasswordManager?
    private var pasteboardAlert: UIAlertController?
    
    private enum Constants {

        /// Stepper Value = 12.0
        static let stepperValue: Double = 12.0
    }
    
    // MARK: - IBOutlet
    
    /* Length */
    @IBOutlet private weak var lengthLabel: UILabel!
    @IBOutlet private weak var lengthStepper: GMStepper!
    
    /* Symbols */
    @IBOutlet private weak var symbolsLabel: UILabel!
    @IBOutlet private weak var symbolsSwitch: UISwitch!
    
    /* Numbers */
    @IBOutlet private weak var numbersLabel: UILabel!
    @IBOutlet private weak var numbersSwitch: UISwitch!
    
    /* letters */
    @IBOutlet private weak var lettersLabel: UILabel!
    @IBOutlet private weak var lettersSwitch: UISwitch!
    
    /* Result */
    @IBOutlet private weak var resultButton: UIButton!
    
    // MARK: - Application Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        logger.info("\(self)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.generatePassword()
    }
}

// MARK: - Configurations Setup
extension PGHomeViewController {

    private func setup() {
        self.setupNavigationBar()
        self.setupPasswordManager()
        self.setupOptionViews()
        self.setupButtons()
        self.setupPasteboardAlertController()
    }

    private func setupNavigationBar() {
        self.title = L10n.Pghomeviewcontroller.title

        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .automatic
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        let refreshBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(generatePassword))
        self.navigationItem.rightBarButtonItem = refreshBarButtonItem
    }
    
    private func setupPasswordManager() {
        self.passwordManager = PasswordManager(attributes: [.symbols, .numbers, .letters], with: Int(Constants.stepperValue))
    }
    
    private func setupButtons() {
        self.resultButton.titleLabel?.applyDefaultSetup(with: nil)
        self.resultButton.addTarget(self, action: #selector(userDidTapResultButton), for: .touchDown)
    }
    
    private func setupPasteboardAlertController() {
        self.pasteboardAlert = UIAlertController(title: L10n.Pghomeviewcontroller.Alert.title,
                                                 message: L10n.Pghomeviewcontroller.Alert.subtitle)
        
        // Copy action
        let copyToPasteBoardAction: UIAlertAction = UIAlertAction(title: L10n.Common.confirm) { _ in
            UIPasteboard.general.string = self.resultButton.titleLabel?.text
        }
        
        // Close action
        let closeAction: UIAlertAction = UIAlertAction(title: L10n.Common.close, style: .destructive, handler: nil)

        // Attach actions
        self.pasteboardAlert?.addActions(copyToPasteBoardAction, closeAction)
    }
}

// MARK: - Options setup
extension PGHomeViewController {
    
    private func setupOptionViews() {
        self.setupLengthViews()
        self.setupLetterViews()
        self.setupNumberViews()
        self.setupSymbolViews()
    }
    
    private func setupLengthViews() {
        self.lengthLabel.applyDefaultSetup(with: L10n.Pghomeviewcontroller.length)
        self.setupStepper()
    }
    
    private func setupSymbolViews() {
        self.symbolsLabel.applyDefaultSetup(with: L10n.Pghomeviewcontroller.symbols)
        self.symbolsSwitch.applyDefaultSetup(action: #selector(switchDidChange(sender:)))
    }
    
    private func setupNumberViews() {
        self.numbersLabel.applyDefaultSetup(with: L10n.Pghomeviewcontroller.numbers)
        self.numbersSwitch.applyDefaultSetup(action: #selector(switchDidChange(sender:)))
    }
    
    private func setupLetterViews() {
        self.lettersLabel.applyDefaultSetup(with: L10n.Pghomeviewcontroller.letters)
        self.lettersSwitch.applyDefaultSetup(action: #selector(switchDidChange(sender:)))
    }
    
    private func setupStepper() {
        self.lengthStepper.value = Constants.stepperValue
        self.lengthStepper.labelFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        self.lengthStepper.addTarget(self, action: #selector(stepperDidChange), for: .valueChanged)
    }
}

// MARK: - Actions
extension PGHomeViewController {

    @objc
    private func generatePassword() {
        self.resultButton.setTitle(self.passwordManager?.password, for: .normal)
    }
    
    @objc
    private func stepperDidChange() {
        self.passwordManager?.length = Int(self.lengthStepper.value)
        self.generatePassword()
    }
    
    @objc
    private func switchDidChange(sender: UISwitch) {
        switch sender {
        case self.symbolsSwitch:
            self.passwordManager?.updateAttribute(.symbols, state: sender.isOn)
        case self.numbersSwitch:
            self.passwordManager?.updateAttribute(.numbers, state: sender.isOn)
        case self.lettersSwitch:
            self.passwordManager?.updateAttribute(.letters, state: sender.isOn)
        default:
            break
        }
        
        self.generatePassword()
    }
    
    @objc
    private func userDidTapResultButton() {
        guard let pasteboardAlert = self.pasteboardAlert else {
            logger.error("Failed to get pasteboardAlert instance.")
            return
        }
        self.present(pasteboardAlert)
    }
}
