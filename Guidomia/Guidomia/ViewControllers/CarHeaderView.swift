//
//  CarHeader.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import UIKit

class CarHeaderView: UIView {
    
    // MARK:- Outlet
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    private func xibSetup() {
        Bundle.main.loadNibNamed("CarHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
