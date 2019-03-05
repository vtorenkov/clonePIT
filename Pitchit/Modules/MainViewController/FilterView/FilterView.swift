//
//  FilterView.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/5/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class FilterView: UIView, NibLoadable {

    @IBOutlet var filterTypeDescription: UILabel!
    @IBOutlet var filterTypeLabel: UILabel!
    @IBOutlet var imageType: UIImageView!
    
    weak var delegateMain: FiltersActions?

    override func awakeFromNib() {
        setupView()
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        delegateMain?.hidFilterView()
    }
    
    func setupView() {
        backgroundColor = UIColor.violateCatBackGround
    }
}
