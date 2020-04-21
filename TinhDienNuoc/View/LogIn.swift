//
//  LogIn.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/3/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import UIKit
import RealmSwift
//let realm = try! Realm()

class LogIn: UIViewController {
    //outlet
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var passWordTf: UITextField!
    @IBOutlet weak var loginBt: UIButton!
    @IBOutlet weak var signUpBt: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        


        loginBt.layer.cornerRadius = 20
        signUpBt.layer.cornerRadius = 20

        
    }
    
    //action
    @IBAction func signupActBt(_ sender: Any) {
        navigateToSignUp()
    }
    
    @IBAction func loginActBt(_ sender: Any) {
        if checkAccount(un: userNameTf.text!,pw: passWordTf.text!) {
            navigateToCalculate()
        } else {
            let alert = UIAlertController(title: "Error", message: "Incorrect password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Retype", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    private func navigateToSignUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil )
        guard let vc = sb.instantiateViewController(withIdentifier: "SignUp") as? SignUp else {
            return
        }
        present(vc,animated:true,completion:nil)

    }
    
    private func navigateToCalculate(){
        let sb = UIStoryboard(name: "Main", bundle: nil )
        guard let vc = sb.instantiateViewController(withIdentifier: "Calculate") as? Calculate else {
            return
        }
        vc.name = userNameTf.text!
//        present(vc,animated:true,completion:nil)
        navigationController?.pushViewController(vc, animated: true)

    }
    
    private func checkAccount(un: String,pw: String)-> Bool {
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        let cus = realm.objects(Customer.self).filter("userName =='\(un)'")
        if cus.count == 1 {
            if cus[0].passWord == pw {
                return true
            }
        }
        return false
    }

//    func deleteAll() {
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
//    }

    
    
}
