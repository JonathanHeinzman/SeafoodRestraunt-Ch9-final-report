//
//  ReservationForm.swift
//  SeafoodRestraunt Ch9
//
//  Created by Jonathan Heinzman on 4/29/26.
//

import SwiftUI

struct ReservationForm: View {
    // contstants
    let restrauntName = "The Daily Catch Co."
    let maxGuests = 10
    let maxChildren = 5
    // variables
    // State vars: if this value changes, updates the UI
    @State private var userName = ""
    @State private var phoneNumber = ""
    @State private var guestCount = 1
    @State private var previewText = "Nothing yet."
    @State private var occasion = ""
    @State private var childrenCount = 0
    
    // label for guest or guests
    
    func guestLabel(_ count: Int) -> String {
        count == 1 ? "Guest" : "Guests"
    }
    // Adults = 20, children = 10
    func estimateTotal(adult: Int, child: Int) -> Double {
        let adultPrice = 20.0
        let childPrice = 10.0
        return Double(guestCount) * adultPrice + Double(childrenCount) * childPrice
    }
    
    func isValidPhone(phone: String) -> Bool {
        let digits = phone.filter { $0.isNumber }
        return digits.count >= 10
    }
    
    func format(with mask: String, phone: String) -> String {
            let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var result = ""
            var index = numbers.startIndex

            for ch in mask where index < numbers.endIndex {
                if ch == "X" {
                    result.append(numbers[index])
                    index = numbers.index(after: index)
                } else {
                    result.append(ch)
                }
            }
            return result
     }
    
    var body: some View {
        Form{
            // header
            Section{
                HStack{
                    Image(systemName:"fork.knife.circle")
                        .foregroundColor(.blue)
                        .font(.system(size: 40))
                    
                    VStack(alignment: .leading){
                        Text(restrauntName)
                            .font(.title3)
                            .bold()
                        
                        Text("Reservation Form")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical,4)
            }
            // reservation details
            Section(header: Text("Reservation Details")){
                TextField("Name", text: $userName)
                    //.textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                Stepper("\(guestLabel(guestCount)): \(guestCount)", value: $guestCount, in: 1...maxGuests)
                
                if guestCount >= 8 {
                    Text("For large groups, Please call us.")
                        .foregroundColor(.red)
                }
            }
            // contact information
            Section(header: Text("Contact")){
                TextField("Phone", text: $phoneNumber)
                    //.keyboardType(.numberPad)
                    .onChange(of: phoneNumber) { oldValue, newValue in
                        phoneNumber = format(with: "XXX-XXX-XXXX", phone: newValue) // puts hyphens in the phone number
                    }
                
                if phoneNumber.isEmpty {
                    if isValidPhone(phone: phoneNumber){
                        Text("Valid phone number")
                            .foregroundColor(.green)
                    }else {
                        Text("Please enter only 10 digits")
                            .foregroundColor(.red)
                    }
                }
            }
            //optional
            Section(header: Text("Optional")){
                TextField("Occasion (Birthday, Anniversary, etc.)", text: $occasion)
                    //.textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                Stepper("Children: \(childrenCount)", value: $childrenCount, in: 0...maxChildren)
                    if childrenCount > 0 {
                        Text("A kids menu is available")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
            }
            // actions
            Section(header: Text("Actions")){
                Button("Preview reservation info"){
                    previewText = """
                        Name: \(userName)
                        Phone: \(phoneNumber)
                        \(guestLabel(guestCount)): \(guestCount)
                        Occasion: \(occasion)
                        Children: \(childrenCount)
                        """
                }
            }
            // preview information
            Section(header: Text("Preview")){
                Text(previewText.isEmpty ? "No preview yet." : previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.vertical,4)
                    .textSelection(.enabled)
            }
            Section(header:Text("Summary")) {
                VStack{
                    HStack{
                        Text("Reservation Summary")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "text.page.badge.magnifyingglass")
                    }
                    HStack{Text("Name"); Spacer(); Text(userName)}
                    HStack{Text(guestLabel(guestCount)); Spacer(); Text("\(guestCount)")}
                    HStack{Text("Children"); Spacer(); Text("\(childrenCount)")}
                    HStack{
                        Text("Estimated total:")
                        Spacer()
                        Text("$ \(estimateTotal(adult: guestCount, child: childrenCount),specifier:"%.2f")")
                    }
                }
                .padding()
            }
            
            Button("Confirm Your Reservation") {
                print("Your resevation has been sent!")
            }.disabled(userName.isEmpty)
        }
        .navigationTitle("Reservation")
    }
}
    
#Preview {
    NavigationStack{
        ReservationForm()
    }
}

