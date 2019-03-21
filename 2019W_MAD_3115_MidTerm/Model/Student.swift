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
    var studentBirthdate: Date
    var studentmarks = [0.0, 0.0, 0.0, 0.0, 0.0]
    var StudentPercentage: Int!
    var StudentTotal: Double!
    var StudentGrade: String!
    
    init(studId: String, studName: String, studGender: String, studCourse: String, studEmail: String, studBirth: Date, studmark: [Double]){
        self.studentID = studId
        self.studentName = studName
        self.studentGender = studGender
        self.studentCourse = studCourse
        self.studentEmail = studEmail
        self.studentBirthdate = studBirth
        self.studentmarks = studmark
    }
    
}
