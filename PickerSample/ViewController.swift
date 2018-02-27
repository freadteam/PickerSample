//
//  ViewController.swift
//  PickerSample
//
//  Created by Ryo Endo on 2018/02/27.
//  Copyright © 2018年 Ryo Endo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var studioNameTextField: UITextField!
    var studioNamePickerView: UIPickerView = UIPickerView()
    var studioNameArray = ["", "StudioA", "StudioB", "StudioC"]
    
    
    @IBOutlet weak var placeNameTextField: UITextField!
    var placeNamePickerView: UIPickerView = UIPickerView()
    var placeNameArray = ["", "新宿周辺","恵比寿周辺", "横浜周辺"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        studioNamePickerViewFunc()
        placeNamePickerViewFunc()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Done
    @objc func donePressed() {
        view.endEditing(true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return studioNameArray[row]
        case 2:
            return placeNameArray[row]
        default:
            return "hoge"
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return studioNameArray.count
        case 2:
            return placeNameArray.count
        default:
            return 1
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            studioNameTextField.text = studioNameArray[row]
        case 2:
            placeNameTextField.text = placeNameArray[row]
        default:
            break
        }
        
    }
    
    
    func studioNamePickerViewFunc() {
        
        studioNamePickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: studioNamePickerView.bounds.size.height)
        studioNamePickerView.tag = 1
        studioNamePickerView.delegate   = self
        studioNamePickerView.dataSource = self
        
        let vi1 = UIView(frame: studioNamePickerView.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(studioNamePickerView)
        
        studioNameTextField.inputView = vi1
        
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor.black
        let doneButton1   = UIBarButtonItem(title: "選択", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.donePressed))
        let spaceButton1  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar1.setItems([spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        studioNameTextField.inputAccessoryView = toolBar1
        
    }
    
    func placeNamePickerViewFunc() {
        placeNamePickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: placeNamePickerView.bounds.size.height)
        placeNamePickerView.tag = 2
        placeNamePickerView.delegate   = self
        placeNamePickerView.dataSource = self
        
        let vi2 = UIView(frame: placeNamePickerView.bounds)
        vi2.backgroundColor = UIColor.white
        vi2.addSubview(placeNamePickerView)
        
        placeNameTextField.inputView = vi2
        
        let toolBar2 = UIToolbar()
        toolBar2.barStyle = UIBarStyle.default
        toolBar2.isTranslucent = true
        toolBar2.tintColor = UIColor.black
        let doneButton2   = UIBarButtonItem(title: "選択", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.donePressed))
        let spaceButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        toolBar2.setItems([spaceButton2, doneButton2], animated: false)
        toolBar2.isUserInteractionEnabled = true
        toolBar2.sizeToFit()
        placeNameTextField.inputAccessoryView = toolBar2
    }
    
}


