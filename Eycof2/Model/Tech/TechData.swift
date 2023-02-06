
import Foundation

struct TechData: Codable {
    let technologies: [Tech]?
}

struct Tech: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let expansion: String?
    let age: String?
    let develops_in: String?
    let cost: CostTech?
    let build_time: Int?
    let applies_to: [String]? 
}
struct CostTech: Codable, Hashable {
    let Wood: Int?
    let Food: Int?
    let Stone: Int?
    let Gold: Int?
}



/*
 API Response
 {
   "technologies": [
     {
       "id": 0,
       "name": "string",
       "description": "string",
       "expansion": "string",
       "age": "string",
       "develops_in": "string",
       "cost": {
         "Wood": 0,
         "Food": 0,
         "Stone": 0,
         "Gold": 0
       },
       "build_time": 0,
       "applies_to": [
         "string"
       ]
     }
   ]
 }
*/
