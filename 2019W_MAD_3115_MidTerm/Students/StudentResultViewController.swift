//
//  StudentResultViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentResultViewController: UIViewController {
    var s = Student()
    @IBOutlet weak var lblStudId: UILabel!
    @IBOutlet weak var lblStudName: UILabel!
    @IBOutlet weak var lblStudGender: UILabel!
    @IBOutlet weak var lblStudCourse: UILabel!
    @IBOutlet weak var lblStudEmail: UILabel!
    @IBOutlet weak var lblStudBirt: UILabel!
    @IBOutlet weak var lblStudMark1: UILabel!
    @IBOutlet weak var lblStudMark2: UILabel!
    @IBOutlet weak var lblStudMark3: UILabel!
    @IBOutlet weak var lblStudMark4: UILabel!
    @IBOutlet weak var lblStudMark5: UILabel!
    @IBOutlet weak var lblStudTotal: UILabel!
    @IBOutlet weak var lblStudPercent: UILabel!
    @IBOutlet weak var lblStudGrade: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Details()
        // Do any additional setup after loading the view.
    }
    
    func Details(){
        
        lblStudId.text = s.studentID
        lblStudName.text = s.studentName
        lblStudGender.text = s.studentGender
        lblStudCourse.text = s.studentCourse
        lblStudEmail.text = s.studentEmail
        lblStudBirt.text = s.studentBirthdate
        lblStudMark1.text = String(s.studentmarks[0])
        lblStudMark2.text = String(s.studentmarks[1])
        lblStudMark3.text = String(s.studentmarks[2])
        lblStudMark4.text = String(s.studentmarks[3])
        lblStudMark5.text = String(s.studentmarks[4])
        lblStudTotal.text = String(s.studentTotal)
        lblStudPercent.text = String(s.studentPercentage)
        lblStudGrade.text = s.studentGrade
    }
    @IBAction func btnLogoutClick(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(signInVC, animated: true)
    }
    @IBAction func btnBackClick(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let StudVc = sb.instantiateViewController(withIdentifier: "studVC") as! StudentEntryViewController
        self.present(StudVc, animated: true)
    }
    
}
