//
//  Model.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/26/20.
//

import Foundation

class Model {

    public var scheduleGroup: [ScheduleGroup]
    private var url: URL?
    
    private var data: Data?
    
    private var savedURL: URL {
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
        let urlPath = URL(fileURLWithPath: path)
        
        return urlPath
    }
    
    init() {
        self.scheduleGroup = []
        self.url = URL(string: "")
    }
    init(scheduleGroup: [ScheduleGroup], url: URL) {
        self.scheduleGroup = scheduleGroup
        self.url = url
    }
    
    public func getURL() -> URL? {
        return self.url
    }
    
    public func setURL(url: URL) {
        self.url = url
    }
    
    public func loadScheduleGroup(group: String, competitionHandler: (()->Void)?) {
        var components = URLComponents()
        components.scheme = "https"
                    components.host = "journal.bsuir.by"
                    components.path = "/api/v1/studentGroup/schedule"
                    components.queryItems = [
                        URLQueryItem(name: "studentGroup", value: group)
            ]

        self.setURL(url: components.url!)

       let downloadTask = URLSession.shared.dataTask(with: url!) { data, _, _ in
        guard let data = data else {
                        print("Error data")
                        return
                    }
        
        
        do {
            self.data = data
        }
        
        
        let parseGroup = self.parseStudentGroup()
        if parseGroup == nil {
            return
        }

        let parseSchedule = self.parseSchedule()
        if parseSchedule == nil{
            return
        }

        let parseCurrentWeek = self.parseCurrenWeek()
        //print(parseGroup!.name)
        
        let group = ScheduleGroup(studentGroup: parseGroup!, schedules: parseSchedule!, currentWeekNumber: parseCurrentWeek)
        self.scheduleGroup.append(group)
        competitionHandler?()
        }
        
        downloadTask.resume()
    }
    
    public func parseCurrenWeek() ->Int
    {
        let data = self.data
        if data == nil {
            return 0
        }
        let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if rootDictionaryAny == nil {
            return 0
        }
        
        let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
        if rootDictionary == nil {
            return 0
        }
        
        let studentGroupDictionary = rootDictionary!["currentWeekNumber"] as? Int
        if studentGroupDictionary == nil {
            return 0
        }
      
       //print(studentGroupDictionary!)
        
       return studentGroupDictionary!
    }
    
    public func parseStudentGroup() -> StudentGroup? {
        let data = self.data
        if data == nil {
            return nil
        }

        let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        if rootDictionaryAny == nil {
            return nil
        }
        let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
        if rootDictionary == nil {
            return nil
        }

        let studentGroupDictionary = rootDictionary!["studentGroup"] as? Dictionary<String, Any>
        if studentGroupDictionary == nil {
            return nil
        }
        return StudentGroup(dictionary: studentGroupDictionary!)
    }

    public func parseSchedule() -> [Schedule]? {
        let data = self.data
         if data == nil {
             return nil
         }

         let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
        //print(rootDictionaryAny!)
         if rootDictionaryAny == nil {
             return nil
         }
         let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
         if rootDictionary == nil {
             return nil
         }

         if let ScheduleArray = rootDictionary!["schedules"] as? [Dictionary<String, Any>] {
             var schedules: [Schedule] = []

            
            
             for dict in ScheduleArray {
                 let tempSchedule = Schedule(dictionary: dict)
                schedules.append(tempSchedule)
             }
             return schedules
         }
         else {
             return nil
         }
     }
}
