# ASCalendar
The new calendar pod for SwiftUI projects!

![](https://github.com/smirnovaleksei/ASCalendar/blob/master/video-calendar.gif)
### iOS version 
13.0<

### Instalation
> pod 'ASCalendar', :git => 'https://github.com/smirnovaleksei/ASCalendar.git'
### Usage

```swift
  Button(action: {
      self.isPresented.toggle()
  }, label: {
      Text("Choose dates")
  })
  .calendarSheet(startDate: "01.01.2020", endDate: "31.12.2021",
                 isPresented: self.$isPresented,
                 configuration: MyCalendarStyle(),
                 action: { (firstSelectedDate, secondSelectedDate) in
      self.firstSelectedDate = firstSelectedDate
      self.secondSelectedDate = secondSelectedDate
  })
```

### License
ASCalendar is available under the MIT license. See the LICENSE file for more info.

### Contacts

Aleksei Smirnov
alekseiismirnovv@gmail.com
