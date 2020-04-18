//
//  ViewController.swift
//  debitCard
//
//  Created by Himansu Sekhar Panigrahi on 18/04/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf.addTarget(self, action: #selector(textFieldAction(_:)), for: UIControl.Event.allEditingEvents)
        
    }
    
    
    
    
  
    
    
    
    @objc func textFieldAction(_ textField: UITextField) {

        let charToInsert = "-"
        let posOfInsertion = 5
        
        formatTextfield(textField: textField, charToInSert: charToInsert, posOfInsrtion: posOfInsertion)
        
    }
    
    
    
    func formatTextfield(textField:UITextField,charToInSert:String,posOfInsrtion :Int) {
        
        if isdeletionInrogressV_1(textField: textField) {
            
        }
        else {
            
            if textField.text!.count % (posOfInsrtion) == 0 && textField.text!.count != 0 {
                
                var tfText = textField.text!
                let lastChar = String(tfText.removeLast())
                tfText += charToInSert
                tfText += lastChar
                textField.text = tfText
                
                updateCurrTextAndPreviousTxt(textField: textField)
            }
            
        }
        
        
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
    
  
    

