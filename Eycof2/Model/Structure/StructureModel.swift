
import Foundation


struct StructureModel: Codable, Hashable {
    
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
    
    init(id: Int?,
         name: String?,
         expansion: String?,
         age: String?,
         cost: CostStructure?,
         build_time: Int?,
         hit_points: Int?,
         line_of_sight: Int?,
         armor: String?,
         special: [String]?) {
        self.id = id
        self.name = name
        self.expansion = expansion
        self.age = age
        self.cost = cost
        self.build_time = build_time
        self.hit_points = hit_points
        self.line_of_sight = line_of_sight
        self.armor = armor
        self.special = special
    }
}
class StResult {
    var stResult = [StructureModel]()
}
