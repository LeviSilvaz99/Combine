import UIKit
import Combine

//sink eh um tipo de subscribers como o ASSIGN E ONRECEIVE(SOMENTE NO SWIFTUI)
//subscribers recebem os valores enviados pelos publishers

let array = [1,2,3,4,5,6].publisher.sink { value in
    print(value)
}


// PasstroughtSubject
// envia eventos pra quantos subscribers passives

let passthroughSubject = PassthroughSubject<String, Never>()

let subscriber = passthroughSubject.sink { value in
    print("\(value)")
}

passthroughSubject.send("NEW EVENT 1")
passthroughSubject.send("NEW EVENT 2")

let subscriber2 = passthroughSubject
    .map{ "\($0) do proximo subscriber"}
    .sink { print($0) }

//currentvaluesubject
//necessita que seja inserido um calor inicial
//ele guarda o ultimo valor que foi enviado pra ele

let valueSubject = CurrentValueSubject<String, Never>("Initial Value")
valueSubject.send("Value 1")
valueSubject.send("Value 2")

let _ = valueSubject.sink { value in
    print("\(value)")
}
