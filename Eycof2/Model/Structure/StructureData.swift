
import Foundation


struct StructureData: Codable {
    let structures: [Structure]?
}

struct Structure: Codable {
    let id: Int?
    let name: String?
    let expansion: String?
    let age:  String?
    let cost: CostStructure?
    let build_time: Int?
    let hit_points: Int?
    let line_of_sight: Int?
    let armor: String?
    let special: [String]?
}

struct CostStructure: Codable, Hashable {
    let Wood: Int?
    let Stone: Int?
    let Gold: Int?
    let Food: Int?
}

/*
 
 API Response
 {
     "id": 1,
     "name": "Barracks",
     "expansion": "Age of Kings",
     "age": "Dark",
     "cost": {
         "Wood": 175
     },
     "build_time": 50,
     "hit_points": 1200,
     "line_of_sight": 5,
     "armor": "0/7",
     "special": [
         "Garrison: 10 created units"
     ]
 }
 
 */
