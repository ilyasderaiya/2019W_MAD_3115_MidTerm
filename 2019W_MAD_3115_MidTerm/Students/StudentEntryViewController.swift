//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet var txtStudId: UIView!
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

   

}
