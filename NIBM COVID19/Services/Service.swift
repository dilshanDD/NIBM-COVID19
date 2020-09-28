
import Firebase
import GeoFire
import CoreLocation
import FirebaseAuth


let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_USER_LOCATIONS = DB_REF.child("locations")

struct Service {
    

    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    let username = Auth.auth().currentUser?.displayName
    
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    func updateUserProfileWithImage(imageUrl: String, username: String, uIndex:String, country: String){
        
        return REF_USERS.child(currentUid ?? "").updateChildValues(["image":imageUrl, "fullName":username,"Index":uIndex,"country":country])
    }
    
    func updateUserTemparature(temparature: String){        
        return REF_USERS.child(currentUid ?? "").updateChildValues(["temparature":temparature])
    }
    
    func updateQA(QA: Int){
        return REF_USERS.child(currentUid ?? "").updateChildValues(["QA":QA])
    }
    func updateQB(QB: Int){
        return REF_USERS.child(currentUid ?? "").updateChildValues(["QB":QB])
    }
    func updateQC(QC: Int){
        return REF_USERS.child(currentUid ?? "").updateChildValues(["QC":QC])
    }
    func updateQD(QD: Int){
        return REF_USERS.child(currentUid ?? "").updateChildValues(["QD":QD])
    }

    func fetchUsersLocation(location: CLLocation, completion: @escaping(User) -> Void) {
           let geoFire = GeoFire(firebaseRef: REF_USER_LOCATIONS)

           REF_USER_LOCATIONS.observe(.value) { (snapshot) in
               geoFire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
                   self.fetchUserData(uid: uid) { (user) in
                       var driver = user
                       driver.location = location
                       completion(driver)
                   }
               })
           }
       }
    
    
    
}
