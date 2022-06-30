//
//  homeSection1TVCell.swift
//  Ecommerce
//
//  Created by AMN on 6/16/22.
//

import UIKit

protocol itemDelegate: AnyObject {
    func cellTapped(itemesDetails: ItemModel)
}

class homeSection1TVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: itemDelegate?
    var section: Int?
    var featuredItemsCD : [FeaturedItemCD] = []
    var bestItemsCD : [BestItemCD] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        setup()
    }
    
    
    func setup(){
        collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
    }
}
extension homeSection1TVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServices.instance.getFeaturedItemData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as? ItemCell {
            
            if section == 1 {
                let itemCell = featuredItemsCD[indexPath.row]
                cell.updateFeaturedItemWithCD(data: itemCell)
                return cell
            }
            else {
                let itemCell = bestItemsCD[indexPath.row]
                cell.updateBestItemWithCD(data: itemCell)
                    return cell
            }
        }
        else{
            return ItemCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if section == 1 {
        delegate?.cellTapped(itemesDetails: DataServices.instance.getFeaturedItemData()[indexPath.row])
        }
        else {
        delegate?.cellTapped(itemesDetails: DataServices.instance.getBestItemData()[indexPath.row])
        }
    }
}

