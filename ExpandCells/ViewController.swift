//
//  ViewController.swift
//  ExpandCells
//
//  Created by MAC on 28/10/20.
//

import UIKit
struct Data
{
    var name : String
    var profileImg : UIImage
    var skypeName : String
    var email : String
    var location : String
    var DOB : String
}
var profile = [Data]()
class ViewController: UIViewController
{
    
    var collectionCell = CollectionViewCell()
    @IBOutlet weak var collection1: UICollectionView!
    var width:CGFloat{
        return collection1.frame.size.width-40
    }
    var expandedHeight = CGFloat()
    var notexpandedHeight = CGFloat()
    var isExpand = Bool()
    var index = IndexPath()
    var col = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profile  = [Data(name: "Meet Budheliya", profileImg: #imageLiteral(resourceName: "faisal-mehmood-IoCebcb9RGc-unsplash"), skypeName: "MB", email: "meet@adsum.com", location: "Surat", DOB: "20/01/2001"),
        Data(name: "Mayur Bakraniya", profileImg: #imageLiteral(resourceName: "jim-cooke-r6g4GcD6lP0-unsplash"), skypeName: "MB1", email: "Mayur@adsum.com", location: "Ahemdabad", DOB: "10/12/2001"),
        Data(name: "Shubham Ramani", profileImg: #imageLiteral(resourceName: "tapan-kumar-choudhury-T9ypWQGNbv4-unsplash"), skypeName: "SR", email: "sr@adsum.com", location: "Bharuch", DOB: "20/07/1989"),
        Data(name: "Nitin  Paladiya", profileImg: #imageLiteral(resourceName: "ivan-rohovchenko-vpQHhRdoadU-unsplash"), skypeName: "NJ", email: "nj@adsum.com", location: "Vadodra", DOB: "10/05/2005"),
        Data(name: "Mihir Bavishi", profileImg: #imageLiteral(resourceName: "jim-cooke-r6g4GcD6lP0-unsplash"), skypeName: "MB2", email: "mihir@adsum.com", location: "Gandhinagar", DOB: "20/01/2001"),
        Data(name: "Kishan Mangukiya", profileImg: #imageLiteral(resourceName: "josipa-juras-Ipv_MNTzcQI-unsplash"), skypeName: "KM", email: "kishan@adsum.com", location: "Rajkot", DOB: "10/12/2001"),
        Data(name: "Gunjan Vekariya", profileImg: #imageLiteral(resourceName: "jim-cooke-r6g4GcD6lP0-unsplash"), skypeName: "GV", email: "gunjan@adsum.com", location: "Amreli", DOB: "20/01/2001"),
        Data(name: "Nikunj Dhanani", profileImg: #imageLiteral(resourceName: "tapan-kumar-choudhury-T9ypWQGNbv4-unsplash"), skypeName: "ND", email: "nd@gmail.com", location: "Bhavnagar", DOB: "10/05/2005")]
        expandedHeight = view.frame.height-30
        notexpandedHeight = 100
        
    }

    
}
extension ViewController : ExpandableCellDelegate
{
    func AtCellSelect(indexpath: IndexPath) {
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {self.collection1.reloadItems(at: [indexpath])}, completion: {success in print("Success")})
    }
}
extension ViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profile.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection1.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius = 15
        cell.backgroundColor = .lightGray
        cell.profileImage.layer.cornerRadius = 30
        cell.profileImage.layer.masksToBounds = true
        cell.headingName.text = profile[indexPath.row].name
        cell.profileImage.image = profile[indexPath.row].profileImg
        cell.skypeName.text = profile[indexPath.row].skypeName
        cell.email.text = profile[indexPath.row].email
        cell.loaction.text = profile[indexPath.row].location
        cell.dob.text = profile[indexPath.row].DOB
        cell.indexpath = indexPath
        cell.delegate = self
        return cell
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = collectionCell.delegate
        {
            delegate.AtCellSelect(indexpath: indexPath)
        }
        collection1.reloadData()
        if index == indexPath
        {
            if isExpand == true
            {
                isExpand = false
            }
            else
            {
                isExpand = true
            }
        }
        else
        {
            isExpand = false
        }
        index = indexPath
        collection1.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath == index  && isExpand == false
        {
            print("SizeExpand")
            return CGSize(width: width, height: expandedHeight)
        }
        else{
            print("SizeNotExpand")
            return CGSize(width: width, height: notexpandedHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = (collectionView.cellForItem(at: indexPath) as? CollectionViewCell) {
                cell.headingName.transform = .init(scaleX: 0.95, y: 0.95)
                
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
                cell.headingName.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
}
