import UIKit
import RxSwift

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
  print(event)
}
subject.onNext("Issue 2")
subject.onNext("Issue 3")


subject.onCompleted()
subject.onNext("Issue 4")


print("\n")

let subj = BehaviorSubject(value: "Initial Value")

subj.onNext("Last Issue")

subj.subscribe { event in
  print(event)
}

subj.onNext("Issue 1")


print("\n")
let sub1 = ReplaySubject<String>.create(bufferSize: 2)

sub1.onNext("Issue 1")
sub1.onNext("Issue 2")
sub1.onNext("Issue 3")

sub1.subscribe {
  print($0)
}

sub1.onNext("Issue 4")
sub1.onNext("Issue 5")
sub1.onNext("Issue 6")

print("[Subscription 2]")

sub1.subscribe {
  print($0)
}


print("\n")


let variable = Variable([String]())
variable.value = ["Hello World"]

variable.value.append("Item 1")

variable.asObservable().subscribe {
  print($0)
}

variable.value.append("Item 2")


