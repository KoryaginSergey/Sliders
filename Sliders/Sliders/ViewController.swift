//
//  ViewController.swift
//  Sliders
//
//  Created by Admin on 06.07.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet private weak var colorView: UIView!
    
    @IBOutlet private weak var redValueTextField: UITextField!
    @IBOutlet private weak var greenValueTextField: UITextField!
    @IBOutlet private weak var blueValueTextField: UITextField!
    
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = 125
        greenSlider.value = 125
        blueSlider.value = 125
        changeColor()
        changeValues()
    }
    func changeColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255.0),
                                            green: CGFloat(greenSlider.value/255.0),
                                            blue: CGFloat(blueSlider.value/255.0), alpha: 1)
    }
    @IBAction func sliderRGBChanged(_ sender: Any) {
        changeColor()
        changeValues()
    }
    func changeValues() {
        self.redValueTextField.text = "\(Int(redSlider.value))"
        self.blueValueTextField.text = "\(Int(blueSlider.value))"
        self.greenValueTextField.text = "\(Int(greenSlider.value))"
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        guard let fullString = textField.text, let fullValue = Float(fullString) else {
            return false
        }
        switch textField.tag {
        case 0:
            redSlider.value = fullValue
        case 1:
            greenSlider.value = fullValue
        case 2:
            blueSlider.value = fullValue
        default:
            return false
        }
        changeColor()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        guard let text = textField.text else {
            return false
        }
        let fullText = text + string
        guard let fullValue = Float(fullText) else {return false}
        if fullValue > 255 {
            return false
        }
        return true
    }
}

