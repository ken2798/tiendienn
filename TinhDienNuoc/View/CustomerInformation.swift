//
//  CustomerInformation.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/12/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class CustomerInformation : UIViewController {
    var accout : String = ""
    @IBOutlet weak var fullNameTf: UITextField!
    @IBOutlet weak var ageTf: UITextField!
    @IBOutlet weak var addressTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    
    override func viewDidLoad() {
        let realm = try! Realm()
        let currentCustomer = realm.objects(Customer.self).filter("userName == '\(accout)'")
        fullNameTf.text = currentCustomer[0].name
        ageTf.text = currentCustomer[0].age
        addressTf.text = currentCustomer[0].address
        phoneTf.text = currentCustomer[0].phoneNumber
        super.viewDidLoad()
        
        
    }
    
    @IBAction func updateAct(_ sender: Any) {
        
        updateInfo(accout: accout , name: fullNameTf.text! , age: ageTf.text!, address: addressTf.text!, phone: phoneTf.text!)
        
        navigateToCalculate()
    }
    
    func updateInfo(accout: String, name: String , age: String, address: String, phone: String){
        let realm = try! Realm()
        let currentCustomer = realm.objects(Customer.self).filter("userName == '\(accout)'")
        try! realm.write {
            currentCustomer[0].name = name
            currentCustomer[0].age = age
            currentCustomer[0].address = address
            currentCustomer[0].phoneNumber = phone
        }
    }
    private func navigateToCalculate(){
        let sb = UIStoryboard(name: "Main", bundle: nil )
        guard let vc = sb.instantiateViewController(withIdentifier: "Calculate") as? Calculate else {
            return
        }
        
//        navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.popViewController(animated: true)
        
    }
}
