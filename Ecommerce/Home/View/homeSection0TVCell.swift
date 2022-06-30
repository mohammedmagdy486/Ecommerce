//
//  NewHomeCategoryTVcellTableViewCell.swift
//  Ecommerce
//
//  Created by AMN on 6/16/22.
//

import UIKit



class homeSection0TVCell: UITableViewCell {
    
    @IBOutlet weak var categoryCV: UICollectionView!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCV.delegate = self
        categoryCV.dataSource = self
        setup()
    }
    
    
    func setup(){
        categoryCV.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
    }
    
}

extension homeSection0TVCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServices.instance.getCategoryCVData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
            let categoryCell = DataServices.instance.getCategoryCVData()[indexPath.row]
            cell.updateCategoryCell(data: categoryCell)
            cell.categoryImage.imageCornerConfiguration(with: CorneredImageViewModel(imageCornerRadius: 10, imageBorderWidth: 0))
            cell.categoryBackView.viewCornerConfiguration(with: CorneredViewViewModel(viewCornerRadius: 10, viewBorderWidth: 1))
            if cell.categoryName.text == "Women"{
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 0.4, green: 0.4941176471, blue: 0.9176470588, alpha: 1)
            }
            else if cell.categoryName.text == "Men"{
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 1, green: 0.3450980392, blue: 0.3450980392, alpha: 1)
            }
            else {
                cell.categoryBackView.backgroundColor = #colorLiteral(red: 0.262745098, green: 0.9137254902, blue: 0.4823529412, alpha: 1)
            }
            return cell
        }
        else{
            return CategoryCell()
        }
    }
  
    
    
}
