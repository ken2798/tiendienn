//
//  Bill.swift
//  TinhDienNuoc
//
//  Created by Nguyen Tien Cong on 3/20/20.
//  Copyright © 2020 Nguyen Tien Cong. All rights reserved.
//

import Foundation
import UIKit
class  Bill : UIViewController {
    @IBOutlet weak var customerLb: UILabel!
    @IBOutlet weak var timeLb: UILabel!
    @IBOutlet weak var kwhLb: UILabel!
    @IBOutlet weak var totalLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func payByCardAct(_ sender: Any) {
    }
    @IBAction func directPaymentAct(_ sender: Any) {
    }
}
