//
//  WatchlistEntity.swift
//  MessageApp
//
//  Created by Iqbal Nur Haq on 22/12/23.
//

//import Foundation
//import CoreData
//
//public class WatchlistEntity: NSManagedObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name, email
//    }
//
//    required convenience public init(from decoder: Decoder) throws {
//        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
//            throw DecoderConfigurationError.missingManagedObjectContext
//        }
//
//        self.init(context: context)
//
//        let container  = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.email = try container.decode(String.self, forKey: .email)
//
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//        try container.encode(email, forKey: .email)
//    }
//}
//
//extension CodingUserInfoKey {
//    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
//}
//
//enum DecoderConfigurationError: Error {
//    case missingManagedObjectContext
//}
//
//extension WatchlistEntity {
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchlistEntity> {
//        return NSFetchRequest<WatchlistEntity>(entityName: "WatchlistEntity")
//    }
//
//    @NSManaged public var name: String?
//    @NSManaged public var email: String?
//}
