//
//  DetailsViewController.swift
//  glycemic
//
//  Created by EMP on 10/10/2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var GI: UILabel!
    @IBOutlet weak var GL: UILabel!
    @IBOutlet weak var GLNumber: UILabel!
    @IBOutlet weak var foodTile: UILabel!
    @IBOutlet weak var foodTilteView: UIView!
    @IBOutlet weak var GINumber: UILabel!
    @IBOutlet weak var cards: UILabel!
    @IBOutlet weak var cardsNumber: UILabel!
    @IBOutlet weak var proteins: UILabel!
    @IBOutlet weak var proteinsNumber: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    
    @IBOutlet var detailsView: [UIView]!
    @IBOutlet var numberView: [UIView]!
    
    var heading: String?
    var Glno: String?
    var GIno: String?
    var cardsno: String?
    var proteinsno: String?
    var product: String?
    
   
    var list:[String] = ["GL   :","GI    :","Crbs   :","Proteins   :"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forView()
        forLabel()
    }
    
    func forView() {
        
//        detailsView.forEach { $0.layer.cornerRadius = 10 }
        detailsView.forEach { $0.backgroundColor = .white }
        
        numberView.forEach { $0.layer.cornerRadius = 15 }
        numberView.forEach { $0.backgroundColor = .systemOrange }
        
        foodTilteView.layer.cornerRadius = 10
        foodTilteView.backgroundColor = .systemGray6
        
    }
    
    func forLabel() {
        
        foodTile.text = heading
        GLNumber?.text = Glno
        GINumber?.text = GIno
        cardsNumber?.text = cardsno
        proteinsNumber?.text = proteinsno
        productName?.text = product
        
        GL.text = list[0]
        GI.text = list[1]
        cards.text = list[2]
        proteins.text = list[3]
        
        
        foodTile.numberOfLines = 0
        foodTile.lineBreakMode = .byWordWrapping
        foodTile.adjustsFontSizeToFitWidth = true
        foodTile.minimumScaleFactor = 1.0
    }
    

    
}
