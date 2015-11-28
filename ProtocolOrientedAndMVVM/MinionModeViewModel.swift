//
//  MinionModeViewModel.swift
//  ProtocolOrientedAndMVVM
//
//  Created by Hung Trinh on 10/19/15.
//  Copyright © 2015 Hung Trinh. All rights reserved.
//

import Foundation
import UIKit

struct MinionModeViewModel: SwitchWithTextCellProtocol {
    var title = "MinionMode!!!"
    var switchOn = true
    
    func onSwitchToggleOn(on: Bool) {
        if on {
            print("The Minions are here to stay!")
        } else {
            print("The Minions went out to play!")
        }
    }
    
    func switchColor() -> UIColor {
        return UIColor.yellowColor()
    }
}
