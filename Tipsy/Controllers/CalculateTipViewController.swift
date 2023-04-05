//
//  ViewController.swift
//  Tipsy
//
//  Created by Faiza Nawaz on 03/04/2023.
//

import UIKit

class CalculateTipViewController: UIViewController {
    
    @IBOutlet weak var tfTotalBill: UITextField!
    @IBOutlet weak var lbSplitCount: UILabel!
    @IBOutlet weak var btTwentyPercent: UIButton!
    @IBOutlet weak var btTenPercent: UIButton!
    @IBOutlet weak var btZeroPercent: UIButton!
    
    var percentageSelected:Int = 10
    var tipModel: TipsyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Action methods
    @IBAction func updateCount(_ sender: UIStepper) {
        
        lbSplitCount.text = String(Int(sender.value))
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        
        var percentage = sender.titleLabel?.text
        percentage = percentage?.replacingOccurrences(of: "%", with: "")
        
        if (percentage == "" || percentage == String(percentageSelected)) {
            return
        }
        
        let isSelected = sender.isSelected
        resetPercentageButtons()
        percentageSelected = Int(percentage ?? "0") ?? 0
        
        sender.isSelected = !isSelected
    }
    
    private func resetPercentageButtons() {
        btTenPercent.isSelected = false
        btTwentyPercent.isSelected = false
        btZeroPercent.isSelected = false
    }
    
    @IBAction func calculateBill(_ sender: UIButton) {
        
        let totalMembers = lbSplitCount.text ?? "1"
        var totalBill = Double(tfTotalBill.text ?? "0.0")
        let tipAmount = totalBill! * (Double(percentageSelected)/100)
        totalBill = totalBill! + tipAmount
        
        let billPerPerson = totalBill!/(Double(totalMembers) ?? 1.0)

        tipModel = TipsyModel(tip: String(percentageSelected),
                              members: totalMembers,
                              bill: String(format: "%.2f", billPerPerson))
        
    }
    
    
    //MARK: - Segue methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showBill" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipModel = tipModel
        }
        
    }
    
}

