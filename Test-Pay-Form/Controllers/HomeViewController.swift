//
//  ViewController.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/1/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeview: HomeView! {
        guard isViewLoaded else { return nil }
        return (view as! HomeView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLeftPadding(textField: homeview.EmailText , padding: 20)
        setLeftPadding(textField: homeview.PasswordText , padding: 20)
    }
    
    @IBAction func BTNNext (_ sender:Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next = storyboard.instantiateViewController(withIdentifier: "NextPage") as! PickProductViewController
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }

    func setLeftPadding (textField:UITextField , padding:Double) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 2.0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension HomeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == homeview.EmailText {
            homeview.PasswordText.becomeFirstResponder()
        }
        else {
            // Make Login operation
            self.view.endEditing(true)
        }
        return true
    }
}
