//
//  SelectedView.swift
//  SelectView
//
//  Created by Agnieszka Patalas on 29.05.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

protocol SelectionViewDelegate: class {
    func didSelectItems(sender: SelectionView)
}

enum SelectionType {
    case single
    case multiple
}

class SelectionView: UIView {
    
    var selectionType: SelectionType = .multiple
    
    var options = [String]() {
        didSet {
            refreshOptions()
        }
    }
    
    var selectedOptions = [String]() {
        didSet {
            refreshSelection()
        }
    }
    
    var title: String = ""
    var itemHeight: CGFloat = 40.0
    var itemMargin: CGFloat = 8.0
    var autoHeight = true
    
    fileprivate var itemViews = [SelectionItemView]()
    
    private func refreshOptions() {
        // Clean
        for item in itemViews {
            item.removeFromSuperview()
        }
        itemViews.removeAll()
        
        var modY = 0
        var modX = 0
        
        // Recreate
        for option in options {
            let itemView = SelectionItemView()
            itemView.delegate = self
            itemView.title = option
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(itemView)
            setConstraints(itemView: itemView, modY: &modY, modX: modX)
            
            modX += 1
            itemViews.append(itemView)
        }
        
        if autoHeight {
            let height = (itemMargin + itemHeight) * CGFloat(modY) + itemMargin
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    private func setConstraints(itemView: SelectionItemView, modY: inout Int, modX: Int) {
        itemView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -itemMargin * 1.5).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        
        let heightConstant = (itemMargin + itemHeight) * CGFloat(modY) + itemMargin
        itemView.topAnchor.constraint(equalTo: topAnchor, constant: heightConstant).isActive = true
        
        if (modX % 2 != 0) {
            modY += 1
            itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: (-1) * itemMargin).isActive = true
        }
        else {
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: itemMargin).isActive = true
        }
    }
    
    private func refreshSelection() {
        
    }
    
    
}

extension SelectionView: SelectionItemViewDelegate {
    
    func itemSelected(sender: SelectionItemView) {
        switch selectionType {
        case .single:
            for itemView in itemViews {
                itemView.selected = itemView == sender
            }
            break
        default:
            break
        }
    }
    
}
