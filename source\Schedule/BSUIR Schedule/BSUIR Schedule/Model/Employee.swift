//
//  Employee.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/26/20.
//

import Foundation

struct Employee
{
    public var firstName: String
    public var lastName: String
    public var middleName: String
    public var rank: String
    public var photoLink: String
    public var calendarId: String
    public var academicDepartment: String
    public var id: Int
    public var fio: String
    
    init(dictionary: Dictionary<String, Any>) {
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.middleName = dictionary["middleName"] as? String ?? ""
        self.rank = dictionary["rank"] as? String ?? ""
        self.photoLink = dictionary["photoLink"] as? String ?? ""
        self.id = dictionary["id"] as? Int ?? -1
        self.calendarId = dictionary["calendarId"] as? String ?? ""
        self.fio = dictionary["fio"] as? String ?? ""
        self.academicDepartment = dictionary["academicDepartment"] as? String ?? ""
    }
}
