//
//  DomodedovoTests.swift
//  DomodedovoTests
//
//  Created by Егор on 27.03.2021.
//

import XCTest
@testable import Domodedovo

class DomodedovoTests: XCTestCase {

    var jsonText = """
{
   "serviceProviderHeader":{
      "prefLanguage":"en_US",
      "serviceID":"fmg/lounges/atlanticLounge",
      "bookingID":449543055,
      "extBookingID":"AL1448370465369",
      "bookingStatus":101,
      "currentWizardStep":1
   },
   "serviceFormPage":{
      "id":1,
      "title":"Step 1",
      "wizardStep":1,
      "serviceFormElements":[
         {
            "id":10,
            "title":"1. Date and Flight data",
            "footerText":"",
            "serviceElements":[
               {
                  "id":101,
                  "elementType":"text",
                  "valueDefinition":"Flight number",
                  "value":"LH123",
                  "editable":true,
                  "contentCategory":"flightNr",
                  "contentKey":"departure",
                  "mandatory":true
               },
               {
                  "id":102,
                  "elementType":"date",
                  "valueDefinition":"Day",
                  "value":"1.1.2020",
                  "editable":true,
                  "contentCategory":"date",
                  "contentKey":"departure",
                  "mandatory":true
               },
               {
                  "id":103,
                  "elementType":"time",
                  "valueDefinition":"Departure / arrival time",
                  "value":"17:00",
                  "editable":true,
                  "contentCategory":"time",
                  "contentKey":"departure",
                  "mandatory":true
               }
            ]
         }
      ]
   }
}
"""

    func testDeserialization() throws {
        let data = jsonText.data(using: .utf8)!
        let test = try? JSONDecoder().decode(ServiceRespond.self, from: data)
        XCTAssertNotNil(test)
    }

}
