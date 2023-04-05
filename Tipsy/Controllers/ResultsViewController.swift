//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Faiza Nawaz on 05/04/2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var lbTotalBill: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    
    var tipModel: TipsyModel?
    var totalMembers = 1
    var totalTip = 0
    
    override func viewDidLoad() {
        
        updateUI()
    }
    
    func updateUI() {
        lbTotalBill.text = tipModel?.bill ?? "0"
        lbDetail.text = "Split between \(tipModel!.members) people with \(tipModel!.tip)% tip"
    }
    
    @IBAction func recalculateTip(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
