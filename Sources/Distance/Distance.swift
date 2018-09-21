import Foundation

public struct Distance: CustomStringConvertible, Comparable {
  public let meter: Double
  public static let zero = Distance(km: 0)
  public static let earthRadius = Distance(km: 6378)

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
    if meter == 1 {
      return "1 meter"
    } else if meter < 1000 {
      return "\(Int(meter)) meters"
    } else {
      return "\(Int(meter / 1000.0)) km"
    }
  }

  public var isZero: Bool {
    return Int(km) == 0
  }

  public func isWithin(km: Distance) -> Bool {
    return self < km
  }

  public var km: Double {
    return meter / 1000.0
  }

  public func nearest(_ distance: Distance = Distance(km: 10)) -> Distance {
    return Distance(meter: (Int(meter) / Int(distance.meter)) * Int(distance.meter))
  }
}
