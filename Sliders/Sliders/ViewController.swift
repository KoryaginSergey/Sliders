//
//  ViewController.swift
//  Sliders
//
//  Created by Admin on 06.07.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var lblRed: UILabel!
    @IBOutlet weak var lblGreen: UILabel!
    @IBOutlet weak var lblBlue: UILabel!
    
    @IBOutlet weak var sldRed: UISlider! {
        didSet {
//            lblRed.text = String(sldRed.value)
        }
    }
    @IBOutlet weak var sldGreen: UISlider!
    @IBOutlet weak var sldBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        changeValues()
    }
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(sldRed.value/255.0), green: CGFloat(sldGreen.value/255.0), blue: CGFloat(sldBlue.value/255.0), alpha: 1)
    }
    
    @IBAction func sliderRGBChanged(_ sender: Any) {
        changeColor()
        changeValues()
    }
    func changeValues() {
        self.lblRed.text = "\(Int(sldRed.value))"
        self.lblBlue.text = "\(Int(sldBlue.value))"
        self.lblGreen.text = "\(Int(sldGreen.value))"
    }
    
    


}

