//
//  ViewController.swift
//  ProtocolOrientedAndMVVM
//
//  Created by Hung Trinh on 10/19/15.
//  Copyright © 2015 Hung Trinh. All rights reserved.
//

import UIKit

enum Setting: Int {
    case MinionMode
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let setting = Setting(rawValue: indexPath.row) {
            switch setting {
            case .MinionMode:
                let cell = tableView.dequeueReusableCellWithIdentifier("SwitchWithTextTableViewCell") as! SwitchWithTextTableViewCell
                //This is where the magic happens
                cell.configure(withDelegate: MinionModeViewModel())
                
                return cell
            }
        }
        
        return tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let setting = Setting(rawValue: indexPath.row) {
            switch setting {
            case .MinionMode:
                let secondViewViewModel = SecondViewViewModel(withEnumOption: setting)
                let secondVC = SecondViewController() as SecondViewController
                secondVC.viewModel = secondViewViewModel
                self.presentViewController(secondVC, animated: true, completion: nil)
                break
            }
        }
    }
}

