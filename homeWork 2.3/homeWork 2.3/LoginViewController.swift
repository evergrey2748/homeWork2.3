//
//  ViewController.swift
//  homeWork 2.3
//
//  Created by Артур Ким on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var clickButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickButton.addTarget(self, action: #selector(enterData), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        nameText.delegate = self
        passText.delegate = self
    }

    @IBAction func enterData() {
        if nameText.text == "" {
            let alert = UIAlertController(title: "Ошибка!",
                                          message: "Введите логин!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if passText.text == "" {
            let alert = UIAlertController(title: "Ошибка!",
                                          message: "Введите пароль",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default))
            self.present(alert, animated: true, completion: nil)
        } else if nameText.text != "User" || passText.text != "Password" {
            let alert = UIAlertController(title: "Ошибка!",
                                          message: "Неверый логин или пароль.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",
                                          style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "LoginViewController", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? WelcomeViewController else { return }
        destination.name = "User"
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
           nameText.text = ""
           passText.text = ""
       }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide() {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
    }
        
    @IBAction private func showUserName() {
        let userName = UIAlertController(title: "Oops",
                                         message: "Your name is User",
                                         preferredStyle: .alert)
        userName.addAction(UIAlertAction(title: "Ok",
                                         style: .default))
        self.present(userName, animated: true, completion: nil)
    }
    
    @IBAction private func showUserPassword() {
        let userPassword = UIAlertController(title: "Oops",
                                         message: "Your password is Password",
                                         preferredStyle: .alert)
        userPassword.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(userPassword, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            nameText.resignFirstResponder()
            passText.becomeFirstResponder()
        } else if textField.returnKeyType == .done {
            passText.resignFirstResponder()
            self.enterData()
        }
        textField.resignFirstResponder()
        return true
    }
    
}



