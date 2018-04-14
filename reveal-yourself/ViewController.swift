//
//  ViewController.swift
//  reveal-yourself
//
//  Created by Parminder Kaur on 2018-04-14.
//  Copyright © 2018 Parminder Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var emaildText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle email id and password text fields' user input through delegate callbacks
        emaildText.delegate = self
        passwordText.delegate = self
        
        updateLoginButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emaildText {
            passwordText.becomeFirstResponder()
        }
        if textField == passwordText {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emaildText {
            emaildText.text = textField.text
        } else if textField == passwordText {
            passwordText.text = textField.text
        }
    }
    
    // MARK: Actions
    @IBAction func emailTextChanged(_ sender: UITextField) {
        updateLoginButtonState()
    }
    
    @IBAction func passwordTextChanged(_ sender: UITextField) {
        updateLoginButtonState()
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        passwordText.resignFirstResponder()
        emaildText.resignFirstResponder()
        if emaildText.text == "parminder" && passwordText.text == "hello"{
            
            let alert = UIAlertController(title: "Success!",
                                          message: "You have successfully logged in.",
                                          preferredStyle: .alert)
            
            let alertaction = UIAlertAction(title: "OK",
                                            style: .default)
            
            alert.addAction(alertaction)
            
            present(alert, animated: true, completion: nil)
        }
        else{
            emaildText.text = ""
            passwordText.text = ""
        }
    }
    
    @IBAction func doSignUp(_ sender: UIButton) {
        emaildText.text = ""
        passwordText.text = ""
        emaildText.becomeFirstResponder()
    }
    
    // MARK: Private methods
    
    private func updateLoginButtonState() {
        // Disable the login button if the email or password fields are empty
        loginButton.isEnabled = isAllRequiredTextFieldsChanged()
    }
    
    private func isAllRequiredTextFieldsChanged() -> Bool {
        let email = emaildText.text ?? ""
        let password = passwordText.text ?? ""
        return !(email.isEmpty || password.isEmpty)
    }
}

