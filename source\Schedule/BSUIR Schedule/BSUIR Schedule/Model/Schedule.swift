//
//  Schedule.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/26/20.
//

import Foundation

struct Schedule{
    public var WeekDay: String
    public var schedule: [ScheduleCurrent] = []
    
    init(dictionary: Dictionary<String, Any>) {
        self.WeekDay = dictionary["weekDay"] as? String ?? ""
        
        if let ScheduleArray = dictionary["schedule"] as? [Dictionary<String, Any>] {
           
            for dict in ScheduleArray {
                let tempSchedule = ScheduleCurrent(dictionary: dict)
                self.schedule.append(tempSchedule)
            }
        }

    }
}
