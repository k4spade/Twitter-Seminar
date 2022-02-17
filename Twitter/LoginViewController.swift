//
//  LoginViewController.swift
//  Twitter
//
//  Created by Jamarious Beatty on 11/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
    }
    
    let myUrl = "https://api.twitter.com/oauth/request_token"
    
    @IBAction func onLoginButton(_ sender: Any) {
        Twitter.TwitterAPICaller.client?.login(url: myUrl, success: {
            
            UserDefaults.standard.setValue(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not log in.")
        })
    }
    
}
