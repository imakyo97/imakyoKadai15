//
//  ItemTableViewCell.swift
//  Kadai15
//
//  Created by 今村京平 on 2021/07/01.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var checkImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    static var nib: UINib { UINib(nibName: String(describing: self),
                                  bundle: nil) }
    static var identifier: String { String(describing: self) }

    func configure(item: Item) {
        nameLabel.text = item.name
        checkImageView.image =
            item.isChecked ? UIImage(named: "CheckMark") : nil
    }
}
