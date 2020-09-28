
import CoreLocation

enum AccountType: Int {
    case student
    case lecturer
}

struct User {
    let firstName: String
    let  lastName : String
    let fullName: String
    let email: String
    var accountType: AccountType!
    var location: CLLocation?
    let uid: String
    let temparature: String
    let country : String
    let QA : Int
    let QB : Int
    let QC : Int
    let QD : Int
    let profilePicUrl : String
    
    
    
    // survey //temp
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullName = dictionary["fullName"] as? String ?? ""
        self.firstName = dictionary["fullName"] as? String ?? ""
        self.lastName = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
              
        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
        self.temparature = dictionary["temparature"] as? String ?? "0.0"
        self.country = dictionary["country"] as? String ?? ""
        self.QA = dictionary["Q1"] as? Int ?? 0
        self.QB = dictionary["Q2"] as? Int ?? 0
        self.QC = dictionary["Q3"] as? Int ?? 0
        self.QD = dictionary["Q4"] as? Int ?? 0
        self.profilePicUrl = dictionary["image"] as? String ?? ""
    }
}
