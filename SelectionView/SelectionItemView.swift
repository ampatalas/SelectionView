//
//  SelectionItemView.swift
//  SelectionView
//
//  Created by Agnieszka Patalas on 29.05.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

protocol SelectionItemViewDelegate: class {
    func itemSelected(sender: SelectionItemView)
}

class SelectionItemView: UIView {
    
    var selected: Bool = false {
        didSet {
            setColors()
        }
    }
    
    var title: String = String() {
        didSet {
            titleLabel.text = title
        }
    }
    
    var selectedBackgroundColor: UIColor = .black
    var selectedBorderColor: UIColor = .white
    var selectedTitleColor: UIColor = .white
    
    var nonSelectedBackgroundColor: UIColor = .white
    var nonSelectedBorderColor: UIColor = .black
    var nonSelectedTitleColor: UIColor = .black
    
    var borderWidth: CGFloat = 1.0
    var cornerRadius: CGFloat = 3.0
    
    weak var delegate: SelectionItemViewDelegate?
    
    private var titleLabel: UILabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        titleLabel = UILabel()
        super.init(coder: aDecoder)
        setUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    private func setUp() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector (self.onTap))
        addGestureRecognizer(gestureRecognizer)
        addSubview(titleLabel)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.layer.borderWidth = borderWidth
        titleLabel.layer.cornerRadius = cornerRadius
        setColors()
    }
    
    func onTap() {
        delegate?.itemSelected(sender: self)
    }
    
    private func setColors() {
        if selected {
            titleLabel.textColor = selectedTitleColor
            titleLabel.layer.borderColor = selectedBorderColor.cgColor
            titleLabel.layer.backgroundColor = selectedBackgroundColor.cgColor
        }
        else {
            titleLabel.textColor = nonSelectedTitleColor
            titleLabel.layer.borderColor = nonSelectedBorderColor.cgColor
            titleLabel.layer.backgroundColor = nonSelectedBackgroundColor.cgColor
        }
    }
}
