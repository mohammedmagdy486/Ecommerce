//
//  DetailsVC.swift
//  Ecommerce
//
//  Created by AMN on 6/13/22.
//

import UIKit
import ReadMoreTextView
import MBProgressHUD

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailsTV: lessMoreTextView!
    @IBOutlet weak var detailsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var ratingsView: CorneredView!
    @IBOutlet weak var detailsPhotoCV: UICollectionView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var priceBeforeDiscount: UILabel!
    @IBOutlet weak var XXLSizeBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var largeSizeBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var mediumSizeBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var smallSizeBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var selectSizeBtn: UIButton!
    @IBOutlet weak var selectColorBtn: UIButton!
    @IBOutlet weak var selectSizeView: UIView!
    @IBOutlet weak var selectColorView: UIView!
    @IBOutlet weak var blackColorSelctBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var blueColorSelctBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var redColorSelctBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var greenColorSelctBtn: ChangeBGColorWithStateBtn!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    var itemDetails: ItemModel?
    var cartItemImage: String?
    var cartItemColor: String?
    var cartItemName: String?
    var cartItemSize: String?
    var cartItemPrice: Float?
    var cartItemPriceBeforeDiscount: Float?
    var cartItemDescription: String?
    var isMore = false
    var detailsText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsPhotoCV.delegate = self
        detailsPhotoCV.dataSource = self
        setup()
        changeAllSizeBtnsColor()
        changeColorBtnsColor()
    }
    
    func setup(){
        detailsText = itemDetails?.itemDescription ?? ""
        let moreLess = UITapGestureRecognizer(target: self, action: #selector(self.seeMore(_:)))
        detailsLabel.text = detailsText
        detailsLabel.isUserInteractionEnabled = true
        detailsLabel.addGestureRecognizer(moreLess)
        detailsLabel.numberOfLines = 4
        detailsLabel.seeMoreLessText(tag: 0,text: detailsText ?? "")
        detailsPhotoCV.register(UINib(nibName: "DetailsCVCell", bundle: nil), forCellWithReuseIdentifier: "DetailsCVCell")
        let searchBtn = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(searchBtnTapped))
        let notificationBtn = UIBarButtonItem(image: UIImage(named: "Notification"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(notificationBtnTapped))
        navigationItem.rightBarButtonItems = [notificationBtn, searchBtn]
        itemName.text = itemDetails?.itemName
        itemPrice.text = ("\(itemDetails?.itemPrice ?? 0)$")
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "\((itemDetails?.itemPrice ?? 0) * 1.2)$")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        priceBeforeDiscount.attributedText = attributeString
        //        DataServices.instance.detailsCVPhotos.append(detailsDataModel(detailsImage: itemDetails?.itemImage ?? "", itemIndex: DataServices.instance.detailsCVPhotos.count + 1))
        selectSizeBtn.addTarget(self, action: #selector(selectSizeBtnTapped), for: .touchUpInside)
        selectColorBtn.addTarget(self, action: #selector(selectColorBtnTapped), for: .touchUpInside)
        selectSizeView.isHidden = false
        selectColorView.isHidden = true
        smallSizeBtn.addTarget(self, action: #selector(smallSizeBtnTapped), for: .touchUpInside)
        mediumSizeBtn.addTarget(self, action: #selector(mediumSizeBtnTapped), for: .touchUpInside)
        largeSizeBtn.addTarget(self, action: #selector(largeSizeBtnTapped), for: .touchUpInside)
        XXLSizeBtn.addTarget(self, action: #selector(XXLSizeBtnTapped), for: .touchUpInside)
        blackColorSelctBtn.addTarget(self, action: #selector(blackColorSelctBtnTapped), for: .touchUpInside)
        blueColorSelctBtn.addTarget(self, action: #selector(blueColorSelctBtnTapped), for: .touchUpInside)
        redColorSelctBtn.addTarget(self, action: #selector(redColorSelctBtnTapped), for: .touchUpInside)
        greenColorSelctBtn.addTarget(self, action: #selector(greenColorSelctBtnTapped), for: .touchUpInside)
        addToCartBtn.addTarget(self, action: #selector(addTOCartBtnTapped), for: .touchUpInside)
    }
    
    func changeColorForBtn(button: ChangeBGColorWithStateBtn, selectedColor: UIColor, unselectedColor: UIColor){
        if button.isSelected == true{
            button.setBackGroundColor(selectedColor: selectedColor, unSelectedColor: unselectedColor, state: .selected)}
        else{
            button.setBackGroundColor(selectedColor: selectedColor, unSelectedColor: unselectedColor, state: .normal)
        }
    }
    
    func changeAllSizeBtnsColor(){
        changeColorForBtn(button: smallSizeBtn, selectedColor: UIColor(named: "selectedBtnBGColor") ?? .white, unselectedColor: UIColor(named: "unSelectedBtnBGColor") ?? .white)
        changeColorForBtn(button: mediumSizeBtn, selectedColor: UIColor(named: "selectedBtnBGColor") ?? .white, unselectedColor: UIColor(named: "unSelectedBtnBGColor") ?? .white)
        changeColorForBtn(button: largeSizeBtn, selectedColor: UIColor(named: "selectedBtnBGColor") ?? .white, unselectedColor: UIColor(named: "unSelectedBtnBGColor") ?? .white)
        changeColorForBtn(button: XXLSizeBtn, selectedColor: UIColor(named: "selectedBtnBGColor") ?? .white, unselectedColor: UIColor(named: "unSelectedBtnBGColor") ?? .white)
    }
    
    @objc func seeMore(_ gesture: UITapGestureRecognizer)
    {
        if gesture.view?.tag == 0 {
            detailsLabel.numberOfLines = 0
            gesture.view?.tag = 1
        }else{
            detailsLabel.numberOfLines = 4
            gesture.view?.tag = 0
        }
        detailsLabel.seeMoreLessText(tag: gesture.view?.tag ?? 0,text: detailsText ?? "")
    }
    
    func changeColorBtnsColor(){
        changeColorForBtn(button: blackColorSelctBtn, selectedColor: .black , unselectedColor: UIColor(named: "unselectedBlack") ?? .white)
        changeColorForBtn(button: blueColorSelctBtn, selectedColor: .blue , unselectedColor: UIColor(named: "unselectedBlue") ?? .white)
        changeColorForBtn(button: redColorSelctBtn, selectedColor: .red, unselectedColor: UIColor(named: "unselectedRed") ?? .white)
        changeColorForBtn(button: greenColorSelctBtn, selectedColor: .green, unselectedColor: UIColor(named: "unselectedGreen") ?? .white)
    }
    
    @objc func selectSizeBtnTapped(){
        selectSizeView.isHidden = false
        selectColorView.isHidden = true
    }
    
    @objc func selectColorBtnTapped(){
        selectSizeView.isHidden = true
        selectColorView.isHidden = false
    }
    
    @objc func smallSizeBtnTapped(){
        smallSizeBtn.isSelected.toggle()
        mediumSizeBtn.isSelected = false
        largeSizeBtn.isSelected = false
        XXLSizeBtn.isSelected = false
        smallSizeBtn.setTitleColor(.black, for: .normal)
        smallSizeBtn.setTitleColor(.white, for: .selected)
        changeAllSizeBtnsColor()
        cartItemSize = "S"
        
    }
    
    @objc func mediumSizeBtnTapped(){
        mediumSizeBtn.isSelected.toggle()
        smallSizeBtn.isSelected = false
        largeSizeBtn.isSelected = false
        XXLSizeBtn.isSelected = false
        mediumSizeBtn.setTitleColor(.black, for: .normal)
        mediumSizeBtn.setTitleColor(.white, for: .selected)
        changeAllSizeBtnsColor()
        cartItemSize = "M"
    }
    
    @objc func largeSizeBtnTapped(){
        largeSizeBtn.isSelected.toggle()
        mediumSizeBtn.isSelected = false
        smallSizeBtn.isSelected = false
        XXLSizeBtn.isSelected = false
        largeSizeBtn.setTitleColor(.black, for: .normal)
        largeSizeBtn.setTitleColor(.white, for: .selected)
        changeAllSizeBtnsColor()
        cartItemSize = "L"
    }
    
    @objc func XXLSizeBtnTapped(){
        XXLSizeBtn.isSelected.toggle()
        mediumSizeBtn.isSelected = false
        largeSizeBtn.isSelected = false
        smallSizeBtn.isSelected = false
        XXLSizeBtn.setTitleColor(.black, for: .normal)
        XXLSizeBtn.setTitleColor(.white, for: .selected)
        changeAllSizeBtnsColor()
        cartItemSize = "XXL"
    }
    
    @objc func blackColorSelctBtnTapped(){
        blackColorSelctBtn.isSelected.toggle()
        blueColorSelctBtn.isSelected = false
        redColorSelctBtn.isSelected = false
        greenColorSelctBtn.isSelected = false
        changeColorBtnsColor()
        cartItemColor = "cartBlack"
    }
    
    @objc func blueColorSelctBtnTapped(){
        blackColorSelctBtn.isSelected = false
        blueColorSelctBtn.isSelected.toggle()
        redColorSelctBtn.isSelected = false
        greenColorSelctBtn.isSelected = false
        changeColorBtnsColor()
        cartItemColor = "cartBlue"
    }
    
    @objc func redColorSelctBtnTapped(){
        blackColorSelctBtn.isSelected = false
        blueColorSelctBtn.isSelected = false
        redColorSelctBtn.isSelected.toggle()
        greenColorSelctBtn.isSelected = false
        changeColorBtnsColor()
        cartItemColor = "cartRed"
    }
    
    @objc func greenColorSelctBtnTapped(){
        blackColorSelctBtn.isSelected = false
        blueColorSelctBtn.isSelected = false
        redColorSelctBtn.isSelected = false
        greenColorSelctBtn.isSelected.toggle()
        changeColorBtnsColor()
        cartItemColor = "cartGreen"
    }
    
    @objc func searchBtnTapped(){
        
    }
    
    @objc func notificationBtnTapped(){
        
    }
    
    @objc func addTOCartBtnTapped(){
        cartItemName = itemName.text
        cartItemImage = itemDetails?.itemImage
        cartItemPrice = itemDetails?.itemPrice
        cartItemPriceBeforeDiscount = (itemDetails?.itemPrice ?? 0) * 1.2
        cartItemDescription = detailsTV.text
        if cartItemSize == nil{
            let alertContoller = UIAlertController (title: "Alert" , message: "Please select Size" , preferredStyle: .alert)
            alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alertContoller , animated: true, completion: nil)
        }
        else if cartItemColor == nil{
            let alertContoller = UIAlertController (title: "Alert" , message: "Please select color" , preferredStyle: .alert)
            alertContoller.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alertContoller , animated: true, completion: nil)
        }
        else{
            let spiningActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
            spiningActivity.label.text = ""
            spiningActivity.detailsLabel.text = "item is added to Cart"
            delay(durationInSeconds: 0.5) {
                MBProgressHUD.hide(for: self.view, animated: true)
                let item = CartItemModel(itemName: self.cartItemName ?? "", itemImage: self.cartItemImage ?? "" , itemPrice: self.cartItemPrice ?? 0, itemColor: self.cartItemColor ?? "", itemSize: self.cartItemSize ?? "", itemPriceBeforeDiscount: self.cartItemPriceBeforeDiscount ?? 0, itemDescription: self.cartItemDescription ?? "")
                CoreDataServices.instance.saveItemToCartCD(item: item) { finished in
                }
            }
        }
    }
}


extension DetailsVC : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataServices.instance.getDetailsPhotos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCVCell", for: indexPath) as! DetailsCVCell
        cell.updateDetailsCell(data: DataServices.instance.getDetailsPhotos()[indexPath.row])
        cell.pageConrol.numberOfPages = DataServices.instance.getDetailsPhotos().count
        cell.pageConrol.currentPage = DataServices.instance.getDetailsPhotos()[indexPath.row].itemIndex
        return cell
    }
    
}
