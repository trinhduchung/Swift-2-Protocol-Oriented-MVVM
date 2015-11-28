//
//  SecondViewViewModel.swift
//  ProtocolOrientedAndMVVM
//
//  Created by Hung Trinh on 10/19/15.
//  Copyright © 2015 Hung Trinh. All rights reserved.
//

import Foundation

protocol SecondViewViewModelDataSource {
    var title: String { get }
    var option: Setting { get }
}

class SecondViewViewModel: SecondViewViewModelDataSource {
    
    var title   = "SeconViewController"
    var option  = Setting.MinionMode
    
    init(withEnumOption option: Setting) {
        self.option = option
    }
}

