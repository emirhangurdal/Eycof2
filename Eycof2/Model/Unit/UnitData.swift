import Foundation

struct UnitData: Codable {
    let unit: Unit?
}

struct Unit: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let expansion: String?
    let age: String?
    let created_in: String?
    let cost: Cost?
    let build_time: Int?
    let reload_time: Double?
    let movement_rate: Double?
    let line_of_sight: Int?
    let hit_points: Int?
    let attack: Int?
    let armor: String?
    let attack_bonus: [String]?
}
struct Cost: Codable, Hashable {
    let Food: Int?
    let Gold: Int?
    let Wood: Int?
}


/*
 
 API Response:
 
 {
   "id": 79,
   "name": "Jaguar Warrior",
   "description": "Aztec unique unit. Attack bonus vs. other infantry",
   "expansion": "The Conquerors",
   "age": "Castle",
   "created_in": "https://age-of-empires-2-api.herokuapp.com/api/v1/structure/castle",
   "cost": {
     "Food": 60,
     "Gold": 30
   },
   "build_time": 17,
   "reload_time": 2.0,
   "movement_rate": 1.0,
   "line_of_sight": 3,
   "hit_points": 50,
   "attack": 10,
   "armor": "1/0",
   "attack_bonus": [
     "+12 eagles",
     "+2 buildings",
     "+10 infantry"
   ]
 }
 */
