// NAME: LOVELEEN KAUR
// STUDENTID: 301093331
// DESCRIPTION: CALCULATOR
// DATE: 2019-09-25.
// VERSION HISTORY: v1 - added functionality for buttons

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    // 12 + 16
    // previous number (12)
    // number displayed on screen (16)
    //is performing operation Boolean true/false
    //oprtation performing + - / *
    // tag(what is pressed on the screen

    var numberOnScreen: Double = 0      // current number on the screen
    var previousNumber: Double = 0      // previously typed number
    var operation = 0                   // what operation is done
    var isDecimal = false               // check if number is decimal
    var isPerformingOperation = false   // checking any operation is performed is pressed

    // inital screen
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""           // inital text field
    }

    
    // function for entering number on the screen
    @IBAction func digitPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag

        if isPerformingOperation == true{
            // next time i am pressing number don't get into this
            isPerformingOperation = false
            resultLabel.text = String(tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }else{
            // intial digit on the screen
            resultLabel.text = resultLabel.text! + String(tag-1)
            numberOnScreen = Double(resultLabel.text!)!
        }
    }

    // function for using operation for calculation
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        
        /*clear button - 16*/
        if tag == 16{
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        /*back button - 19*/
        if tag == 19{
            let num = resultLabel.text!.dropLast()
            numberOnScreen = Double(num) ?? 0.0
            resultLabel.text = String(num)
        }
        
        if(!(resultLabel.text?.isEmpty)!){ // if nothing is entered on the screen
        /* operation +(14) - (13) / (11) x (12) = 15 % 18 .17*/

            if ((tag == 11 || tag == 12 || tag == 13 || tag == 14 || tag == 17 || tag == 18) && (resultLabel.text != "x" && resultLabel.text != "-" && resultLabel.text != "+" && resultLabel.text != "/" && resultLabel.text != "%")){ // for checking the operation
                
                isPerformingOperation = true
                previousNumber = Double(resultLabel.text!)!
                operation = tag
                if tag == 11 { // divide
                    resultLabel.text = "/"
                } else if tag == 12{ // multiplication
                    resultLabel.text = "x"
                }else if tag == 13{ // subtraction
                    resultLabel.text = "-"
                }else if tag == 14{ // addition
                    resultLabel.text = "+"
                }else if tag == 17{ // percentage
                    if(!(resultLabel.text?.contains("."))!) // checking if result do not contains dot operator
                    {
                        resultLabel.text = resultLabel.text! + "."
                        numberOnScreen = Double(resultLabel.text!)!
                        isDecimal = true
                        
                    }
                }else if tag == 18 { // for percentage
                    isPerformingOperation = true
                    resultLabel.text = String(Double(resultLabel.text!)!/100)
                }
            }else if tag == 15{ //=
                //check operation
                if operation == 11{ // check operation for divide
                    
                    if(isDecimal == true){
                        resultLabel.text = String(previousNumber/numberOnScreen)
                    }else{ // for removing decimal for non decimal number
                        resultLabel.text = String(previousNumber/numberOnScreen)
                        let num = resultLabel.text!.dropLast(2)
                        resultLabel.text = String(num)
                    }

                }else if operation == 12{ // check operation for multiplication
                    if(isDecimal == true){
                        resultLabel.text = String(previousNumber*numberOnScreen)
                    }else{ // for removing decimal for non decimal number
                        resultLabel.text = String(previousNumber*numberOnScreen)
                        let num = resultLabel.text!.dropLast(2)
                        resultLabel.text = String(num)
                    }
                }else if operation == 13{ // check operation for subtraction
                    if(isDecimal == true){
                        resultLabel.text = String(previousNumber-numberOnScreen)
                    }else{ // for removing decimal for non decimal number
                        resultLabel.text = String(previousNumber-numberOnScreen)
                        let num = resultLabel.text!.dropLast(2)
                        resultLabel.text = String(num)
                    }
                }else if operation == 14{ // check operation for addition
                    if(isDecimal == true){
                        resultLabel.text = String(previousNumber+numberOnScreen)
                    }else{ // for removing decimal for non decimal number
                        resultLabel.text = String(previousNumber+numberOnScreen)
                        let num = resultLabel.text!.dropLast(2)
                        resultLabel.text = String(num)
                    }
                }
            }
        }
    }

}




// for button borderwidth , radius and bordercolor
@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}



