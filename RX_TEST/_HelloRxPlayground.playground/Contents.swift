import UIKit
import RxSwift

let observable = Observable.just(1)
let observable2 = Observable.of(1, 2, 3)
let observable3 = Observable.of([1, 2, 3])
let observable4 = Observable.from([1, 2, 3, 4, 5])

print("observable4")
observable4.subscribe { event in
  print(event)

  if let element = event.element {
    print(element)
  }
}
print("\n")

print("observable3")
observable3.subscribe { event in
  print(event)
  if let element = event.element {
    print(element)
  }
}

print("\n")

observable4.subscribe(onNext: { element in
  print(element)
})

print("\n")

let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
  .subscribe {
    print($0)
  }.disposed(by: disposeBag)

Observable<String>.create { observer in
  observer.onNext("A")
  observer.onCompleted()
  observer.onNext("?")
  return Disposables.create()
}.subscribe(onNext: {
  print($0)
}, onError: {
  print($0)
}, onCompleted: {
  print("Completed")
}, onDisposed: {
  print("Disposed")
}).disposed(by: disposeBag)
