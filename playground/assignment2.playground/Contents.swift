//: Playground - noun: a place where people can play

import UIKit

//// function rank performs a binary search of a key in a sorted integer array
//func rank(array : [Int], key : Int) -> Int{
//    var low = 0
//    var high = array.count - 1
//    while(low <= high){
//        let mid = low + (high - low)/2
//        if(key < array[mid]) {high = mid - 1}
//        else if(key > array[mid]) {low = mid + 1}
//        else {return mid}
//    }
//    return -1
//}
//
////test
//let array1 = [1,2,3,4,5,6,7,8]
//rank(array: array1, key: 3)
//rank(array: array1, key: 7)
//rank(array: array1, key: 1)
//rank(array: array1, key: 8)
//rank(array: array1, key: 11)

// with recursive call
func rankR(array: [Int], low: Int, high: Int, key: Int) -> Int{
    if(low <= high){
        let mid = low + ( high - low) / 2
        if(key < array[mid]){
            return rankR(array: array, low: low, high: mid - 1, key: key)
        }
        else if(key > array[mid]){
            return rankR(array: array, low: mid + 1, high: high, key: key)
        }
        else{
            return mid
        }
    }
    return -1
}

//test
let array2 = [1,2,3,4,5,6,7,8]
rankR(array: array2, low: 0, high: array2.count - 1, key: 3)
rankR(array: array2, low: 0, high: array2.count - 1, key: 7)
rankR(array: array2, low: 0, high: array2.count - 1, key: 1)
rankR(array: array2, low: 0, high: array2.count - 1, key: 8)
rankR(array: array2, low: 0, high: array2.count - 1, key: 11)



// Fraction class
class Fraction{
    var numerator: Int = 0
    var denomiator: Int = 1
    
    init() {
        self.numerator = 0
        self.denomiator = 1
    }
    init(_ numerator: Int, over denomiator : Int) {
        self.numerator = numerator
        self.denomiator = denomiator
    }
    
    func reduce(){
        let sign = numerator >= 0 ? 1 : -1
        var n = sign * numerator
        var d = denomiator
        var reduceNum = 0
        while(d != 0){
            reduceNum = n % d
            n = d
            d = reduceNum
        }
        numerator /= n
        denomiator /= n
    }
    
    //(V1) no need, if use the global addition function
    func add(_ f : Fraction) -> Fraction{
        let result : Fraction = Fraction()
        result.numerator = numerator * f.denomiator + denomiator * f.numerator
        result.denomiator = denomiator * f.denomiator
        result.reduce()
        return result
    }
    
    func minus(_ f : Fraction) -> Fraction{
        let result : Fraction = Fraction()
        result.numerator = numerator * f.denomiator - denomiator * f.numerator
        result.denomiator = denomiator * f.denomiator
        result.reduce()
        return result
    }
    
    func times(_ f : Fraction) -> Fraction{
        let result : Fraction = Fraction()
        result.numerator = numerator * f.numerator
        result.denomiator = denomiator * f.denomiator
        result.reduce()
        return result
    }
    
    func divide(_ f : Fraction) -> Fraction{
        let result : Fraction = Fraction()
        result.numerator = numerator * f.denomiator
        result.denomiator = f.numerator * denomiator
        result.reduce()
        return result
    }
    
}


//(V2) need to be outside the fraction class as global function
//func addition(_ a : Fraction, _ b : Fraction) -> Fraction{
//    let result : Fraction = Fraction()
//    result.numerator = a.numerator * b.denomiator + a.denomiator * b.numerator
//    result.denomiator = a.denomiator * b.denomiator
//    result.reduce()
//    return result
//    //        return a.add(b)
//}


// test add method
let f1 = Fraction(1, over: 8)
let f2 = Fraction(3, over : 8)
let f3 = f1.add(f2)
//    let f4 = addition(f1,f2)

// test subtraction method
let f5 = Fraction(3, over: 5)
let f6 = Fraction(3, over : 8)
let f7 = f5.minus(f6)

// test multiplication method
let f8 = Fraction(1, over: 8)
let f9 = Fraction(3, over : 11)
let f10 = f8.times(f9)

// test division method
let f11 = Fraction(4, over: 5)
let f12 = Fraction(3, over : 7)
let f13 = f11.divide(f12)
