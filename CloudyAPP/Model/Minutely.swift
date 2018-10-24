//
//  Minutely.swift
//
//  Created by adika on 10/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Minutely: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let summary = "summary"
    static let icon = "icon"
    static let data = "data"
  }

  // MARK: Properties
  public var summary: String?
  public var icon: String?
  public var data: [Data]?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    summary = json[SerializationKeys.summary].string
    icon = json[SerializationKeys.icon].string
    if let items = json[SerializationKeys.data].array { data = items.map { Data(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = summary { dictionary[SerializationKeys.summary] = value }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.summary = aDecoder.decodeObject(forKey: SerializationKeys.summary) as? String
    self.icon = aDecoder.decodeObject(forKey: SerializationKeys.icon) as? String
    self.data = aDecoder.decodeObject(forKey: SerializationKeys.data) as? [Data]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(summary, forKey: SerializationKeys.summary)
    aCoder.encode(icon, forKey: SerializationKeys.icon)
    aCoder.encode(data, forKey: SerializationKeys.data)
  }

}
