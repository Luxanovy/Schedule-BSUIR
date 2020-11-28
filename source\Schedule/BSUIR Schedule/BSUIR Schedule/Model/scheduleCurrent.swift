//
//  scheduleCurrent.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/27/20.
//

import Foundation

struct ScheduleCurrent{
    public var WeekNumber: [Int] = []
    public var StudentGroup: [String] = []
    public var numSubgroup: Int
    public var auditory: [String] = []
    public var LessonTime: String
    public var StartLessonTime: String
    public var EndLessonTime: String
    public var subject: String
    public var lessonType: String
    public var employee: [Employee] = []
    public var zaoch: String
    
    init(dictionary: Dictionary<String, Any>) {
        self.WeekNumber = dictionary["weekNumber"] as? [Int] ?? []
        self.StudentGroup = dictionary["studentGroup"] as? [String] ?? []
        self.numSubgroup = dictionary["numSubgroup"] as? Int ?? -1
        self.auditory = dictionary["auditory"] as? [String] ?? []
        self.LessonTime = dictionary["lessonTime"] as? String ?? ""
        self.StartLessonTime = dictionary["startLessonTime"] as? String ?? ""
        self.EndLessonTime = dictionary["endLessonTime"] as? String ?? ""
        self.subject = dictionary["subject"] as? String ?? ""
        self.lessonType = dictionary["lessonType"] as? String ?? ""
        self.zaoch = dictionary["zaoch"] as? String ?? ""
       
        if let employeeArray = dictionary["employee"] as? [Dictionary<String, Any>] {
            for dict in employeeArray {
                let tempEmployee = Employee(dictionary: dict)
                self.employee.append(tempEmployee)
            }
        }
        
        if let weekArray = dictionary["weekNumber"] as? [Int] {
            for dictWeek in weekArray {
                self.WeekNumber.append(dictWeek)
            }
        }
        
        if let groupArray = dictionary["studentGroup"] as? [String] {
            for dictGroup in groupArray {
                self.StudentGroup.append(dictGroup)
            }
        }
        
        if let auditoryArray = dictionary["auditory"] as? [String] {
            for dictAuditory in auditoryArray {
                self.auditory.append(dictAuditory)
            }
        }
    }
}
