//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    

    
    @IBOutlet weak var txtStudId: UITextField!
    @IBOutlet weak var txtStudName: UITextField!
    @IBOutlet weak var txtStudGender: UITextField!
    @IBOutlet weak var txtStudCourse: UITextField!
    @IBOutlet weak var txtStudEmail: UITextField!
    @IBOutlet weak var txtStudBirthDate: UITextField!
    @IBOutlet weak var txtStudSub1: UITextField!
    @IBOutlet weak var txtStudSub2: UITextField!
    @IBOutlet weak var txtStudSub3: UITextField!
    @IBOutlet weak var txtStudSub4: UITextField!
    @IBOutlet weak var txtStudSub5: UITextField!
    var myPickerView : UIPickerView!
    var datePicker : UIDatePicker!
    var courseList = ["MADT", "MODT", "CSD", "WADT"]
    var selected = 0
    var subMarks = [0.0, 0.0, 0.0, 0.0, 0.0]
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtStudCourse.delegate = self
        self.txtStudBirthDate.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogoutClick(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(signInVC, animated: true)
    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.isEqual(txtStudCourse){
            selected = 1
            self.coursepicker(textField)
        }else{
            selected = 2
            self.datepick(textField)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courseList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courseList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtStudCourse.text = courseList[row]
    }
    
    
    

    func coursepicker(_ textField : UITextField){
        
       
        self.myPickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.myPickerView.delegate = self
        self.myPickerView.dataSource = self
        self.myPickerView.backgroundColor = UIColor.white
        textField.inputView = self.myPickerView
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(txtStudCourse.resignFirstResponder))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(StudentEntryViewController.Cancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    
    func datepick(_ textField : UITextField){
        
       
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
       
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
       
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(StudentEntryViewController.Date))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(StudentEntryViewController.Cancel))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func Cancel(){
        if selected == 1{
            txtStudCourse.resignFirstResponder()
        }else{
            txtStudBirthDate.resignFirstResponder()
        }
    }
    @objc func Date(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        txtStudBirthDate.text = dateFormatter1.string(from: datePicker.date)
        txtStudBirthDate.resignFirstResponder()
    }

    @IBAction func btnSubmitClick(_ sender: Any) {
        if ((txtStudId.text?.isEmpty)!) || ((txtStudName.text?.isEmpty)!) || ((txtStudGender.text?.isEmpty)!) || ((txtStudEmail.text?.isEmpty)!) || ((txtStudBirthDate.text?.isEmpty)!) || ((txtStudCourse.text?.isEmpty)!)
        {
            // Alert
        }
        
        subMarks[0] = Double(txtStudSub1.text!)!
        subMarks[1] = Double(txtStudSub2.text!)!
        subMarks[2] = Double(txtStudSub3.text!)!
        subMarks[3] = Double(txtStudSub4.text!)!
        subMarks[4] = Double(txtStudSub5.text!)!
        let s = Student(studId: txtStudId.text!, studName: txtStudName.text!, studGender: txtStudGender.text!, studCourse: txtStudCourse.text!, studEmail: txtStudEmail.text!, studBirth: txtStudBirthDate.text!, studmark: subMarks)
        s.calc()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let studResultVC = sb.instantiateViewController(withIdentifier: "StudentResultViewController") as! StudentResultViewController
        studResultVC.s = s
        //self.navigationController?.pushViewController(studResultVC, animated: true)
        self.present(studResultVC, animated: true)
    }
    
}
