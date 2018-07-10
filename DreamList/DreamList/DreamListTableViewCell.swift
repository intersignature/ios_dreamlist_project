//
//  DreamListTableViewCell.swift
//  DreamList
//
//  Created by Sirichai Binchai on 10/7/2561 BE.
//  Copyright © 2561 Sirichai Binchai. All rights reserved.
//

import UIKit

class DreamListTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLb: UILabel!
    @IBOutlet weak var dreamListImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(dreamList: DreamList){
        dreamListImg.image = UIImage(named: "nature")
        detailLb.text = dreamList.detail
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
