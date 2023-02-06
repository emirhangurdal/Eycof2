import UIKit

struct CivModel: Codable, Hashable {
    let id: Int?
    let name: String?
    let expansion: String?
    let army_type: String?
    let unique_unit: [String]?
    let unique_tech: [String]?
    let team_bonus: String?
    let civilization_bonus: [String]?
    var image = Data()
    
    init(id: Int?,
         name: String?,
         expansion: String?,
         army_type: String?,
         unique_unit: [String]?,
         unique_tech: [String]?,
         team_bonus: String?,
         civilization_bonus: [String],
         image: Data) {
        self.id = id
        self.name = name
        self.expansion = expansion
        self.army_type = army_type
        self.unique_unit = unique_unit
        self.unique_tech = unique_tech
        self.team_bonus = team_bonus
        self.civilization_bonus = civilization_bonus
        self.image = image
    }
}
class CivResult {
    var civResult = [CivModel]()
}
