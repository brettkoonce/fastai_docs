/*
THIS FILE WAS AUTOGENERATED! DO NOT EDIT!
file to edit: 08a_heterogeneous_dictionary.ipynb

*/
        

public protocol HetDictKey: Hashable {
    associatedtype ValueType
    static var defaultValue: ValueType { get }
}


public struct HeterogeneousDictionary {
    private var underlying: [AnyHashable : Any] = [:]
    
    public init() {}
    public init<T: HetDictKey>(_ key: T, _ value: T.ValueType) {
        self.underlying = [key: value]
    }
    public init<T1: HetDictKey, T2: HetDictKey>(_ key1: T1, _ value1: T1.ValueType, _ key2: T2, _ value2: T2.ValueType) {
        self.underlying = [key1: value1, key2: value2]
    }

    public subscript<T: HetDictKey>(key: T) -> T.ValueType {
        get {
            return underlying[key] as! T.ValueType? ?? T.defaultValue
        }
        set(newValue) {
            underlying[key] = newValue as Any
        }
    }
    
    public mutating func merge(_ other: HeterogeneousDictionary,
        uniquingKeysWith combine: (Any, Any) throws -> Any) rethrows {
        try self.underlying.merge(other.underlying, uniquingKeysWith: combine)
    }
}



// Common keys
public struct Accuracy: HetDictKey, Equatable {
    public init() {}
    public static var defaultValue: Float = 0
}

public struct LearningRate: HetDictKey, Equatable {
    public init() {}
    public static var defaultValue: Float = 0.4
}

public struct StepCount: HetDictKey, Equatable {
    public init() {}
    public static var defaultValue = 0
}

