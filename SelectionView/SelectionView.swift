//
//  SelectedView.swift
//  SelectView
//
//  Created by Agnieszka Patalas on 29.05.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

public protocol SelectionViewDelegate: class {
    func didSelectItems(sender: SelectionView, items: [String])
}

public enum SelectionType {
    case single
    case multiple
}

public class SelectionView: UIView {
    
    public var selectionType: SelectionType = .multiple
    
    public var options = [String]() {
        didSet {
            refreshOptions()
        }
    }
    
    public var selectedOptions = [String]() {
        didSet {
            refreshSelection()
        }
    }
    
    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var itemHeight: CGFloat = 40.0
    public var itemMargin: CGFloat = 8.0
    public var autoHeight = true
    public var titleLabel = UILabel()
    
    public weak var delegate: SelectionViewDelegate?
    
    fileprivate var itemViews = [SelectionItemView]()
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    private func setUp() {
        addSubview(titleLabel)
        
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: itemMargin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -itemMargin).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: itemMargin / 2).isActive = true
    }
    
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
        
        if let last = itemViews.last, autoHeight {
            bottomAnchor.constraint(equalTo: last.bottomAnchor, constant: itemMargin).isActive = true
        }
    }
    
    private func refreshSelection() {
        for itemView in itemViews {
            itemView.selected = selectedOptions.contains(itemView.title)
        }
    }
    
    private func setConstraints(itemView: SelectionItemView, modY: inout Int, modX: Int) {
        itemView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -itemMargin * 1.5).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        
        let heightConstant = (itemMargin + itemHeight) * CGFloat(modY) + itemMargin
        itemView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: heightConstant).isActive = true
        
        if (modX % 2 != 0) {
            modY += 1
            itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: (-1) * itemMargin).isActive = true
        }
        else {
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: itemMargin).isActive = true
        }
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
        
        let filteredItems = itemViews.filter{ $0.selected }.map{ $0.title }
        delegate?.didSelectItems(sender: self, items: filteredItems)
    }
    
}
