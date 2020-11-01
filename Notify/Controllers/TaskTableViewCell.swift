//
//  TaskTableViewCell.swift
//  Notify
//
//  Created by Marc Llort Maulion on 27/10/2020.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskImageView: UIImageView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bg = UIView()
        bg.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        selectedBackgroundView = bg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
