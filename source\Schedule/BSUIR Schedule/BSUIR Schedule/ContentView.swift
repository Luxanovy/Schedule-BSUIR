//
//  ContentView.swift
//  BSUIR Schedule
//
//  Created by Илья on 11/26/20.
//

import SwiftUI

struct ContentView: View {
    var model: Model
    
    @State var isOnToggle = false
    @State var weekIndex = 0
    @State var dayIndex = 0
    @State var item = 0
    var week = ["1", "2", "3", "4"]
    var day = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб"]

    var body: some View {
        VStack{
                
            Text(self.model.scheduleGroup[0].studentGroup.name).font(Font.system(.headline))
            Picker(selection: $weekIndex, label: Text("")){
                ForEach(0..<week.count){
                    Text(self.week[$0]).tag($0)
                    }
            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.vertical, 5)
            
            Picker(selection: Binding(get: {self.dayIndex}, set: { newValue in
                                self.dayIndex = newValue
                                self.item = 0
                            }), label: Text("")){
                ForEach(0..<day.count){
                    Text(self.day[$0])
                    
                    }
            }.pickerStyle(SegmentedPickerStyle()).frame(height: 20).padding(.horizontal,5)
            
//            Picker(selection: Binding(get: {self.$dayIndex}, set: { newValue in
//                self.$dayIndex = newValue
//                self.$iter = 0
//            }),label: Text("")){
//                ForEach(0..<day.count){
//                    Text(self.week[$0]).tag($0)
//                    }
//            }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(.vertical, 5)
          
            
            }
        
        //let numberWeek = week[weekIndex]
        //let numberDay = day[dayIndex]
        
        
        let numberLessons = self.model.scheduleGroup[0].schedules[dayIndex].schedule.count
        //if numberWeek == self.model.scheduleGroup[0].schedules[dayIndex].schedule[item]
        
            Form{
                List(0..<numberLessons){ item in
                    HStack{
                        
                        Text(self.model.scheduleGroup[0].schedules[dayIndex].schedule[item].subject)
                        
                        //Text(numberLessons.description)
                        Spacer()
                    }
                }
            }
        }
    

    init(model: Model) {
        self.model = model
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}


