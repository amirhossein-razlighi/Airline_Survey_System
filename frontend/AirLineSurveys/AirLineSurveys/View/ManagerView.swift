//
//  ManagerView.swift
//  AirLineSurveys
//
//  Created by Amirhossein Razlighi on 29/01/2023.
//

import SwiftUI

enum VOTER_TYPE: String {
    case ECONOMY = "Economy"
    case BUSINESS = "Business"
    case ALL = "All"
}

enum GENDER: String {
    case MALE = "Male"
    case FEMALE = "Female"
}

struct ManagerView: View {
    @State var ticketNumber: String = ""
    @State var flightNumber: String = ""
    @State var seatNumber: Int = 0
    @State var price: Float = 0.0
    @State var voterType: VOTER_TYPE = VOTER_TYPE.ECONOMY
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var passportNumber: String = ""
    @State var gender: GENDER = GENDER.MALE
    var body: some View {
        //show a scroll view with 3 parts: 1- Add a passenger 2- delete a passenger 3- update a passenger
        ZStack {
            Color.gray
                .opacity(0.5)
                .ignoresSafeArea()
            
            NavigationView {
                Form {
                    Section(header: Text("Add new passenger")) {
                        VStack {
                            HStack {
                                Text("Ticket Number: ")
                                TextField("ticket number", text: $ticketNumber)
                            }
                            
                            HStack {
                                Text("Flight Number:")
                                TextField("flight number", text: $flightNumber)
                            }
                            
                            HStack {
                                Text("Seat number: ")
                                TextField("seat number", value: $seatNumber, formatter: NumberFormatter())
                            }
                            
                            
                            HStack {
                                Text("Price: ")
                                TextField("Price", value: $price, formatter: NumberFormatter())
                            }

                           
                            Picker("Voter Type: ", selection: $voterType) {
                                        Text(VOTER_TYPE.ECONOMY.rawValue).tag(VOTER_TYPE.ECONOMY)
                                        Text(VOTER_TYPE.BUSINESS.rawValue).tag(VOTER_TYPE.BUSINESS)
                                        Text(VOTER_TYPE.ALL.rawValue).tag(VOTER_TYPE.ALL)
                                }
                            
                            HStack {
                                Text("Enter first name: ")
                                TextField("First Name", text: $firstName)
                            }
                            
                            HStack {
                                Text("Enter last name: ")
                                TextField("Last Name", text: $lastName)
                            }
                            HStack {
                                Text("Passport Number:")
                                TextField("Pass num. ", text: $passportNumber)
                            }

                            Picker("Gender: ", selection: $gender) {
                                    Text(GENDER.MALE.rawValue).tag(GENDER.MALE)
                                    Text(GENDER.FEMALE.rawValue).tag(GENDER.FEMALE)
                                }
                        }
                    }

                    Section(header: Text("Passengers")) {
                        NavigationLink("Show all passengers") {
                            EmptyView()
                        }
                    }

                }
            }
           
            }
        }
    }

struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
