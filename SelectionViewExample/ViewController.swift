//
//  ViewController.swift
//  SelectView
//
//  Created by Agnieszka Patalas on 29.05.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var item: SelectionItemView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        item?.title = "Title"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

