
import Foundation

// 캐시
private func solutionP17680(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    let cities = cities.map{$0.lowercased()}
    var cache: [String: Int] = [:]
    var result = 0
    var order = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for city in cities {
        order += 1
        
        if cache.keys.contains(city) {
            cache[city]! = order
            result += 1
        } else {
            if cache.count >= cacheSize {
                var leastRecentKey: String = ""
                var minNum = 9999999
                for (key, value) in cache {
                    if value < minNum {
                        leastRecentKey = key
                        minNum = value
                    }
                }
                cache.removeValue(forKey: leastRecentKey)
            }
            cache[city] = order
            result += 5
        }
    }
    print(result)
    print(cache)
    
    return result
}

//solutionP17680(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"])
//solutionP17680(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"])
//solutionP17680(2, ["Jeju", "Pangyo", "NewYork", "newyork"])
