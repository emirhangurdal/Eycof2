import UIKit


class APIManager {
var imageView = UIImageView()
    
private var images = NSCache<NSString, NSData>()

static let shared = APIManager()
    func baseURL(category: String) -> String {
        return "https://age-of-empires-2-api.herokuapp.com/api/v1/\(category)"
    }
    func getData(category: String, completionHandler: @escaping ([CivModel]) -> Void) {
    
        let url = URL(string: baseURL(category: category))
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
//        request.setValue("Bearer: \()", forHTTPHeaderField: "Authorization")
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = [
//            "Authorization": "Bearer \(K.shared.googleApiKey)"
//        ]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("error?.localizedDescription =\(error?.localizedDescription)")
                return}
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(CivData.self, from: data)
                DispatchQueue.main.async {
                    let civModel = decodedData.civilizations?.map {
                        CivModel(id: $0.id,
                                 name: $0.name,
                                 expansion: $0.expansion,
                                 army_type: $0.army_type,
                                 unique_unit: $0.unique_unit,
                                 unique_tech: $0.unique_tech,
                                 team_bonus: $0.team_bonus,
                                 civilization_bonus: $0.civilization_bonus ?? [],
                                 image: (UIImage(named: "1")?.pngData())!)
                    }.removingDuplicates()
                    completionHandler(civModel ?? [])
                }
    
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    //MARK: - Get Units
    
    func getUnitsData(url: String, completionHandler: @escaping ([UnitModel]) -> Void) {
        
    }
    
    func getUnitData(url: String, completionHandler: @escaping (UnitModel) -> Void) {
        
        let url = URL(string: url)
        print("baseUrl = \(url!)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
//        request.setValue("Bearer: \()", forHTTPHeaderField: "Authorization")
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = [
//            "Authorization": "Bearer \(K.shared.googleApiKey)"
//        ]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("error?.localizedDescription =\(error?.localizedDescription)")
                return}
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Unit.self, from: data)
                
                DispatchQueue.main.async {
                    let unitModel = UnitModel(id: decodedData.id,
                                              name: decodedData.name,
                                              description: decodedData.description,
                                              expansion: decodedData.expansion,
                                              age: decodedData.age,
                                              created_in: decodedData.created_in,
                                              cost: decodedData.cost,
                                              build_time: decodedData.build_time,
                                              reload_time: decodedData.reload_time,
                                              movement_rate: decodedData.movement_rate,
                                              line_of_sight: decodedData.line_of_sight,
                                              hit_points: decodedData.hit_points,
                                              attack: decodedData.attack,
                                              armor: decodedData.armor,
                                              attack_bonus: decodedData.attack_bonus)
                    completionHandler(unitModel)
                }
    
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    //MARK: Get Tech Data
    func getTechsData(completionHandler: @escaping ([TechModel]) -> Void){
        let url = URL(string: "https://age-of-empires-2-api.herokuapp.com/api/v1/technologies")
        print("baseUrl = \(url!)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
//        request.setValue("Bearer: \()", forHTTPHeaderField: "Authorization")
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = [
//            "Authorization": "Bearer \(K.shared.googleApiKey)"
//        ]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("error?.localizedDescription =\(error?.localizedDescription)")
                return}
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(TechData.self, from: data)
                DispatchQueue.main.async {
                    let techs = decodedData.technologies?.map {
                        TechModel(id: $0.id ?? 0,
                                  name: $0.name ?? "",
                                  description: $0.description ?? "",
                                  expansion: $0.expansion ?? "",
                                  age: $0.age ?? "",
                                  develops_in: $0.develops_in ?? "",
                                  cost: $0.cost ?? CostTech(Wood: 0, Food: 0, Stone: 0, Gold: 0),
                                  build_time: $0.build_time ?? 0,
                                  applies_to: $0.applies_to ?? [])
                    }.removingDuplicates()
                    completionHandler(techs ?? [])
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getTechData(url: String, completionHandler: @escaping (TechModel) -> Void) {
        
        let url = URL(string: url)
        print("baseUrl = \(url!)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
//        request.setValue("Bearer: \()", forHTTPHeaderField: "Authorization")
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = [
//            "Authorization": "Bearer \(K.shared.googleApiKey)"
//        ]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("error?.localizedDescription =\(error?.localizedDescription)")
                return}
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Tech.self, from: data)
                
                DispatchQueue.main.async {
                    let techModel = TechModel(id: decodedData.id ?? 0,
                                              name: decodedData.name ?? "",
                                              description: decodedData.description ?? "",
                                              expansion: decodedData.expansion ?? "",
                                              age: decodedData.age ?? "",
                                              develops_in: decodedData.develops_in ?? "",
                                              cost: decodedData.cost ?? CostTech(Wood: 0, Food: 0, Stone: 0, Gold: 0),
                                              build_time: decodedData.build_time ?? 0,
                                              applies_to: decodedData.applies_to ?? [])
                    completionHandler(techModel)
                }
    
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: - Get Structure Data:
    
    func getStructureData(completionHandler: @escaping ([StructureModel]) -> Void) {
        let url = URL(string: "https://age-of-empires-2-api.herokuapp.com/api/v1/structures")
        print("baseUrl = \(url!)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
//        request.setValue("Bearer: \()", forHTTPHeaderField: "Authorization")
        let sessionConfiguration = URLSessionConfiguration.default
//        sessionConfiguration.httpAdditionalHeaders = [
//            "Authorization": "Bearer \(K.shared.googleApiKey)"
//        ]
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: url!) {(data, response, error) in
            guard error == nil else {
                print("error?.localizedDescription =\(error?.localizedDescription)")
                return}
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(StructureData.self, from: data)
                
                DispatchQueue.main.async {
                    let structureModel = decodedData.structures?.map {
                        StructureModel(id: $0.id,
                                       name: $0.name,
                                       expansion: $0.expansion,
                                       age: $0.age,
                                       cost: $0.cost,
                                       build_time: $0.build_time,
                                       hit_points: $0.hit_points,
                                       line_of_sight: $0.line_of_sight,
                                       armor: $0.armor,
                                       special: $0.special)
                    }
                    completionHandler(structureModel ?? [])
                }
    
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    func getStructure(){
        // get a single structure.
    }

}
