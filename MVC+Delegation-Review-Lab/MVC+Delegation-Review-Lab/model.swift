//
//  model.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Jack Wong on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

struct Font {
    static let defaultFontSize: CGFloat = 17
}

protocol FontResizable {
    func changeFontSize(_ newSize: CGFloat)
}
