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
    
    var selectionType: SelectionType?
    
    var options: [String] = [String]()
    var selectedOptions: [String] = [String]()
    
}
