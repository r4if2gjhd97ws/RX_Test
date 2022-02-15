import UIKit
import RxSwift
import RxCocoa

let relay = BehaviorRelay(value: ["Item 1"])

var value = relay.value
value.append("Item 2")
value.append("Item 3")
relay.accept(value)

relay.accept(relay.value + ["Item 5"])

relay.subscribe {

  print($0)
}
