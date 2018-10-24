//
//  Weathers.swift
//
//  Created by adika on 10/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Weathers: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let latitude = "latitude"
    static let minutely = "minutely"
    static let timezone = "timezone"
    static let daily = "daily"
    static let currently = "currently"
    static let offset = "offset"
    static let longitude = "longitude"
    static let hourly = "hourly"
    static let flags = "flags"
  }

  // MARK: Properties
  public var latitude: Float?
  public var minutely: Minutely?
  public var timezone: String?
  public var daily: Daily?
  public var currently: Currently?
  public var offset: Int?
  public var longitude: Float?
  public var hourly: Hourly?
  public var flags: Flags?

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
    latitude = json[SerializationKeys.latitude].float
    minutely = Minutely(json: json[SerializationKeys.minutely])
    timezone = json[SerializationKeys.timezone].string
    daily = Daily(json: json[SerializationKeys.daily])
    currently = Currently(json: json[SerializationKeys.currently])
    offset = json[SerializationKeys.offset].int
    longitude = json[SerializationKeys.longitude].float
    hourly = Hourly(json: json[SerializationKeys.hourly])
    flags = Flags(json: json[SerializationKeys.flags])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = latitude { dictionary[SerializationKeys.latitude] = value }
    if let value = minutely { dictionary[SerializationKeys.minutely] = value.dictionaryRepresentation() }
    if let value = timezone { dictionary[SerializationKeys.timezone] = value }
    if let value = daily { dictionary[SerializationKeys.daily] = value.dictionaryRepresentation() }
    if let value = currently { dictionary[SerializationKeys.currently] = value.dictionaryRepresentation() }
    if let value = offset { dictionary[SerializationKeys.offset] = value }
    if let value = longitude { dictionary[SerializationKeys.longitude] = value }
    if let value = hourly { dictionary[SerializationKeys.hourly] = value.dictionaryRepresentation() }
    if let value = flags { dictionary[SerializationKeys.flags] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.latitude = aDecoder.decodeObject(forKey: SerializationKeys.latitude) as? Float
    self.minutely = aDecoder.decodeObject(forKey: SerializationKeys.minutely) as? Minutely
    self.timezone = aDecoder.decodeObject(forKey: SerializationKeys.timezone) as? String
    self.daily = aDecoder.decodeObject(forKey: SerializationKeys.daily) as? Daily
    self.currently = aDecoder.decodeObject(forKey: SerializationKeys.currently) as? Currently
    self.offset = aDecoder.decodeObject(forKey: SerializationKeys.offset) as? Int
    self.longitude = aDecoder.decodeObject(forKey: SerializationKeys.longitude) as? Float
    self.hourly = aDecoder.decodeObject(forKey: SerializationKeys.hourly) as? Hourly
    self.flags = aDecoder.decodeObject(forKey: SerializationKeys.flags) as? Flags
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(latitude, forKey: SerializationKeys.latitude)
    aCoder.encode(minutely, forKey: SerializationKeys.minutely)
    aCoder.encode(timezone, forKey: SerializationKeys.timezone)
    aCoder.encode(daily, forKey: SerializationKeys.daily)
    aCoder.encode(currently, forKey: SerializationKeys.currently)
    aCoder.encode(offset, forKey: SerializationKeys.offset)
    aCoder.encode(longitude, forKey: SerializationKeys.longitude)
    aCoder.encode(hourly, forKey: SerializationKeys.hourly)
    aCoder.encode(flags, forKey: SerializationKeys.flags)
  }

}
