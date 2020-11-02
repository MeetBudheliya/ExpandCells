//
//  CollectionViewCell.swift
//  ExpandCells
//
//  Created by MAC on 28/10/20.
//

import UIKit
protocol ExpandableCellDelegate:NSObjectProtocol {
    func AtCellSelect(indexpath:IndexPath)
}

class CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var namewidth: NSLayoutConstraint!
    @IBOutlet weak var headingName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var skypeName: UILabel!
    @IBOutlet weak var loaction: UILabel!
    
    @IBOutlet weak var dob: UILabel!
    var delegate:ExpandableCellDelegate?
    var indexpath:IndexPath!
    var maincontroller: ViewController?
   
}

