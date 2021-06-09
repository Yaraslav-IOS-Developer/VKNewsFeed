//
//  Strihg + Height.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 09.06.2021.
//

import UIKit


extension String {
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = self.boundingRect(with: textSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil)
        
        return ceil(size.height)
    }
    
}
