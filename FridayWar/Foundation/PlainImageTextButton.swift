//
//  PlainImageTextButton.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class PlainImageTextButton: UIButton {

    init(title: String?, titleFont: UIFont?, subtitle: String = "", subtitleFont: UIFont = UIFont.systemFont(ofSize: 14), image: UIImage?, contentColor: UIColor, imagePadding: CGFloat = 0, imagePlacement: NSDirectionalRectEdge = .leading) {
        super.init(frame: .zero)
        var config = UIButton.Configuration.plain()
        config.imagePadding = imagePadding
        config.image = image
        config.baseForegroundColor = contentColor
        config.imagePlacement = imagePlacement
        configuration = config
        titleLabel?.numberOfLines = 1
    }
    
    // text only
    convenience init(title: String, titleFont: UIFont, fontColor: UIColor, imagePlacement: NSDirectionalRectEdge = .leading) {
        self.init(title: title, titleFont: titleFont, image: nil, contentColor: fontColor)
    }
    
    // image only
    convenience init(image: UIImage?, imageColor: UIColor) {
        self.init(title: nil, titleFont: nil, image: image, contentColor: imageColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

