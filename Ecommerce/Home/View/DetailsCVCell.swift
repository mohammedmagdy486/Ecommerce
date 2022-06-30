//
//  DetialsCVCell.swift
//  Ecommerce
//
//  Created by AMN on 6/13/22.
//

import UIKit

class DetailsCVCell: UICollectionViewCell {

    @IBOutlet weak var pageConrol: UIPageControl!
    @IBOutlet weak var addFavoriteBtn: UIButton!
    @IBOutlet weak var photoImage: CorneredImage!
    override func awakeFromNib() {
        super.awakeFromNib()
       setup()
        
    }
    
    func updateDetailsCell (data: detailsDataModel){
        photoImage.image = UIImage(named: data.detailsImage)
    }
    func setup(){
       
        addFavoriteBtn.addTarget(self, action: #selector(addFavoriteBtnTapped), for: .touchUpInside)
    }
  
    @objc func addFavoriteBtnTapped(){
        
    }
}
