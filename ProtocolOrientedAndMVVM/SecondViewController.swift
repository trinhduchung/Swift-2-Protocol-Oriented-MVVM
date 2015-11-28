//
//  SecondViewController.swift
//  ProtocolOrientedAndMVVM
//
//  Created by Hung Trinh on 10/19/15.
//  Copyright © 2015 Hung Trinh. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var viewModel: SecondViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel?.title
        
        print("Selected option \(self.viewModel?.option)")
    }
    
    
}
