//
//  ViewController.swift
//  Login
//
//  Created by Марина Журавлева on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // MARK: - Properties
    
    private var email: String = ""
    private var password: String = ""
    private var mockEmail = "abc@mail.com"
    private var mockPassword = "123456"
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        emailText.delegate = self
        passwordText.delegate = self
        emailText.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction private func loginAction(_ sender: Any) {
        emailText.resignFirstResponder()
        passwordText.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailText)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordText)
        }
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong password or e-mail".localized, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction private func signupAction(_ sender: Any) {
        print("Signup")
    }
    
    // MARK: - Private methods
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowColor = (UIColor(named: "priceColor") ?? UIColor.gray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray3
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !text.isEmpty else { return }
        switch textField {
        case emailText:
            let isValidEmail = check(email: text)
            loginButton.isUserInteractionEnabled = isValidEmail
            loginButton.backgroundColor = isValidEmail ? UIColor(named: "priceColor") : .systemGray5
            
            if isValidEmail {
                email = text
                emailImageView.tintColor = .systemGray3
                emailView.backgroundColor = .systemGray3
            } else {
                makeErrorField(textField: textField)
            }
        case passwordText:
            let isValidPassword = check(password: text)
            loginButton.isUserInteractionEnabled = isValidPassword
            loginButton.backgroundColor = isValidPassword ? UIColor(named: "priceColor") : .systemGray5
            
            if isValidPassword {
                password = text
                passwordImageView.tintColor = .systemGray3
                passwordView.backgroundColor = .systemGray3
            } else {
                makeErrorField(textField: textField)
            }
        default:
            print("Unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailText:
            emailImageView.tintColor = .systemRed
            emailView.backgroundColor = .systemRed
        case passwordText:
            passwordImageView.tintColor = .systemRed
            passwordView.backgroundColor = .systemRed
        default:
            print("Unknown textField")
        }
    }
}
