//
//  ViewController.swift
//  SelectView
//
//  Created by Agnieszka Patalas on 29.05.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var singleChoiceItem: SelectionView?
    @IBOutlet var multipleChoiceItem: SelectionView?

    @IBOutlet weak var singleChoiceLabel: UILabel!
    @IBOutlet weak var multipleChoiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleChoiceItem?.title = "Single choice"
        singleChoiceItem?.selectionType = .single
        singleChoiceItem?.deselectable = true
        singleChoiceItem?.options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        singleChoiceItem?.delegate = self
        
        multipleChoiceItem?.title = "Multiple choice"
        multipleChoiceItem?.options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        multipleChoiceItem?.selectedOptions = ["Option 1", "Option 3"]
        multipleChoiceItem?.delegate = self
    }

}

extension ViewController: SelectionViewDelegate {
    
    func didSelectItems(sender: SelectionView, items: [String]) {
        
        if sender == singleChoiceItem {
            let text = items.first ?? "none"
            singleChoiceLabel.text = "Single choice: \(text)"
        }
        else {
            multipleChoiceLabel.text = "Multiple choice: " + items.joined(separator: " ")
        }
        
    }
    
}

