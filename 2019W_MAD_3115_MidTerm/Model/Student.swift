//
//  Student.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

class Student{
    
    var studentID: String
    var studentName: String
    var studentGender: String
    var studentCourse: String
    var studentEmail: String
    var studentBirthdate: String
    var studentmarks = [0.0, 0.0, 0.0, 0.0, 0.0]
    var studentPercentage: Double!
    var studentTotal: Double! = 0.0
    var studentGrade: String = "F"
    var count = 0
    
    init(){
        self.studentID = String()
        self.studentName = String()
        self.studentGender = String()
        self.studentCourse = String()
        self.studentEmail = String()
        self.studentBirthdate = String()
        self.studentmarks = [0.0, 0.0, 0.0, 0.0, 0.0]
        self.studentPercentage = 0.0
        self.studentTotal = 0.0
    }
    init(studId: String, studName: String, studGender: String, studCourse: String, studEmail: String, studBirth: String, studmark: [Double]){
        self.studentID = studId
        self.studentName = studName
        self.studentGender = studGender
        self.studentCourse = studCourse
        self.studentEmail = studEmail
        self.studentBirthdate = studBirth
        self.studentmarks = studmark
    }
    
    func calc(){
        for i in self.studentmarks{
            if i<45 {
                count += 1
            }else{
                studentTotal += i
            }
        }
        if count >= 2 {
            studentPercentage = 0.0
        }else{
            studentPercentage = (studentTotal/500)*100
            if studentPercentage >= 95{
                studentGrade="A+"
            }
            else if studentPercentage >= 85 && studentPercentage < 95{
                studentGrade="A"
            }
            else if studentPercentage >= 75 && studentPercentage < 85{
                studentGrade="B+"
            }
            else if studentPercentage >= 65 && studentPercentage < 75{
                studentGrade="B"
            }
            else if studentPercentage >= 55 && studentPercentage < 65{
                studentGrade="C+"
            }
            else if studentPercentage >= 50 && studentPercentage < 55{
                studentGrade="C"
            }
            else if studentPercentage >= 45 && studentPercentage < 50{
                studentGrade="D+"
            }
            else{
                studentGrade="FAIL"
            }
        }
    }
    
}
