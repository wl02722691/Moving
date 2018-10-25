//
//  UITableVie+extension.swift
//  Moving
//
//  Created by 張書涵 on 2018/10/24.
//  Copyright © 2018年 AliceChang. All rights reserved.
//

import Foundation

extension UITableView {
    
    func isCellVisible(indexSection: Int, indexRow: Int) -> Bool {
        guard let indexes = self.indexPathsForVisibleRows else {
            return false
        }
        return indexes.contains {$0.section == indexSection && $0.row == indexRow }
    }
}
