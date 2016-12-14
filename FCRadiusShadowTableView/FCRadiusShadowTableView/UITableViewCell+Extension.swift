//
//  UITableViewCell+Extension.swift
//  MoeBuy
//
//  Created by liujianlin on 2016/12/13.
//  Copyright © 2016年 xdream. All rights reserved.
//
import UIKit

extension UITableViewCell {
    func addShadow(inTableView tableView: UITableView, atIndexPath indexPath: IndexPath) {
        let isFirst = indexPath.row==0
        let isLast = indexPath.row+1 == tableView.numberOfRows(inSection: indexPath.section)
        var shadowRect = contentView.bounds.insetBy(dx: 0, dy: -10)
        if isFirst {
            shadowRect.origin.y += 10
        } else if isLast {
            shadowRect.size.height -= 15
        }
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: 5).cgPath
        layer.masksToBounds = false
        
        var maskRect = contentView.bounds.insetBy(dx: -20, dy: 0)
        if isFirst {
            maskRect.origin.y -= 15
            maskRect.size.height += 15
        } else if isLast {
            maskRect.size.height += 15
        }
        
        // and finally add the shadow mask
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(rect: maskRect).cgPath
        layer.mask = maskLayer
        
        //圆角
        var roundingCorners: UIRectCorner!
        if isFirst {
            roundingCorners =  [UIRectCorner.topLeft, UIRectCorner.topRight]
        } else if isLast {
            roundingCorners =  [UIRectCorner.bottomLeft, UIRectCorner.bottomRight]
        } else {
            return
        }
        let maskPath = UIBezierPath(roundedRect: contentView.bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: 5, height: 5))
        let roundingLayer = CAShapeLayer()
        roundingLayer.frame = contentView.bounds
        roundingLayer.path = maskPath.cgPath
        contentView.layer.mask = roundingLayer
    }
}
