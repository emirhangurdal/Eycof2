
import Foundation

struct TechModel: Codable, Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let expansion: String?
    let age: String?
    let develops_in: String?
    let cost: CostTech?
    let build_time: Int?
    let applies_to: [String]?
    
    init(id: Int,
     name: String,
     description: String,
     expansion: String,
     age: String,
     develops_in: String,
     cost: CostTech,
     build_time: Int,
     applies_to: [String]) {
        self.id = id
        self.name = name
        self.description = description
        self.expansion = expansion
        self.age = age
        self.develops_in = develops_in
        self.cost = cost
        self.build_time = build_time
        self.applies_to = applies_to
    }
}
class TechResult {
    var techResult = [TechModel]()
}

