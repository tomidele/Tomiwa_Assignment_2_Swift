import Cocoa

var greeting = "Hello, playground"

let storeLocation = (3, 3)
let storeRange = 2.5

let otherStoreLocation = (8, 8)
let otherStoreRange = 2.5

struct Location {
    var x: Double
    var y: Double
}

// Customer struct

struct Customer {
    var name: String
    var email: String
    var phoneNumber: String
    var acceptedNewsletter: Bool
    var location: Location
    
    // string rep of customer
    func formattedString() -> String {
        return "Name: \(name) Email: \(email)"
    }
    
    //distance btw two locations
    func distance(to location: Location) -> Double {
        let dx = self.location.x - location.x
        let dy = self.location.y - location.y
        return sqrt(dx * dx + dy * dy)
    }
}
// function to generate a list of customers
func generateCustomers() -> [Customer] {
    var customers = [Customer] ()
    
    // Customer data
    let Names = ["Mary Shelley", "Lord Byron", "Jane Austen", "Toni Morrison", "Bell Hooks", "Ta Nehisi Coates", "Elizabeth Gaskell", "Fyodor Dostoyevsky", "Immanuel Kant", "Frederich Nietzche"]
    let Emails = ["mshelley@gmail.com", "lbyron@gmail.com", "jausten@gmail.com", "tmorrison@gmail.com", "bellhooks@gmail.com", "tnehicoates@gmail.com", "egaskell@gmail.com", "fdyevsky@gmail.com", "imkant@gmail.com", "fnietz@gmail.com"]
    let phoneNumbers = ["555-6666", "555-8499", "666-6666", "444-6666", "454-7898", "333-5556", "999-8985", "777-5622", "111-2222", "123-5466"]
    let acceptedNewsletter = [true, false, true, false, true, true, false, true, true, false]
    let customerLocations = [Location(x: 1, y: 2), Location(x: 3, y: 4), Location(x: 5, y: 6), Location(x: 7, y: 8), Location(x: 1, y: 1), Location(x: 1, y: 2), Location(x: 1, y: 1), Location(x: 2, y: 1), Location(x: 3, y: 1), Location(x: 1, y: 2)]
    //populate array with data
    for i in 0..<10 {
        let customer = Customer(name: Names[i], email: Emails[i], phoneNumber: phoneNumbers[i], acceptedNewsletter: acceptedNewsletter[i], location: customerLocations[i])
        customers.append(customer)
    }
    
    return customers
}
// function to print email addresses of customers within a store range
func printCustomersWithinRange(storeLocation: Location, storeRange: Double =  2.5, customers: [Customer]) {
    let storeRange: Double = 2.5
    
    print("Customers within store range:")
    for customer in customers {
        let distance = customer.distance(to: storeLocation)
        if distance <= storeRange {
            print(customer.email)
        }
    }
}

func test() {
    // Generate customers
    let customers = generateCustomers()
    
    // Print customer email list
    print("Customer Email List:")
    for customer in customers {
        print(customer.formattedString())
    }
    
    // Define store location
    let storeLocation = Location(x: 3, y: 3)
    
    // Test printCustomersWithinRange function
    printCustomersWithinRange(storeLocation: storeLocation, storeRange: 2.5, customers: customers)
}

// Call the test function
test()
