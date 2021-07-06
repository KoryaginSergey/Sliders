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
    
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    
    @IBOutlet weak var sldRed: UISlider!
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
        self.txtRed.text = "\(Int(sldRed.value))"
        self.txtBlue.text = "\(Int(sldBlue.value))"
        self.txtGreen.text = "\(Int(sldGreen.value))"
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != "" {
            guard let value = Int(string) else {
                return false
            }
        }
//        guard let value = Int(string) else {
//            return false
//        }
        guard let text = textField.text else {
            return false
        }
        let fullText = text + string
        guard let fullValue = Float(fullText) else {return false}
        if fullValue > 255 {
            return false
        }
        switch textField.tag {
        case 0:
            sldRed.value = fullValue
        case 1:
            sldGreen.value = fullValue
        case 2:
            sldBlue.value = fullValue
        default:
            return false
        }
        changeColor()
        return true
    }
    
    
}

