import UIKit

import RxSwift
import RxCocoa

let relay = BehaviorRelay(value: ["Item 1"])

relay.accept(["Item 2"])


//relay.value.append("Item 2")


relay.asObservable()
  .subscribe {
    print($0)
}


