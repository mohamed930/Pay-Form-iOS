//
//  PickProductViewController.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/1/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class PickProductViewController: UIViewController {
    
    var pickview : PickProductView! {
        guard isViewLoaded else {return nil}
        return (view as! PickProductView)
    }
    
    var AmountCount:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        pickview.CountAmount.layer.backgroundColor = UIColor.white.cgColor
        if pickview.CountAmount.text! == "--" {
            AmountCount = nil
        }
        else {
            AmountCount = Int(pickview.CountAmount.text!)
        }
    }
    
    @IBAction func BTNAdd (_ sender:Any) {
        
        if AmountCount == nil {
            AmountCount = 1
            pickview.CountAmount.text = "1"
            pickview.finalPrice.text = "Price : \(1 * 13)$"
        }
        else {
            pickview.CountAmount.text = "\(Int(pickview.CountAmount.text!)! + 1)"
            pickview.finalPrice.text = "Price : \(Int(pickview.CountAmount.text!)! * 13)$"
        }
    }
       
    @IBAction func BTNMinus (_ sender:Any) {
        if pickview.CountAmount.text! == "--" {
            AmountCount = 0
            pickview.CountAmount.text = "0"
            pickview.finalPrice.text = "Price : 0$"
        }
        else if Int(pickview.CountAmount.text!)! < 0 {
            pickview.CountAmount.text = "0"
            pickview.finalPrice.text = "Price : 0$"
        }
        else {
            pickview.CountAmount.text = "\(Int(pickview.CountAmount.text!)! - 1)"
            pickview.finalPrice.text = "Price : \(Int(pickview.CountAmount.text!)! * 13)$"
        }
    }
    
    @IBAction func BTNPay() {
        let story : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let next = story.instantiateViewController(withIdentifier: "PayPage") as! PayPageViewController
        next.modalPresentationStyle = .fullScreen
        
        self.present(next, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
