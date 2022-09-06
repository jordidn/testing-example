//
//  UITableView+Additions.swift
//  TestingExample
//
//  Created by Jordi Duran Ortega on 6/9/22.
//

import UIKit

extension UITableView {
    
    func registerCell(cell type: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        self.register(UINib(nibName: className, bundle: bundle), forCellReuseIdentifier: className)
    }
    
    func dequeueReusableBy<T>(cell type: T.Type) -> T? {
        let identifier = String(describing: type)
        return self.dequeueReusableCell(withIdentifier: identifier) as? T
    }
    
    func dequeueReusableBy<T>(cell type: T.Type, indexPath: IndexPath) -> T? {
        let identifier = String(describing: type)
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
    }
    
    func registerHeader(view type: UIView.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        self.register(UINib(nibName: className, bundle: bundle), forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueReusableHeaderFooterViewBy<T>(cell type: T.Type) -> T? {
        let identifier = String(describing: type)
        return self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T
    }
    
    var totalHeight: CGFloat {
        return self.contentSize.height + self.contentInset.top + self.contentInset.bottom
    }
    
    var isScrolling: Bool {
        return self.isDecelerating || self.isTracking
    }
    
}
