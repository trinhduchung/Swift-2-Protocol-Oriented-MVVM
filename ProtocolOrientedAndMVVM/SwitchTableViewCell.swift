//
//  SwitchTableViewCell.swift
//  ProtocolOrientedAndMVVM
//
//  Created by Hung Trinh on 10/19/15.
//  Copyright © 2015 Hung Trinh. All rights reserved.
//

import Foundation
import UIKit

protocol SwitchWithTextCellProtocol {
    var title: String { get }
    var switchOn: Bool { get }
    
    func onSwitchToggleOn(on: Bool)
}

extension SwitchWithTextCellProtocol {
    func switchColor() -> UIColor {
        return .purpleColor()
    }
}

class SwitchWithTextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var switchToggle: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    /*
    typealias onSwitchToggleHandlerType = (switchOn: Bool) -> Void
    private var onSwitchToggleHandler: onSwitchToggleHandlerType?
    */
    
    private var delegate: SwitchWithTextCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withDelegate delegate: SwitchWithTextCellProtocol) {
        self.delegate = delegate
        self.label.text = delegate.title
        self.switchToggle.on = delegate.switchOn
        
        //color option added
        self.switchToggle.onTintColor = delegate.switchColor()
    }
    
    /* not a good way
    func configure(withTitle title: String, switchOn: Bool, onSwitchToggleHandler: onSwitchToggleHandlerType? = nil) {
        self.label.text = title
        self.switchToggle.on = switchOn
        self.onSwitchToggleHandler = onSwitchToggleHandler
    }
    
    func configure(withTitle title: String,
        switchOn: Bool,
        switchColor: UIColor = .purpleColor(),
        onSwitchToggleHandler: onSwitchToggleHandlerType? = nil)
    {
        label.text = title
        switchToggle.on = switchOn
        // color option added!
        switchToggle.onTintColor = switchColor
        
        self.onSwitchToggleHandler = onSwitchToggleHandler
    }
    */
    
    @IBAction func onSwitchToggle(sender: UISwitch) {
//        onSwitchToggleHandler?(switchOn: sender.on)
        self.delegate?.onSwitchToggleOn(sender.on)
    }
}