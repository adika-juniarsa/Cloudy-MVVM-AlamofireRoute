//
//  Data.swift
//
//  Created by adika on 10/23/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Data: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let temperatureLow = "temperatureLow"
    static let cloudCover = "cloudCover"
    static let uvIndexTime = "uvIndexTime"
    static let windGustTime = "windGustTime"
    static let apparentTemperatureMinTime = "apparentTemperatureMinTime"
    static let humidity = "humidity"
    static let visibility = "visibility"
    static let temperatureMin = "temperatureMin"
    static let windSpeed = "windSpeed"
    static let temperatureHigh = "temperatureHigh"
    static let uvIndex = "uvIndex"
    static let sunsetTime = "sunsetTime"
    static let apparentTemperatureLowTime = "apparentTemperatureLowTime"
    static let apparentTemperatureMax = "apparentTemperatureMax"
    static let apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
    static let apparentTemperatureMin = "apparentTemperatureMin"
    static let ozone = "ozone"
    static let dewPoint = "dewPoint"
    static let temperatureLowTime = "temperatureLowTime"
    static let moonPhase = "moonPhase"
    static let time = "time"
    static let icon = "icon"
    static let precipIntensityMaxTime = "precipIntensityMaxTime"
    static let precipProbability = "precipProbability"
    static let sunriseTime = "sunriseTime"
    static let apparentTemperatureHighTime = "apparentTemperatureHighTime"
    static let apparentTemperatureLow = "apparentTemperatureLow"
    static let pressure = "pressure"
    static let precipType = "precipType"
    static let temperatureMaxTime = "temperatureMaxTime"
    static let temperatureMinTime = "temperatureMinTime"
    static let precipIntensity = "precipIntensity"
    static let summary = "summary"
    static let precipIntensityMax = "precipIntensityMax"
    static let temperatureMax = "temperatureMax"
    static let windGust = "windGust"
    static let windBearing = "windBearing"
    static let apparentTemperatureHigh = "apparentTemperatureHigh"
    static let temperatureHighTime = "temperatureHighTime"
  }

  // MARK: Properties
  public var temperatureLow: Float?
  public var cloudCover: Float?
  public var uvIndexTime: Int?
  public var windGustTime: Int?
  public var apparentTemperatureMinTime: Int?
  public var humidity: Float?
  public var visibility: Int?
  public var temperatureMin: Float?
  public var windSpeed: Float?
  public var temperatureHigh: Float?
  public var uvIndex: Int?
  public var sunsetTime: Int?
  public var apparentTemperatureLowTime: Int?
  public var apparentTemperatureMax: Float?
  public var apparentTemperatureMaxTime: Int?
  public var apparentTemperatureMin: Float?
  public var ozone: Float?
  public var dewPoint: Float?
  public var temperatureLowTime: Int?
  public var moonPhase: Float?
  public var time: Int?
  public var icon: String?
  public var precipIntensityMaxTime: Int?
  public var precipProbability: Int?
  public var sunriseTime: Int?
  public var apparentTemperatureHighTime: Int?
  public var apparentTemperatureLow: Float?
  public var pressure: Float?
  public var precipType: String?
  public var temperatureMaxTime: Int?
  public var temperatureMinTime: Int?
  public var precipIntensity: Int?
  public var summary: String?
  public var precipIntensityMax: Float?
  public var temperatureMax: Float?
  public var windGust: Float?
  public var windBearing: Int?
  public var apparentTemperatureHigh: Float?
  public var temperatureHighTime: Int?

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
    temperatureLow = json[SerializationKeys.temperatureLow].float
    cloudCover = json[SerializationKeys.cloudCover].float
    uvIndexTime = json[SerializationKeys.uvIndexTime].int
    windGustTime = json[SerializationKeys.windGustTime].int
    apparentTemperatureMinTime = json[SerializationKeys.apparentTemperatureMinTime].int
    humidity = json[SerializationKeys.humidity].float
    visibility = json[SerializationKeys.visibility].int
    temperatureMin = json[SerializationKeys.temperatureMin].float
    windSpeed = json[SerializationKeys.windSpeed].float
    temperatureHigh = json[SerializationKeys.temperatureHigh].float
    uvIndex = json[SerializationKeys.uvIndex].int
    sunsetTime = json[SerializationKeys.sunsetTime].int
    apparentTemperatureLowTime = json[SerializationKeys.apparentTemperatureLowTime].int
    apparentTemperatureMax = json[SerializationKeys.apparentTemperatureMax].float
    apparentTemperatureMaxTime = json[SerializationKeys.apparentTemperatureMaxTime].int
    apparentTemperatureMin = json[SerializationKeys.apparentTemperatureMin].float
    ozone = json[SerializationKeys.ozone].float
    dewPoint = json[SerializationKeys.dewPoint].float
    temperatureLowTime = json[SerializationKeys.temperatureLowTime].int
    moonPhase = json[SerializationKeys.moonPhase].float
    time = json[SerializationKeys.time].int
    icon = json[SerializationKeys.icon].string
    precipIntensityMaxTime = json[SerializationKeys.precipIntensityMaxTime].int
    precipProbability = json[SerializationKeys.precipProbability].int
    sunriseTime = json[SerializationKeys.sunriseTime].int
    apparentTemperatureHighTime = json[SerializationKeys.apparentTemperatureHighTime].int
    apparentTemperatureLow = json[SerializationKeys.apparentTemperatureLow].float
    pressure = json[SerializationKeys.pressure].float
    precipType = json[SerializationKeys.precipType].string
    temperatureMaxTime = json[SerializationKeys.temperatureMaxTime].int
    temperatureMinTime = json[SerializationKeys.temperatureMinTime].int
    precipIntensity = json[SerializationKeys.precipIntensity].int
    summary = json[SerializationKeys.summary].string
    precipIntensityMax = json[SerializationKeys.precipIntensityMax].float
    temperatureMax = json[SerializationKeys.temperatureMax].float
    windGust = json[SerializationKeys.windGust].float
    windBearing = json[SerializationKeys.windBearing].int
    apparentTemperatureHigh = json[SerializationKeys.apparentTemperatureHigh].float
    temperatureHighTime = json[SerializationKeys.temperatureHighTime].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = temperatureLow { dictionary[SerializationKeys.temperatureLow] = value }
    if let value = cloudCover { dictionary[SerializationKeys.cloudCover] = value }
    if let value = uvIndexTime { dictionary[SerializationKeys.uvIndexTime] = value }
    if let value = windGustTime { dictionary[SerializationKeys.windGustTime] = value }
    if let value = apparentTemperatureMinTime { dictionary[SerializationKeys.apparentTemperatureMinTime] = value }
    if let value = humidity { dictionary[SerializationKeys.humidity] = value }
    if let value = visibility { dictionary[SerializationKeys.visibility] = value }
    if let value = temperatureMin { dictionary[SerializationKeys.temperatureMin] = value }
    if let value = windSpeed { dictionary[SerializationKeys.windSpeed] = value }
    if let value = temperatureHigh { dictionary[SerializationKeys.temperatureHigh] = value }
    if let value = uvIndex { dictionary[SerializationKeys.uvIndex] = value }
    if let value = sunsetTime { dictionary[SerializationKeys.sunsetTime] = value }
    if let value = apparentTemperatureLowTime { dictionary[SerializationKeys.apparentTemperatureLowTime] = value }
    if let value = apparentTemperatureMax { dictionary[SerializationKeys.apparentTemperatureMax] = value }
    if let value = apparentTemperatureMaxTime { dictionary[SerializationKeys.apparentTemperatureMaxTime] = value }
    if let value = apparentTemperatureMin { dictionary[SerializationKeys.apparentTemperatureMin] = value }
    if let value = ozone { dictionary[SerializationKeys.ozone] = value }
    if let value = dewPoint { dictionary[SerializationKeys.dewPoint] = value }
    if let value = temperatureLowTime { dictionary[SerializationKeys.temperatureLowTime] = value }
    if let value = moonPhase { dictionary[SerializationKeys.moonPhase] = value }
    if let value = time { dictionary[SerializationKeys.time] = value }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    if let value = precipIntensityMaxTime { dictionary[SerializationKeys.precipIntensityMaxTime] = value }
    if let value = precipProbability { dictionary[SerializationKeys.precipProbability] = value }
    if let value = sunriseTime { dictionary[SerializationKeys.sunriseTime] = value }
    if let value = apparentTemperatureHighTime { dictionary[SerializationKeys.apparentTemperatureHighTime] = value }
    if let value = apparentTemperatureLow { dictionary[SerializationKeys.apparentTemperatureLow] = value }
    if let value = pressure { dictionary[SerializationKeys.pressure] = value }
    if let value = precipType { dictionary[SerializationKeys.precipType] = value }
    if let value = temperatureMaxTime { dictionary[SerializationKeys.temperatureMaxTime] = value }
    if let value = temperatureMinTime { dictionary[SerializationKeys.temperatureMinTime] = value }
    if let value = precipIntensity { dictionary[SerializationKeys.precipIntensity] = value }
    if let value = summary { dictionary[SerializationKeys.summary] = value }
    if let value = precipIntensityMax { dictionary[SerializationKeys.precipIntensityMax] = value }
    if let value = temperatureMax { dictionary[SerializationKeys.temperatureMax] = value }
    if let value = windGust { dictionary[SerializationKeys.windGust] = value }
    if let value = windBearing { dictionary[SerializationKeys.windBearing] = value }
    if let value = apparentTemperatureHigh { dictionary[SerializationKeys.apparentTemperatureHigh] = value }
    if let value = temperatureHighTime { dictionary[SerializationKeys.temperatureHighTime] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.temperatureLow = aDecoder.decodeObject(forKey: SerializationKeys.temperatureLow) as? Float
    self.cloudCover = aDecoder.decodeObject(forKey: SerializationKeys.cloudCover) as? Float
    self.uvIndexTime = aDecoder.decodeObject(forKey: SerializationKeys.uvIndexTime) as? Int
    self.windGustTime = aDecoder.decodeObject(forKey: SerializationKeys.windGustTime) as? Int
    self.apparentTemperatureMinTime = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureMinTime) as? Int
    self.humidity = aDecoder.decodeObject(forKey: SerializationKeys.humidity) as? Float
    self.visibility = aDecoder.decodeObject(forKey: SerializationKeys.visibility) as? Int
    self.temperatureMin = aDecoder.decodeObject(forKey: SerializationKeys.temperatureMin) as? Float
    self.windSpeed = aDecoder.decodeObject(forKey: SerializationKeys.windSpeed) as? Float
    self.temperatureHigh = aDecoder.decodeObject(forKey: SerializationKeys.temperatureHigh) as? Float
    self.uvIndex = aDecoder.decodeObject(forKey: SerializationKeys.uvIndex) as? Int
    self.sunsetTime = aDecoder.decodeObject(forKey: SerializationKeys.sunsetTime) as? Int
    self.apparentTemperatureLowTime = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureLowTime) as? Int
    self.apparentTemperatureMax = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureMax) as? Float
    self.apparentTemperatureMaxTime = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureMaxTime) as? Int
    self.apparentTemperatureMin = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureMin) as? Float
    self.ozone = aDecoder.decodeObject(forKey: SerializationKeys.ozone) as? Float
    self.dewPoint = aDecoder.decodeObject(forKey: SerializationKeys.dewPoint) as? Float
    self.temperatureLowTime = aDecoder.decodeObject(forKey: SerializationKeys.temperatureLowTime) as? Int
    self.moonPhase = aDecoder.decodeObject(forKey: SerializationKeys.moonPhase) as? Float
    self.time = aDecoder.decodeObject(forKey: SerializationKeys.time) as? Int
    self.icon = aDecoder.decodeObject(forKey: SerializationKeys.icon) as? String
    self.precipIntensityMaxTime = aDecoder.decodeObject(forKey: SerializationKeys.precipIntensityMaxTime) as? Int
    self.precipProbability = aDecoder.decodeObject(forKey: SerializationKeys.precipProbability) as? Int
    self.sunriseTime = aDecoder.decodeObject(forKey: SerializationKeys.sunriseTime) as? Int
    self.apparentTemperatureHighTime = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureHighTime) as? Int
    self.apparentTemperatureLow = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureLow) as? Float
    self.pressure = aDecoder.decodeObject(forKey: SerializationKeys.pressure) as? Float
    self.precipType = aDecoder.decodeObject(forKey: SerializationKeys.precipType) as? String
    self.temperatureMaxTime = aDecoder.decodeObject(forKey: SerializationKeys.temperatureMaxTime) as? Int
    self.temperatureMinTime = aDecoder.decodeObject(forKey: SerializationKeys.temperatureMinTime) as? Int
    self.precipIntensity = aDecoder.decodeObject(forKey: SerializationKeys.precipIntensity) as? Int
    self.summary = aDecoder.decodeObject(forKey: SerializationKeys.summary) as? String
    self.precipIntensityMax = aDecoder.decodeObject(forKey: SerializationKeys.precipIntensityMax) as? Float
    self.temperatureMax = aDecoder.decodeObject(forKey: SerializationKeys.temperatureMax) as? Float
    self.windGust = aDecoder.decodeObject(forKey: SerializationKeys.windGust) as? Float
    self.windBearing = aDecoder.decodeObject(forKey: SerializationKeys.windBearing) as? Int
    self.apparentTemperatureHigh = aDecoder.decodeObject(forKey: SerializationKeys.apparentTemperatureHigh) as? Float
    self.temperatureHighTime = aDecoder.decodeObject(forKey: SerializationKeys.temperatureHighTime) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(temperatureLow, forKey: SerializationKeys.temperatureLow)
    aCoder.encode(cloudCover, forKey: SerializationKeys.cloudCover)
    aCoder.encode(uvIndexTime, forKey: SerializationKeys.uvIndexTime)
    aCoder.encode(windGustTime, forKey: SerializationKeys.windGustTime)
    aCoder.encode(apparentTemperatureMinTime, forKey: SerializationKeys.apparentTemperatureMinTime)
    aCoder.encode(humidity, forKey: SerializationKeys.humidity)
    aCoder.encode(visibility, forKey: SerializationKeys.visibility)
    aCoder.encode(temperatureMin, forKey: SerializationKeys.temperatureMin)
    aCoder.encode(windSpeed, forKey: SerializationKeys.windSpeed)
    aCoder.encode(temperatureHigh, forKey: SerializationKeys.temperatureHigh)
    aCoder.encode(uvIndex, forKey: SerializationKeys.uvIndex)
    aCoder.encode(sunsetTime, forKey: SerializationKeys.sunsetTime)
    aCoder.encode(apparentTemperatureLowTime, forKey: SerializationKeys.apparentTemperatureLowTime)
    aCoder.encode(apparentTemperatureMax, forKey: SerializationKeys.apparentTemperatureMax)
    aCoder.encode(apparentTemperatureMaxTime, forKey: SerializationKeys.apparentTemperatureMaxTime)
    aCoder.encode(apparentTemperatureMin, forKey: SerializationKeys.apparentTemperatureMin)
    aCoder.encode(ozone, forKey: SerializationKeys.ozone)
    aCoder.encode(dewPoint, forKey: SerializationKeys.dewPoint)
    aCoder.encode(temperatureLowTime, forKey: SerializationKeys.temperatureLowTime)
    aCoder.encode(moonPhase, forKey: SerializationKeys.moonPhase)
    aCoder.encode(time, forKey: SerializationKeys.time)
    aCoder.encode(icon, forKey: SerializationKeys.icon)
    aCoder.encode(precipIntensityMaxTime, forKey: SerializationKeys.precipIntensityMaxTime)
    aCoder.encode(precipProbability, forKey: SerializationKeys.precipProbability)
    aCoder.encode(sunriseTime, forKey: SerializationKeys.sunriseTime)
    aCoder.encode(apparentTemperatureHighTime, forKey: SerializationKeys.apparentTemperatureHighTime)
    aCoder.encode(apparentTemperatureLow, forKey: SerializationKeys.apparentTemperatureLow)
    aCoder.encode(pressure, forKey: SerializationKeys.pressure)
    aCoder.encode(precipType, forKey: SerializationKeys.precipType)
    aCoder.encode(temperatureMaxTime, forKey: SerializationKeys.temperatureMaxTime)
    aCoder.encode(temperatureMinTime, forKey: SerializationKeys.temperatureMinTime)
    aCoder.encode(precipIntensity, forKey: SerializationKeys.precipIntensity)
    aCoder.encode(summary, forKey: SerializationKeys.summary)
    aCoder.encode(precipIntensityMax, forKey: SerializationKeys.precipIntensityMax)
    aCoder.encode(temperatureMax, forKey: SerializationKeys.temperatureMax)
    aCoder.encode(windGust, forKey: SerializationKeys.windGust)
    aCoder.encode(windBearing, forKey: SerializationKeys.windBearing)
    aCoder.encode(apparentTemperatureHigh, forKey: SerializationKeys.apparentTemperatureHigh)
    aCoder.encode(temperatureHighTime, forKey: SerializationKeys.temperatureHighTime)
  }

}
