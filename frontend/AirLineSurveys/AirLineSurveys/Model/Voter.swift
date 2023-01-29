//
//  Voter.swift
//  AirLineSurveys
//
//  Created by Amirhossein Razlighi on 29/01/2023.
//

import Foundation


// voter is a struct which should be used to store the passengers
// properties: voter_id, ticket_number, flight_number, seat_number, price, voter_type,
// first_name, last_name, passport_number, gender

struct Voter: Codable {
    let voter_id: Int
    let ticket_number: Int
    let flight_number: Int
    let seat_number: Int
    let price: Int
    let voter_type: String
    let first_name: String
    let last_name: String
    let passport_number: String
    let gender: String
}
