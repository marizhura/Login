//
//  ViewController.swift
//  Login
//
//  Created by Марина Журавлева on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var mailImageView: UIImageView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
        
        //Настройка кнопки Login
        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowColor = UIColor.systemGray.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginButton.layer.shadowOpacity = 0.8
        loginButton.layer.shadowRadius = 4
    }
    
    // MARK: - IBActions
    @IBAction private func loginAction(_ sender: Any) {
        performSegue(withIdentifier: "goToHomePage", sender: sender)
    }
    
    @IBAction private func signupAction(_ sender: Any) {
        print("Кнопка Signup here была нажата!")
    }
    
    // MARK: - Private methods
    private func setupLoginButton() {
        loginButton.layer.cornerRadius = 10
        loginButton.layer.shadowColor = (UIColor(named: "priceColor") ?? UIColor.gray).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        loginButton.layer.shadowOpacity = 0.4
        loginButton.layer.shadowRadius = 8
    }
}

