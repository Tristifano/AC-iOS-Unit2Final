//
//  CrayonDetailViewController.swift
//  AC-iOS-Unit2Final
//
//  Created by MacBook on 11/10/17.
//  Copyright © 2017 Karen Fuentes. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {
    var crayon: Crayon?
    var redValue: Float = 0.0
    var greenValue: Float = 0.0
    var blueValue: Float = 0.0
    var alphaValue: Float = 1.0
    var originalColor = [Float]()
    @IBOutlet var labels: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        convertValues()
        setupViews()
        if view.backgroundColor == UIColor(displayP3Red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(alphaValue)) {
            for label in labels {
                label.textColor = .white
            }
            resetButton.titleLabel?.textColor = .white
        }
        // Do any additional setup after loading the view.
    }
    func colorCheck() {
        if view.backgroundColor == UIColor(displayP3Red: CGFloat(0), green: CGFloat(0), blue: CGFloat(0), alpha: CGFloat(alphaValue)) {
            for label in labels {
                label.textColor = .white
            }
            resetButton.titleLabel?.textColor = .white
        }
        if view.backgroundColor == UIColor(displayP3Red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(alphaValue)) {
            for label in labels {
                label.textColor = .black
            }
            resetButton.titleLabel?.textColor = .black
        }
        if alphaValue <= 0.5 {
            for label in labels {
                label.textColor = .white
            }
            resetButton.titleLabel?.textColor = .white
        }
    }
    func convertValues() {
        let newRed = Float((crayon?.red)! / 255.0)
        redValue = newRed
        originalColor.append(redValue)
        let newGreen = Float((crayon?.green)! / 255.0)
        greenValue = newGreen
        originalColor.append(greenValue)
        let newBlue = Float((crayon?.blue)! / 255.0)
        blueValue = newBlue
        originalColor.append(blueValue)
        originalColor.append(alphaValue)
    }
    func setupViews () {
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
        self.crayonLabel.text = crayon?.name
        self.redValueLabel.text = "Red: \(redValue)"
        self.redSlider.value = redValue
        self.greenValueLabel.text = "Green: \(greenValue)"
        self.greenSlider.value = greenValue
        self.blueValueLabel.text = "Blue: \(blueValue)"
        self.blueSlider.value = blueValue
        self.alphaValueLabel.text = "Alpha: \(alphaValue)"
        self.alphaStepper.value = Double(alphaValue)
        
    }
    @IBOutlet weak var crayonLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func colorChanged(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            redValue = sender.value
            redValueLabel.text = "Red: \(redValue)"
        case 2:
            greenValue = sender.value
            greenValueLabel.text = "Green: \(greenValue)"
        case 3:
            blueValue = sender.value
            blueValueLabel.text = "Blue: \(blueValue)"
        default:
            break
        }
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
        colorCheck()
    }
    
  
    
    @IBAction func alphaValueChanged(_ sender: UIStepper) {
        alphaValue = Float(sender.value)
        alphaValueLabel.text = "Alpha: \(alphaValue)"
       view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
        colorCheck()
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(originalColor[0]), green: CGFloat(originalColor[1]), blue: CGFloat(originalColor[2]), alpha: CGFloat(originalColor[3]))
        self.redValueLabel.text = "Red: \(originalColor[0])"
        self.redSlider.value = originalColor[0]
        self.greenValueLabel.text = "Green: \(originalColor[1])"
        self.greenSlider.value = originalColor[1]
        self.blueValueLabel.text = "Blue: \(originalColor[2])"
        self.blueSlider.value = originalColor[2]
        self.alphaValueLabel.text = "Alpha: \(originalColor[3])"
        self.alphaStepper.value = Double(originalColor[3])
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
