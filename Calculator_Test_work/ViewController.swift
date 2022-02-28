//
//  ViewController.swift
//  Calculator_Test_work
//
//  Created by Yulia on 2/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    var memoryBuffer: Int = 0
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }

        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18 && sender.tag != 19 && sender.tag != 21 && sender.tag != 22 && sender.tag != 23 && sender.tag != 24 {
            firstNum = Double(result.text!)!

            if sender.tag == 12 { //минус
                result.text = "-"
            }
            else if sender.tag == 13 { //плюс
                result.text = "+"
            }
            else if sender.tag == 14 { //умножение
                result.text = "x"
            }
            else if sender.tag == 15 { //деление
                result.text = "/"
            }
            else if sender.tag == 17 { //умножение
                result.text = "("
            }
            else if sender.tag == 16 { //деление
                result.text = ")"
            }
            
            operation = sender.tag
            mathSign = true
        }
        else if sender.tag == 11 {
            //11 - равно
            if operation == 12 {
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 13 {
                result.text = String(firstNum + numberFromScreen)
            }
            else if operation == 14 {
                result.text = String(firstNum * numberFromScreen)
            }
            else if operation == 15 {
                result.text = String(firstNum / numberFromScreen)
            }
        }
        
        else if sender.tag == 11 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        
        else if sender.tag == 19 {
            // удаление всего
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
        
        else if sender.tag == 20 { //MS - записать текущий результат в память
            memoryBuffer = Int(result.text!)!
        }
        else if sender.tag == 21 { //MR  - вызвать значение из памяти на экран
            result.text = String(memoryBuffer)
        }
        else if sender.tag == 22 { //MC - очистить ячейку памяти
            memoryBuffer = 0
        }
        else if sender.tag == 23 { //M+ - добавить текущий результат к значению в памяти
            let resultInt = memoryBuffer + Int(result.text!)!
            result.text = String(resultInt)
        }
        else if sender.tag == 24 { //M- - вычесть текущий результат из значения в памяти
            let resultMinus = memoryBuffer - Int(result.text!)!
            result.text = String(resultMinus)
        }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
            /////


}

