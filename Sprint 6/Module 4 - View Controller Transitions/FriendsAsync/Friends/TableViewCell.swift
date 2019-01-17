//
//  TableViewCell.swift
//  Friends
//
//  Created by Sergey Osipyan on 1/10/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, LabelProviding, UIViewControllerTransitioningDelegate {
    
     func newFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Neuropol X", size: pointSize) else { fatalError("Font is nil. Check the name of the font.") }
        return UIFontMetrics(forTextStyle: .callout).scaledFont(for: font)
    }

    
    @IBOutlet weak var friendImage: UIImageView!
    
    @IBOutlet weak var friendName: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        guard let label = self.textLabel else { return }
        label.frame = CGRect(x: 110, y: 15, width: 120, height: 20)
        label.font = UIFont(name: "Neuropol X", size: 20)
    }
}
