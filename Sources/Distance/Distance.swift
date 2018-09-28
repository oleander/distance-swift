import Foundation

public struct Distance: CustomStringConvertible, Comparable {
  static public let zero = Distance(km: 0)
  
  public let meter: Double

  public init(meter: Double) {
    self.meter = meter
  }

  public init(km: Double) {
    self.init(meter: km * 1000.0)
  }

  public init(meter: Int) {
    self.init(meter: Double(meter))
  }

  public init(km: Int) {
    self.init(km: Double(km))
  }

  public static func + (lhs: Distance, rhs: Distance) -> Distance {
    return Distance(meter: lhs.meter + rhs.meter)
  }

  public static func < (lhs: Distance, rhs: Distance) -> Bool {
    return lhs.meter < rhs.meter
  }

  public static func == (lhs: Distance, rhs: Distance) -> Bool {
    return Int(lhs.meter) == Int(rhs.meter)
  }

  public static func * (lhs: Distance, rhs: Distance) -> Distance {
    return Distance(meter: lhs.meter * rhs.meter)
  }

  public static func * (lhs: Distance, rhs: Double) -> Distance {
    return Distance(meter: lhs.meter * rhs)
  }

  public static func / (lhs: Distance, rhs: Double) -> Distance {
    return Distance(meter: lhs.meter / rhs)
  }

  public var abs: Distance {
    return Distance(meter: Swift.abs(meter))
  }

  public static func / (lhs: Distance, rhs: Distance) -> Distance {
    return Distance(meter: lhs.meter / rhs.meter)
  }

  public static func - (lhs: Distance, rhs: Distance) -> Distance {
    return Distance(meter: lhs.meter - rhs.meter)
  }

  public var description: String {
    if meter <= 1000 {
      return String(Int(nearest(Distance(meter: 100)).meter)) + " meters"
    } else {
      return String(Int(nearest(Distance(km: 1)).km)) + "km"
    }
  }

  public var isZero: Bool {
    return nearest(Distance(meter: 100)).meter < 500
  }

  public var km: Double {
    return meter / 1000.0
  }

  public func nearest(_ distance: Distance = Distance(km: 10)) -> Distance {
    return Distance(meter: Int(round(meter / distance.meter)) * Int(distance.meter))
  }
}
