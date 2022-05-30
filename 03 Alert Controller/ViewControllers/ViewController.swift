//
//  ViewController.swift
//  03 Alert Controller
//
//  Created by Евгений Бияк on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - VC Life Cycle
    override func viewDidLoad() {
        helloLabel.text = ""
        resultLabel.text = ""
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showWelcomeAlert()
    }
    
    // MARK: - Actions
    @IBAction func addButtonPressed() {
        let alert = addAlert()
        self.present(alert, animated: true)
    }
    @IBAction func guessButtonPressed() {
        let alert = guessAlert()
        self.present(alert, animated: true)
    }
    @IBAction func palindromeButtonPressed() {
        let palindromeVC = PalindromeViewController()
        show(palindromeVC, sender: nil)
    }
    
    // MARK: - Help methods
    private func showWelcomeAlert() {
        let alert = UIAlertController(title: "Hello", message: "Write your name", preferredStyle: .alert)
        alert.addTextField {$0.placeholder = "Name"}
        let action = UIAlertAction(title: "OK", style: .default) { [unowned self] _ in
            let textFromField = alert.textFields?[0].text ?? ""
            if textFromField.isEmpty {
                showWelcomeAlert()
            } else {
                updateLabel(helloLabel, with: "Hi, \(textFromField.capitalized)")
                updateLabel(resultLabel, with: "What do you want to do?")
            }
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func addAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Add two numbers", message: nil, preferredStyle: .alert)
        alert.addTextField {$0.placeholder = "Integer"}
        alert.addTextField {$0.placeholder = "Integer"}
        let action = UIAlertAction(title: "Result", style: .default) { [unowned self] _ in
            let field1 = alert.textFields?[0].text ?? ""
            let field2 = alert.textFields?[1].text ?? ""
            guard let num1 = Int(field1), let num2 = Int(field2) else {
                updateLabel(resultLabel, with: "Enter an Integer")
                return
            }
            let sum = num1 + num2
            updateLabel(resultLabel, with: "\(field1) + \(field2) = \(sum)")
        }
        alert.addAction(action)
        return alert
    }
    
    private func guessAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Guess the number", message: "from 1 to 5", preferredStyle: .alert)
        alert.addTextField {$0.placeholder = "Integer"}
        let action = UIAlertAction(title: "Check my number", style: .default) { [unowned self] _ in
            let field = alert.textFields?[0].text ?? ""
            if Int(field) == (1...5).randomElement() {
                updateLabel(resultLabel, with: "Incredible! You're right")
            } else {
                updateLabel(resultLabel, with: "You didn't guess")
            }
        }
        alert.addAction(action)
        return alert
    }
    
    private func updateLabel(_ label: UILabel, with text: String) {
        label.text = text
    }
}
