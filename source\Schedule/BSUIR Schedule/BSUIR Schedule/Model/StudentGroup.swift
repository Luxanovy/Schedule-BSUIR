//
//  StudentGroup.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/26/20.
//

import Foundation

struct StudentGroup{
    public var name: String
    public var facultyId: Int
    public var specialityDepartmentEducationFormId: Int
    public var course: Int
    public var id: Int
    public var calendarId: String
    
    init(dictionary: Dictionary<String, Any>) {
            self.name = dictionary["name"] as? String ?? ""
            self.facultyId = dictionary["facultyId"] as? Int ?? -1
            self.specialityDepartmentEducationFormId = dictionary["specialityDepartmentEducationFormId"] as? Int ?? -1
            self.course = dictionary["course"] as? Int ?? -1
            self.id = dictionary["id"] as? Int ?? -1
            self.calendarId = dictionary["calendarId"] as? String ?? ""
        }
}
