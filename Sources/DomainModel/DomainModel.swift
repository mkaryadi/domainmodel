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
    
    func convert(_ curr: String) -> Money {
        var returnAmount: Double
        if curr != self.currency {
            switch self.currency {
            // Convert the money to USD first
            case "GBP":
                returnAmount = Double(self.amount) * 2
            case "EUR":
                returnAmount = (Double(self.amount) * 2) / 3
            case "CAD":
                returnAmount = (Double(self.amount) * 4) / 3
            default:
                returnAmount = Double(self.amount)
            }
            switch curr {
            // Convert to the desired currency and return the Money as a result
            case "GBP":
                return Money(amount: Int((returnAmount / 2).rounded()), currency: "GBP")
            case "EUR":
                return Money(amount: Int((returnAmount * 1.5).rounded()), currency: "EUR")
            case "CAD":
                return Money(amount: Int((returnAmount * 1.25).rounded()), currency: "CAD")
            default:
                return Money(amount: Int(returnAmount.rounded()), currency: "USD")
            }
        } else {
            return self
        }
    }
    
}

////////////////////////////////////
// Job
//
public class Job {
    public enum JobType {
        case Hourly(Double)
        case Salary(UInt)
    }
}

////////////////////////////////////
// Person
//
public class Person {
}

////////////////////////////////////
// Family
//
public class Family {
}
