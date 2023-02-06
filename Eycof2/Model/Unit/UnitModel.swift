
import Foundation

struct UnitModel: Codable, Hashable {
    
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
    
    init(id: Int?,
    name: String?,
    description: String?,
    expansion: String?,
    age: String?,
    created_in: String?,
    cost: Cost?,
    build_time: Int?,
    reload_time: Double?,
    movement_rate: Double?,
    line_of_sight: Int?,
    hit_points: Int?,
    attack: Int?,
    armor: String?,
    attack_bonus: [String]?) {
        self.id = id
        self.name = name
        self.description = description
        self.expansion = expansion
        self.age = age
        self.created_in = created_in
        self.cost = cost
        self.build_time = build_time
        self.reload_time = reload_time
        self.movement_rate = movement_rate
        self.line_of_sight = line_of_sight
        self.hit_points = hit_points
        self.attack = attack
        self.armor = armor
        self.attack_bonus = attack_bonus
    }
}

