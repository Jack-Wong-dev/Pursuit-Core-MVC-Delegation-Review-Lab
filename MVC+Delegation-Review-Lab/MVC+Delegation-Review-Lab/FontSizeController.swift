//
//  FontSizeController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Jack Wong on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class FontSizeController: UIViewController {

    @IBOutlet weak var fontSlider: UISlider!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBOutlet weak var fontStepper: UIStepper!
    
    var startingFontSize = Font.defaultFontSize
    
    var delegate : FontResizable?
    
    private var currentFontSize: CGFloat! {
        didSet {
            delegate?.changeFontSize(currentFontSize)
           refresh()
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sender.setValue(Float(lroundf(sender.value)), animated: true)
        currentFontSize = CGFloat(sender.value)
        
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        currentFontSize = CGFloat(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentFontSize = startingFontSize
        
    }
    
    private func refresh() {
        fontSizeLabel.text = "Preview Font Size: \(currentFontSize!)"
        fontSlider.value = Float(currentFontSize)
        fontStepper.value = Double(currentFontSize)
    }
    
}
