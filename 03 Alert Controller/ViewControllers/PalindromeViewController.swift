//
//  PalindromeViewController.swift
//  03 Alert Controller
//
//  Created by Евгений Бияк on 30.05.2022.
//

import UIKit

class PalindromeViewController: UIViewController {
    
    var titleLabel: UILabel!
    var resultLabel: UILabel!
    var textField: UITextField!
    var button: UIButton!
    
    let palindromChecker = PalindromChecker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        textField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func check() {
        guard let inputString = textField.text, !inputString.isEmpty else {
            resultLabel.text = "Write some string to text field"
            resultLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return
        }
        if palindromChecker.check(myString: inputString) {
            resultLabel.text = "String is a palindrome"
            resultLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            resultLabel.text = "String is not a palindrome"
            resultLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8490014487)

        // setup resultLabel
        resultLabel = UILabel()
        resultLabel.font = resultLabel.font.withSize(22)
        
        // setup titeLabel
        titleLabel = UILabel()
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = titleLabel.font.withSize(22)
        titleLabel.text = "Palindrome checker"
        
        // setup textField
        textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        textField.layer.cornerRadius = 15
        textField.contentVerticalAlignment = .center
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "Radar",
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
        )
        
        // setup button
        button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("Check", for: .normal)
        button.addTarget(nil, action: #selector(check), for: .touchUpInside)
        
        // add to Subview
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        view.addSubview(textField)
        view.addSubview(button)
        
        // constrains
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textField.heightAnchor.constraint(equalToConstant: 35),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
}

extension PalindromeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        check()
        return true
    }
}
