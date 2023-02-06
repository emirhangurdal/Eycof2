import Foundation

struct CivData: Codable {
    let civilizations: [Civ]?
}

struct Civ: Codable {
    let id: Int?
    let name: String?
    let expansion: String?
    let army_type: String?
    let unique_unit: [String]?
    let unique_tech: [String]?
    let team_bonus: String?
    let civilization_bonus: [String]?
}
