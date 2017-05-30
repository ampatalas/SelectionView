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
        
        // Recreate
        for option in options {
            let itemView = SelectionItemView()
            itemView.delegate = self
            itemView.title = option
            
            
            addSubview(itemView)
            itemViews.append(itemView)
        }
    }
    
    private func setItemsFrame() {
        var modY = 0
        var modX = 0
        
        for item in itemViews {
            let width: CGFloat = (bounds.width - 3 * itemMargin) / 2
            let x = modX % 2 == 0 ? itemMargin : width + 2 * itemMargin
            let y = itemMargin + CGFloat(modY) * (itemHeight + itemMargin)
            let frame = CGRect(x: x, y: y, width: width, height: itemHeight)
            item.frame = frame
            
            if (modX % 2 != 0) {
                modY += 1
            }
            
            modX += 1
        }
        
        if autoHeight {
            let viewHeight = itemMargin + CGFloat(modY) * (itemHeight + itemMargin)
            heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setItemsFrame()
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
