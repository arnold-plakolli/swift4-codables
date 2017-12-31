import Foundation

let json: [String: Any] = [
    "users": [
        [
            "first_name": "Adam",
            "last_name": "Sandler",
            "age": 23
        ],
        [
            "first_name": "John",
            "last_name": "Wick",
            "age": 24
        ]
    ]
]

let data = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)

class User: Codable {
    
    let firstName: String
    let lastName: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case age = "age"
    }
    
}

class Users: Codable {
    
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "users"
    }
    
}

if let decodedJson = try? JSONDecoder().decode(Users.self, from: data) {
    for user in decodedJson.users {
        print("\(user.firstName) \(user.lastName)")
    }
}


























