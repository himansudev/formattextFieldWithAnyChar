//
//  ViewController.swift
//  debitCard
//
//  Created by Himansu Sekhar Panigrahi on 18/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit



class x:NSObject {
    
    
    var count = 0
    
    
    func formatTextfield(textField:UITextField,charToInSert:String,posOfInsertion :[Int],isExpiryType:Bool) {
        
        var tempPosOfInsertion = posOfInsertion.sorted()
        
        for i in 0...tempPosOfInsertion.count - 1 {
            tempPosOfInsertion[i] += 1
        }
        
        
        if isdeletionInrogressV_1(textField: textField) {
            if count > noOfOccurences(char: "-", string: textField.text!) {
                
                count -= 1
                
            }
            print("*********")
            
        }
        else {
            
            if isExpiryType {
                
                
                let dateFromatter = DateFormatter()
                dateFromatter.dateFormat = "YY"
                let monthMaxValue = Int(dateFromatter.string(from: Date()))! + 15
                
                
                
                if textField.text!.count == 2 {
                    
                    if Int(getValuesAt(text: textField.text!, index: [0,1]))! >= 12 {
                        textField.text?.removeLast()
                        
                    }
                    
                }
                else if (textField.text!.count == 5 && Int(getValuesAt(text: textField.text!, index: [3,4]))! > monthMaxValue) {
                    textField.text?.removeLast()
                }
                else {
                    if(tempPosOfInsertion.count-1 >= count) {
                        
                        
                        
                        if textField.text!.count == tempPosOfInsertion[count] && textField.text!.count != 0 {
                            count += 1
                            print("++++++ : ",count)
                            var tfText = textField.text!
                            let lastChar = String(tfText.removeLast())
                            tfText += charToInSert
                            tfText += lastChar
                            textField.text = tfText
                            
                            updateCurrTextAndPreviousTxt(textField: textField)
                        }
                        
                    }
                }
                
                
                
            }
            else {
                if(tempPosOfInsertion.count-1 >= count) {
                    
                    
                    
                    if textField.text!.count == tempPosOfInsertion[count] && textField.text!.count != 0 {
                        count += 1
                        print("++++++ : ",count)
                        var tfText = textField.text!
                        let lastChar = String(tfText.removeLast())
                        tfText += charToInSert
                        tfText += lastChar
                        textField.text = tfText
                        
                        updateCurrTextAndPreviousTxt(textField: textField)
                    }
                    
                }
            }
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    func getValuesAt(text:String,index:[Int]) -> String {
        let tftext = Array(text)
        var result = String()
        for i in index.sorted() {
            result += String(tftext[i])
            
        }
        return result
    }
    
    
    var previousTxt:String?
    var currTxt:String?
    
    func isdeletionInrogressV_1(textField:UITextField) -> Bool {
        
        let tfText = textField.text!
        
        previousTxt = currTxt
        
        currTxt = tfText
        
        
        
        if currTxt!.count < previousTxt?.count ?? -1 {
            
            return true
            
        }
        else {
            
            return false
        }
        
        
    }
    
    
    func updateCurrTextAndPreviousTxt(textField:UITextField) {
        previousTxt = currTxt
        
        currTxt = textField.text!
        
    }
    
    
    func noOfOccurences(char:String,string:String) -> Int {
        
        let charArray = Array(string)
        var count = 0
        for c in charArray {
            if String(c) == char {
                count += 1
            }
        }
        return count
    }
    
    
    
    
    
    
}




class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf.addTarget(self, action: #selector(textFieldAction(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    
    
    
  
    
    
    
    @objc func textFieldAction(_ textField: UITextField) {

        let charToInsert = "-"
        let posOfInsertion = [2]
       
        let m = x()
        
        m.formatTextfield(textField: textField, charToInSert: charToInsert, posOfInsertion: posOfInsertion, isExpiryType:false)
        
       
        
    }
    

        
//        var count = 0
//        func formatTextfield(textField:UITextField,charToInSert:String,posOfInsertion :[Int],isExpiryType:Bool) {
//
//            var tempPosOfInsertion = posOfInsertion.sorted()
//
//            for i in 0...tempPosOfInsertion.count - 1 {
//                tempPosOfInsertion[i] += 1
//            }
//
//
//            if isdeletionInrogressV_1(textField: textField) {
//                if count > noOfOccurences(char: "-", string: textField.text!) {
//
//                    count -= 1
//
//                }
//
//            }
//            else {
//
//                if isExpiryType {
//
//
//                    let dateFromatter = DateFormatter()
//                    dateFromatter.dateFormat = "YY"
//                    let monthMaxValue = Int(dateFromatter.string(from: Date()))! + 15
//
//
//
//                    if textField.text!.count == 2 {
//
//                        if Int(getValuesAt(text: textField.text!, index: [0,1]))! >= 12 {
//                            textField.text?.removeLast()
//
//                        }
//
//                    }
//                    else if (textField.text!.count == 5 && Int(getValuesAt(text: textField.text!, index: [3,4]))! > monthMaxValue) {
//                            textField.text?.removeLast()
//                    }
//                    else {
//                        if(tempPosOfInsertion.count-1 >= count) {
//
//
//
//                            if textField.text!.count == tempPosOfInsertion[count] && textField.text!.count != 0 {
//                                count += 1
//                                print("++++++ : ",count)
//                                var tfText = textField.text!
//                                let lastChar = String(tfText.removeLast())
//                                tfText += charToInSert
//                                tfText += lastChar
//                                textField.text = tfText
//
//                                updateCurrTextAndPreviousTxt(textField: textField)
//                            }
//
//                        }
//                    }
//
//
//
//                }
//                else {
//                    if(tempPosOfInsertion.count-1 >= count) {
//
//
//
//                        if textField.text!.count == tempPosOfInsertion[count] && textField.text!.count != 0 {
//                            count += 1
//                            print("++++++ : ",count)
//                            var tfText = textField.text!
//                            let lastChar = String(tfText.removeLast())
//                            tfText += charToInSert
//                            tfText += lastChar
//                            textField.text = tfText
//
//                            updateCurrTextAndPreviousTxt(textField: textField)
//                        }
//
//                    }
//                }
//
//
//
//
//
//            }
//
//
//
//
//        }
//
//
//    func getValuesAt(text:String,index:[Int]) -> String {
//        let tftext = Array(text)
//        var result = String()
//        for i in index.sorted() {
//            result += String(tftext[i])
//
//        }
//        return result
//    }
//
//
//    var previousTxt:String?
//    var currTxt:String?
//
//    func isdeletionInrogressV_1(textField:UITextField) -> Bool {
//
//        let tfText = textField.text!
//
//        previousTxt = currTxt
//
//        currTxt = tfText
//
//
//
//        if currTxt!.count < previousTxt?.count ?? -1 {
//
//            return true
//
//        }
//        else {
//
//            return false
//        }
//
//
//    }
//
//
//    func updateCurrTextAndPreviousTxt(textField:UITextField) {
//        previousTxt = currTxt
//
//        currTxt = textField.text!
//
//    }
//
//
//    func noOfOccurences(char:String,string:String) -> Int {
//
//        let charArray = Array(string)
//        var count = 0
//        for c in charArray {
//            if String(c) == char {
//                count += 1
//            }
//        }
//        return count
//    }
//
//
//
//
    
    
    
    
    
    
    
    
    
    
}
    
    
    
//------Perfecct for debit --------
   

//    @objc func textFieldAction(_ textField: UITextField) {
//
//        if isdeletionInrogressV_1(textField: textField) {
//
//        }
//        else {
//
//            if textField.text!.count % 5 == 0 && textField.text!.count != 0{
//                var tfText = textField.text!
//                let lastChar = String(tfText.removeLast())
//                tfText += "-"
//                tfText += lastChar
//                textField.text = tfText
//
//                updateCurrTextAndPreviousTxt(textField: textField)
//            }
//
//        }
//
//
//
//    }
//
//
//
//    var previousTxt:String?
//    var currTxt:String?
//
//    func isdeletionInrogressV_1(textField:UITextField) -> Bool {
//
//        let tfText = textField.text!
//
//        previousTxt = currTxt
//
//        currTxt = tfText
//
//
//
//        if currTxt!.count < previousTxt?.count ?? -1 {
//
//            return true
//
//        }
//        else {
//
//            return false
//        }
//
//
//    }
//
//
//    func updateCurrTextAndPreviousTxt(textField:UITextField) {
//        previousTxt = currTxt
//
//        currTxt = textField.text!
//
//    }
//
//
//
    
    
    
    //-------------------Separator -----------------
    
//      @objc func textFieldAction(_ textField: UITextField) {
//
//
//
//
//
//
//
//
//            //----------------------
//
//    //
//    //        if !isdeletionInrogressV_1(textField: textField) {
//    //
//    //            formatTextFieldForDebitCardNo(tf: textField, string: getLastChar(textField: textField))
//    //        }
//    //
//    //
//    //
//    //
//    //
//    //        //Adds - besides text
//
//        }
    
    
    
    
    
    
//
//    func removeStr(string:String,character:String) -> String {
//
//        return string.replacingOccurrences(of: character, with: "")
//    }
//
//
//    func isDeletionInProgress(textField:UITextField) -> Bool {
//
//        let tfText = textField.text!
//
//        previousTxt = currTxt
//
//        currTxt = removeStr(string: tfText, character: "-")
//
//        if previousTxt != "" && currTxt != "" {
//
//            var prvTxt = previousTxt
//
//            prvTxt?.removeLast()
//
//
//
//            if(prvTxt == currTxt || (prvTxt?.count == 0 && currTxt == "")) {
//                return true
//            }
//            else {
//                return false
//            }
//        }
//        else {
//            return false
//        }
//
//    }
//
    
//
//    func deleteSpecialChars(textField:UITextField) {
//
//
//        print(textField.text!.count)
//
//        if textField.text!.count % 5 == 0 && textField.text?.count != 0 {
//            textField.text?.removeLast()
//        }
//    }
//
//
//    func isMassDeletionHappening() {
//
//    }
//
//
//    func getLastChar(textField:UITextField) -> String{
//        var tfText = textField.text!
//
//
//
//          var string = String()
//          if tfText != "" {
//              string = String(tfText.removeLast())
//          }
//
//
//
//
//        return string
//
//    }
    
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        formatTextFieldForDebitCardNo(tf: textField, string: string)
//
//
//        return true
//    }
    

    
    
    
//
//    func formatTextFieldForDebitCardNo(tf:UITextField,string:String) {
//
//        var tfText:String!
//
//
//        tfText = tf.text
//
//
//
//
//        let filtredText = removeStr(string: tfText, character: "-")
//
//
//        let textLength = filtredText.count
//
//
//
//        if textLength % 4 == 0 && textLength != 0 {
//
//            tf.text! = tfText + "-"
//
//            self.updateCurrTextAndPreviousTxt(textField: tf)
//
//            print("SKKK")
//            printTxt()
//
//        }
//    }
    
  
    

