//
//  ShowAllPassengers.swift
//  AirLineSurveys
//
//  Created by Amirhossein Razlighi on 29/01/2023.
//

import SwiftUI

struct ShowAllPassengers: View {
    @State var voters: [Voter] = []
    
    var body: some View {
        var managerId = 1
        
        NavigationView {
            List {
                ForEach(self.voters, id:\.voter_id) { voter in
                    NavigationLink(destination: EmptyView()) {
                        HStack {
                            
                            Image(systemName: "person.fill")
                                .resizable()
                                .foregroundColor(.cyan)
                                .frame(width: 25, height: 25)
                            
                            VStack(alignment: .leading) {
                                Text("\(voter.first_name) \(voter.last_name)")
                                    .font(.headline)
                                Text("\(voter.voter_type)")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            Image(systemName: "airplane")
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Ticket Num: \(voter.ticket_number)")
                                    .font(.subheadline)
                                Text(" Flight Num: \(voter.flight_number)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onDelete {_ in
                    //TODO
                }
            }
            .toolbar {
                EditButton()
            }
            .onAppear(perform: {
                    // send request to server
                    guard let url: URL = URL(string: "http://localhost8080/api/manager/\(managerId)") else {
                        print("invalid URL")
                        return
                    }
                    
                    var urlRequest: URLRequest = URLRequest(url: url)
                    urlRequest.httpMethod = "GET"
                    URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                        // check if response is okay
                        
                        guard let data = data else {
                            print("invalid response")
                            return
                        }
                        
                        // convert JSON response into class model as an array
                        do {
                            self.voters = try JSONDecoder().decode([Voter].self, from: data)
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                    }).resume()
                })
        }
    
    }
}

struct ShowAllPassengers_Previews: PreviewProvider {
    static var previews: some View {
        ShowAllPassengers(voters: [Voter(voter_id: 1, ticket_number: 2, flight_number: 3, seat_number: 4, price: 5, voter_type: "Economic", first_name: "Amirhossein", last_name: "Raz", passport_number: "12ds", gender: "Male")])
    }
}
