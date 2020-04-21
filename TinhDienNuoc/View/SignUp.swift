//
//  SignUp.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/3/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit
import RealmSwift
import Foundation


class SignUp: UIViewController {
    //outlet
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var rePasswordTf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //act
    @IBAction func signupActBt(_ sender: Any) {
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        let realm = try! Realm()
        let newCustomer = Customer()
        newCustomer.userName = usernameTf.text!
        newCustomer.passWord = passwordTf.text!
        newCustomer.name = ""
        newCustomer.age = ""
        newCustomer.address = ""
        newCustomer.kWh = ""
        newCustomer.phoneNumber = ""
        
        if rePasswordTf.text != passwordTf.text {
            let alert = UIAlertController(title: "Error", message: "Incorrect password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Retype", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else
        {
            if checkCustomer(user: usernameTf.text! ){
                try! realm.write() {
                    realm.add(newCustomer)
                }
                let alert = UIAlertController(title: "Successful", message: "Sign Up Successfully", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
                    self.navigateToLogin()
                }))
                self.present(alert, animated: true, completion: nil)

            
            } else {
                let alert = UIAlertController(title: "Error", message: "Username existed", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    private func navigateToLogin() {
        let mSB = UIStoryboard(name: "Main", bundle: nil )
        guard let loginVC = mSB.instantiateViewController(withIdentifier: "LogIn") as? LogIn else {
            return
        }
        present(loginVC,animated:true,completion:nil)
//        navigationController?.pushViewController(loginVC, animated: true)
    }
}



func checkCustomer(user : String) -> Bool {
    let realm = try! Realm()
    let checkUser = realm.objects(Customer.self).filter("userName == '\(user)'")
    if checkUser.count > 0 {
        return false
    }
    return true
}


