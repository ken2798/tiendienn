//
//  Calculate.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/9/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Calculate : UIViewController {
    var name : String = ""
    @IBOutlet weak var customerAcc: UILabel!
    @IBOutlet weak var customerID: UITextField!
    @IBOutlet weak var kWh: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var tableCost: UIImageView!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerAcc.text = name
    }
    
    @IBAction func Update(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "CustomerInformation") as? CustomerInformation else {
            return 
        }
        vc.accout = name
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func getKWH(_ sender: Any) {
        print(name)
        let realm = try! Realm()
        realm.refresh()
        let cus = realm.objects(Customer.self).filter("userName == '\(name)'")
        customerID.text = cus[0].id
        kWh.text = cus[0].kWh
    }
    
    @IBAction func exChange(_ sender: Any) {
        let KWH = (kWh.text! as NSString).floatValue
        price.text = CalculateController(kWh: KWH).description
        level.text = LevelController(kWh: KWH)
        let realm = try! Realm()
        let cus = realm.objects(Customer.self).filter("userName == '\(name)'")
        if cus[0].isCompleted == true {
            status.text = "Status: Completed"
        } else {
            status.text = "Status: Uncompleted"
        }
    }
    
    @IBAction func pay(_ sender: Any) {
    }
    
    
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
