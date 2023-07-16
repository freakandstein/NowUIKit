//
//  MainModel.swift
//  NowUIKit
//
//  Created by Satrio Wicaksono on 16/07/23.
//

import Foundation

enum Component: String {
    case nowSnackbar = "NowSnackbar"
}

struct MainModel {
        
    let component: Component
    let componentName: String
}
