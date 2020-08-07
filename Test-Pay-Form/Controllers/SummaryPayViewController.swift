//
//  SummaryPayViewController.swift
//  Test-Pay-Form
//
//  Created by Mohamed Ali on 8/2/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import FirebaseFirestore

class Data {
    var Name:String?
    var ImageName = "hqdefault"
}

class SummaryPayViewController: UIViewController {
    
    var summaryview: SummaryView! {
        guard isViewLoaded else { return nil }
        return (view as! SummaryView)
    }
    
    var arr = Array<Data>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDesign()
        setData()
    }
    
    func setDesign () {
        // Make First Circle.
        makecornerCircle(View: summaryview.outview1, borderColor: "#FA4248")
        makecornerCirclewithoutborder1(View: summaryview.inview1)
        
        // Make Second Circle.
        makecornerCircle(View: summaryview.outview2, borderColor: "#DDDDDD")
        makecornerCirclewithoutborder1(View: summaryview.inview2)
        
        // Make Intialize to Xib File in CollectionView.
        summaryview.collectionView.register(UINib(nibName: "Products", bundle: nil), forCellWithReuseIdentifier: "Cell")
        summaryview.collectionView?.backgroundColor = UIColor.clear
        summaryview.collectionView?.backgroundView = UIView(frame: CGRect.zero)
        
        // Make LineView Some Edit on Design
        summaryview.LineView.layer.borderColor = UIColor().hexStringToUIColor(hex: "#EBEBEB").cgColor
        summaryview.LineView.layer.borderWidth = 0.5
        summaryview.LineView.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    func setData() {
        Firestore.firestore().collection("Data").getDocuments { (query, error) in
            if error != nil {
                print("Error!")
            }
            else {
                for doc in query!.documents {
                    let ob = Data()
                    ob.Name = doc.get("title") as? String
                    self.arr.append(ob)
                    self.summaryview.collectionView.reloadData()
                }
            }
        }
    }
    
    func makecornerCircle (View:UIView , borderColor:String) {
        View.layer.cornerRadius = View.frame.size.width/2
        View.clipsToBounds = true

        View.layer.borderColor = UIColor().hexStringToUIColor(hex: borderColor).cgColor
        View.layer.borderWidth = 1.0
    }
    
    func makecornerCirclewithoutborder (View:UIView) {
        View.layer.cornerRadius = View.frame.size.width/2
        View.clipsToBounds = true

        View.layer.borderColor = UIColor.clear.cgColor
    }
    
    func makecornerCirclewithoutborder1 (View:UIView) {
        View.layer.cornerRadius = View.frame.size.width/2
        View.clipsToBounds = true
    }
}

extension SummaryPayViewController: UICollectionViewDelegate {
    
}

extension SummaryPayViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Products = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Products
        
        cell.NameLabel.text = arr[indexPath.row].Name
        cell.Image1.image = UIImage(named: arr[indexPath.row].ImageName)
        
        return cell
    }
}

extension SummaryPayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
        IndexPath) -> CGSize {
        
        let w1 = summaryview.collectionView.frame.width - (10 * 2)
        let cell_width = (w1 - (50+10)) / 2
        
        return CGSize(width: cell_width , height: summaryview.collectionView.frame.height)
    }
}
