//
//  CarCell.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import UIKit

class CarCell: UITableViewCell {
    
    static let identifier = "CarCell"
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet var carRating: UILabel!
    
    var car: Cars? {
        didSet { self.displayData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carName.text = nil
        carPrice.text = nil
        carImageView.image = nil
    }
    
    private func displayData() {
        carName.text = car?.carModelAndMake()
        carPrice.text = car?.carDisplayPrice()
        carImageView.image = car?.carImage()
        carRating.text = car?.carRating()
    }
}
