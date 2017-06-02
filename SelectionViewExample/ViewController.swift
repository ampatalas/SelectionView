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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleChoiceItem?.title = "Single choice"
        singleChoiceItem?.selectionType = .single
        singleChoiceItem?.options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        
        multipleChoiceItem?.title = "Multiple choice"
        multipleChoiceItem?.options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        multipleChoiceItem?.selectedOptions = ["Option 1", "Option 3"]
    }


}

