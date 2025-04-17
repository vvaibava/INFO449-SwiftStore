//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {get}
    func price() -> Int
}

class Item: SKU{
    var name: String
    var priceEach: Int
    public init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach =  priceEach
    }
    func price() -> Int{
        return priceEach
    }
}

class Receipt {
    var scannedItems: [SKU]
    public init(scannedItems: [SKU]){
        self.scannedItems = scannedItems
    }
    func add(item: SKU) {
        scannedItems.append(item)
    }
    func items() -> [SKU]{
        return scannedItems
    }
    
    func total() -> Int {
        var sum = 0
        for item in scannedItems {
            sum += item.price()
        }
        return sum
    }

    func output() -> String {
        var lines: [String] = ["Receipt:"]

        for item in scannedItems {
            let formattedPrice = String(format: "%.2f", Double(item.price()) / 100)
            lines.append("\(item.name): $\(formattedPrice)")
        }

        lines.append("------------------")
        let totalFormatted = String(format: "%.2f", Double(total()) / 100)
        lines.append("TOTAL: $\(totalFormatted)")

        return lines.joined(separator: "\n")
    }

}

class Register {
    var receipt = Receipt(scannedItems: [])
    func scan(_ item: SKU){
        receipt.add(item: item)
    }
    
    func subtotal() -> Int{
        let itemTotal = receipt.items()
        var cumTotal = 0
        for i in itemTotal{
            cumTotal += i.price()
        }
        return cumTotal
    }
    
    func total() -> Receipt{
        return receipt
    }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

