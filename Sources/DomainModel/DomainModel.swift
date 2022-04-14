struct DomainModel {
    var text = "Hello, World!"
        // Leave this here; this value is also tested in the tests,
        // and serves to make sure that everything is working correctly
        // in the testing harness and framework.
}

////////////////////////////////////
// Money
//
public struct Money {
    let amount: Int
    let currency: String
    
    func convert(_ to: String) -> Money {
        var returnAmount: Double
        if to != self.currency {
            switch self.currency {
            // Convert the money to USD first
            case "GBP":
                returnAmount = Double(self.amount) * 2
            case "EUR":
                returnAmount = (Double(self.amount) * 2) / 3
            case "CAN":
                returnAmount = (Double(self.amount) * 4) / 5
            default:
                returnAmount = Double(self.amount)
            }
            switch to {
            // Convert to the desired currency and return the Money as a result
            case "GBP":
                return Money(amount: Int((returnAmount / 2).rounded()), currency: "GBP")
            case "EUR":
                return Money(amount: Int((returnAmount * 1.5).rounded()), currency: "EUR")
            case "CAN":
                return Money(amount: Int((returnAmount * 1.25).rounded()), currency: "CAN")
            default:
                return Money(amount: Int(returnAmount.rounded()), currency: "USD")
            }
        } else {
            return self
        }
    }
    
    func add(_ toAdd: Money) -> Money {
        if toAdd.currency == self.currency {
            return Money(amount: self.amount + toAdd.amount, currency: self.currency)
        } else {
            let converted = self.convert(toAdd.currency)
            return Money(amount: converted.amount + toAdd.amount, currency: toAdd.currency)
        }
    }
    
    func subtract(_ toSubtract: Money) -> Money {
        if toSubtract.currency == self.currency {
            return Money(amount: self.amount - toSubtract.amount, currency: self.currency)
        } else {
            let converted = self.convert(toSubtract.currency)
            return Money(amount: self.amount - converted.amount, currency: toSubtract.currency)
        }
    }
}

////////////////////////////////////
// Job
//
public class Job {
    let title: String
    let type: JobType
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
    init(title: String, type: JobType) {
        self.title = title
        self.type = type
    }
}

////////////////////////////////////
// Person
//
public class Person {
    let firstName: String
    let lastName: String
    let age: Int
    var job: Job?
    var spouse: Person?
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

////////////////////////////////////
// Family
//
public class Family {
    var members: [Person]
    
    init(spouse1: Person, spouse2: Person) {
        members = [spouse1, spouse2]
    }
}
