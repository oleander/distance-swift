@testable import Distance

import Quick
import Nimble

@available(OSX 10.12, *)
class DistanceTests: QuickSpec {
  override func spec() {
    describe("km") {
      it("can compare") {
        expect(Distance(km: 10)).to(equal(Distance(km: 10)))
        expect(Distance(km: 10)).notTo(equal(Distance(km: 11)))
        expect(Distance(km: 10)).to(beLessThan(Distance(km: 11)))
        expect(Distance(km: 10)).to(beGreaterThan(Distance(km: 9)))
      }
    }

    describe("meter") {
      it("can compare") {
        expect(Distance(meter: 10)).to(equal(Distance(meter: 10)))
        expect(Distance(meter: 10)).notTo(equal(Distance(meter: 11)))
        expect(Distance(meter: 10)).to(beLessThan(Distance(meter: 11)))
        expect(Distance(meter: 10)).to(beGreaterThan(Distance(meter: 9)))
      }
    }

    describe("meter & km") {
      it("can compare") {
        expect(Distance(meter: 1000)).to(equal(Distance(km: 1)))
        expect(Distance(meter: 500)).to(equal(Distance(km: 0.5)))
        expect(Distance(meter: 2000)).to(equal(Distance(km: 2)))
      }
    }

    it("can divide") {
      expect(Distance(km: 5) / 2).to(equal(Distance(km: 2.5)))
    }

    it("can add") {
      expect(Distance(km: 5) + Distance(km: 2)).to(equal(Distance(km: 7)))
    }

    it("can multiply") {
      expect(Distance(km: 5) * 2).to(equal(Distance(km: 10)))
    }

    it("can subtract") {
      expect(Distance(km: 5) - Distance(km: 2)).to(equal(Distance(km: 3)))
    }

    it("handles absolute") {
      expect(Distance(km: -5).abs).to(equal(Distance(km: 5)))
      expect(Distance(km: 5).abs).to(equal(Distance(km: 5)))
    }

    it("rounds") {
      expect(Distance(km: 3).nearest(Distance(km: 10))).to(equal(Distance(km: 0)))
      expect(Distance(km: 7).nearest(Distance(km: 10))).to(equal(Distance(km: 10)))
      expect(Distance(km: 3).nearest(Distance(km: 5))).to(equal(Distance(km: 5)))
      expect(Distance(km: 2).nearest(Distance(km: 5))).to(equal(Distance(km: 0)))
    }

    it("calculates zero") {
      expect(Distance(km: 0.3).isZero).to(beTrue())
      expect(Distance(km: 1).isZero).to(beFalse())
      expect(Distance(meter: 0).isZero).to(beTrue())
    }

    it("converts to string") {
      expect(Distance(km: 5).description).to(equal("5km"))
      expect(Distance(km: 2.5).description).to(equal("3km"))
      expect(Distance(meter: 400).description).to(equal("400 meters"))
      expect(Distance(meter: 350).description).to(equal("400 meters"))
      expect(Distance(meter: 1200).description).to(equal("1km"))
    }
  }
}
