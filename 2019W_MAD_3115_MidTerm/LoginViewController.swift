//
//  ViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swRememberMe: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtEmail.text = email
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
            }
            
            swRememberMe.isOn = true
        }
        else
        {
            swRememberMe.isOn = false
        }
    }

    @IBAction func btnSignInClick(_ sender: Any) {
        let email = txtEmail.text
        let pwd = txtPassword.text
        if ((txtEmail.text?.isEmpty)!) || ((txtPassword.text?.isEmpty)!) {
            //Alert can't be Empty
            displayMessage(userMessage: "Fields Can't be Empty")
            return
        }
        
        
        if (email == "admin@admin.com" && pwd == "admin@123"){
            let userDefault = UserDefaults.standard
            if(swRememberMe.isOn)
            {
                //Store Data to User Default Storage
                userDefault.set(email, forKey: "userEmail")
                userDefault.set(pwd, forKey: "userPassword")
                
            }else
            {
               //Remove UserId/Password if previously remembered/stored
                userDefault.removeObject(forKey: "userEmail")
                userDefault.removeObject(forKey: "userPassword")
            }
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let studVC = sb.instantiateViewController(withIdentifier: "studVC") as! StudentEntryViewController
            //self.navigationController?.pushViewController(studVC, animated: true)
            self.present(studVC, animated: true)
           
            
        }else{
            displayMessage(userMessage: "Invalid Email or Password")
        }
        
        
    }
    
    
    func displayMessage(userMessage: String) -> Void {
            let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default){ (action:UIAlertAction!) in }
            alert.addAction(OKAction)
            self.present(alert, animated: true)
    }

}

