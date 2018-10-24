//
//  Flags.swift
//
//  Created by adika on 10/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Flags: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sources = "sources"
    static let nearestStation = "nearest-station"
    static let units = "units"
  }

  // MARK: Properties
  public var sources: [String]?
  public var nearestStation: Float?
  public var units: String?

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
    if let items = json[SerializationKeys.sources].array { sources = items.map { $0.stringValue } }
    nearestStation = json[SerializationKeys.nearestStation].float
    units = json[SerializationKeys.units].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = sources { dictionary[SerializationKeys.sources] = value }
    if let value = nearestStation { dictionary[SerializationKeys.nearestStation] = value }
    if let value = units { dictionary[SerializationKeys.units] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.sources = aDecoder.decodeObject(forKey: SerializationKeys.sources) as? [String]
    self.nearestStation = aDecoder.decodeObject(forKey: SerializationKeys.nearestStation) as? Float
    self.units = aDecoder.decodeObject(forKey: SerializationKeys.units) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(sources, forKey: SerializationKeys.sources)
    aCoder.encode(nearestStation, forKey: SerializationKeys.nearestStation)
    aCoder.encode(units, forKey: SerializationKeys.units)
  }

}
