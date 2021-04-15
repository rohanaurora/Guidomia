//
//  CarHeader.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import UIKit

class CarHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var makeView: UILabel!
    @IBOutlet weak var modelView: UILabel!
    @IBOutlet weak var filterView: UIView!
    static let headerID: String = "CarHeaderView"
    static let nibName = "CarHeaderView"

    override func awakeFromNib() {
        super.awakeFromNib()
        [modelView, makeView, filterView].forEach({ $0?.layer.cornerRadius = 6;
                                                    $0?.layer.masksToBounds = true })
    }
}
