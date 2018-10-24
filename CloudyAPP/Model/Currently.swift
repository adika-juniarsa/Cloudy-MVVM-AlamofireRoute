//
//  Currently.swift
//
//  Created by adika on 10/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Currently: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let time = "time"
    static let icon = "icon"
    static let precipProbability = "precipProbability"
    static let pressure = "pressure"
    static let humidity = "humidity"
    static let nearestStormDistance = "nearestStormDistance"
    static let visibility = "visibility"
    static let precipIntensity = "precipIntensity"
    static let windSpeed = "windSpeed"
    static let summary = "summary"
    static let uvIndex = "uvIndex"
    static let nearestStormBearing = "nearestStormBearing"
    static let ozone = "ozone"
    static let temperature = "temperature"
    static let dewPoint = "dewPoint"
    static let apparentTemperature = "apparentTemperature"
    static let windGust = "windGust"
    static let windBearing = "windBearing"
    static let cloudCover = "cloudCover"
  }

  // MARK: Properties
  public var time: Int?
  public var icon: String?
  public var precipProbability: Int?
  public var pressure: Float?
  public var humidity: Float?
  public var nearestStormDistance: Int?
  public var visibility: Int?
  public var precipIntensity: Int?
  public var windSpeed: Float?
  public var summary: String?
  public var uvIndex: Int?
  public var nearestStormBearing: Int?
  public var ozone: Float?
  public var temperature: Float?
  public var dewPoint: Float?
  public var apparentTemperature: Float?
  public var windGust: Float?
  public var windBearing: Int?
  public var cloudCover: Float?

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
    time = json[SerializationKeys.time].int
    icon = json[SerializationKeys.icon].string
    precipProbability = json[SerializationKeys.precipProbability].int
    pressure = json[SerializationKeys.pressure].float
    humidity = json[SerializationKeys.humidity].float
    nearestStormDistance = json[SerializationKeys.nearestStormDistance].int
    visibility = json[SerializationKeys.visibility].int
    precipIntensity = json[SerializationKeys.precipIntensity].int
    windSpeed = json[SerializationKeys.windSpeed].float
    summary = json[SerializationKeys.summary].string
    uvIndex = json[SerializationKeys.uvIndex].int
    nearestStormBearing = json[SerializationKeys.nearestStormBearing].int
    ozone = json[SerializationKeys.ozone].float
    temperature = json[SerializationKeys.temperature].float
    dewPoint = json[SerializationKeys.dewPoint].float
    apparentTemperature = json[SerializationKeys.apparentTemperature].float
    windGust = json[SerializationKeys.windGust].float
    windBearing = json[SerializationKeys.windBearing].int
    cloudCover = json[SerializationKeys.cloudCover].float
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = time { dictionary[SerializationKeys.time] = value }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = precipProbability { dictionary[SerializationKeys.precipProbability] = value }
    if let value = pressure { dictionary[SerializationKeys.pressure] = value }
    if let value = humidity { dictionary[SerializationKeys.humidity] = value }
    if let value = nearestStormDistance { dictionary[SerializationKeys.nearestStormDistance] = value }
    if let value = visibility { dictionary[SerializationKeys.visibility] = value }
    if let value = precipIntensity { dictionary[SerializationKeys.precipIntensity] = value }
    if let value = windSpeed { dictionary[SerializationKeys.windSpeed] = value }
    if let value = summary { dictionary[SerializationKeys.summary] = value }
    if let value = uvIndex { dictionary[SerializationKeys.uvIndex] = value }
    if let value = nearestStormBearing { dictionary[SerializationKeys.nearestStormBearing] = value }
    if let value = ozone { dictionary[SerializationKeys.ozone] = value }
    if let value = temperature { dictionary[SerializationKeys.temperature] = value }
    if let value = dewPoint { dictionary[SerializationKeys.dewPoint] = value }
    if let value = apparentTemperature { dictionary[SerializationKeys.apparentTemperature] = value }
    if let value = windGust { dictionary[SerializationKeys.windGust] = value }
    if let value = windBearing { dictionary[SerializationKeys.windBearing] = value }
    if let value = cloudCover { dictionary[SerializationKeys.cloudCover] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.time = aDecoder.decodeObject(forKey: SerializationKeys.time) as? Int
    self.icon = aDecoder.decodeObject(forKey: SerializationKeys.icon) as? String
    self.precipProbability = aDecoder.decodeObject(forKey: SerializationKeys.precipProbability) as? Int
    self.pressure = aDecoder.decodeObject(forKey: SerializationKeys.pressure) as? Float
    self.humidity = aDecoder.decodeObject(forKey: SerializationKeys.humidity) as? Float
    self.nearestStormDistance = aDecoder.decodeObject(forKey: SerializationKeys.nearestStormDistance) as? Int
    self.visibility = aDecoder.decodeObject(forKey: SerializationKeys.visibility) as? Int
    self.precipIntensity = aDecoder.decodeObject(forKey: SerializationKeys.precipIntensity) as? Int
    self.windSpeed = aDecoder.decodeObject(forKey: SerializationKeys.windSpeed) as? Float
    self.summary = aDecoder.decodeObject(forKey: SerializationKeys.summary) as? String
    self.uvIndex = aDecoder.decodeObject(forKey: SerializationKeys.uvIndex) as? Int
    self.nearestStormBearing = aDecoder.decodeObject(forKey: SerializationKeys.nearestStormBearing) as? Int
    self.ozone = aDecoder.decodeObject(forKey: SerializationKeys.ozone) as? Float
    self.temperature = aDecoder.decodeObject(forKey: SerializationKeys.temperature) as? Float
    self.dewPoint = aDecoder.decodeObject(forKey: SerializationKeys.dewPoint) as? Float
    self.apparentTemperature = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperature) as? Float
    self.windGust = aDecoder.decodeObject(forKey: SerializationKeys.windGust) as? Float
    self.windBearing = aDecoder.decodeObject(forKey: SerializationKeys.windBearing) as? Int
    self.cloudCover = aDecoder.decodeObject(forKey: SerializationKeys.cloudCover) as? Float
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(time, forKey: SerializationKeys.time)
    aCoder.encode(icon, forKey: SerializationKeys.icon)
    aCoder.encode(precipProbability, forKey: SerializationKeys.precipProbability)
    aCoder.encode(pressure, forKey: SerializationKeys.pressure)
    aCoder.encode(humidity, forKey: SerializationKeys.humidity)
    aCoder.encode(nearestStormDistance, forKey: SerializationKeys.nearestStormDistance)
    aCoder.encode(visibility, forKey: SerializationKeys.visibility)
    aCoder.encode(precipIntensity, forKey: SerializationKeys.precipIntensity)
    aCoder.encode(windSpeed, forKey: SerializationKeys.windSpeed)
    aCoder.encode(summary, forKey: SerializationKeys.summary)
    aCoder.encode(uvIndex, forKey: SerializationKeys.uvIndex)
    aCoder.encode(nearestStormBearing, forKey: SerializationKeys.nearestStormBearing)
    aCoder.encode(ozone, forKey: SerializationKeys.ozone)
    aCoder.encode(temperature, forKey: SerializationKeys.temperature)
    aCoder.encode(dewPoint, forKey: SerializationKeys.dewPoint)
    aCoder.encode(apparentTemperature, forKey: SerializationKeys.apparentTemperature)
    aCoder.encode(windGust, forKey: SerializationKeys.windGust)
    aCoder.encode(windBearing, forKey: SerializationKeys.windBearing)
    aCoder.encode(cloudCover, forKey: SerializationKeys.cloudCover)
  }

}
