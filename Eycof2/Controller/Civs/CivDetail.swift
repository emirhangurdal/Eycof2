
import UIKit
import SnapKit

class CivDetail: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.backGroundBlack
        configureConstraints()
    }
    
    init(civData: CivModel) {
        super.init(nibName: nil, bundle: nil)
        setUpData(name: civData.name ?? "",
                  expansion: civData.expansion ?? "",
                  army_type: civData.army_type ?? "",
                  unique_unit: civData.unique_unit ?? [],
                  unique_tech: civData.unique_tech ?? [],
                  team_bonus: civData.team_bonus ?? "",
                  civilization_bonus: civData.civilization_bonus ?? [],
                  image: civData.image)
    }
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    //MARK: Properties
    let scrollView = UIScrollView()
    let colors = C()
    
    let civImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 8.0
        return imgView
    }()
    private var name : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var expansion : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var army_type : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var unique_unit : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var unique_tech : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var team_bonus : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var civilization_bonus : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    
    //    let id: String?
    //    let name: String?
    //    let expansion: String?
    //    let army_type: String?
    //    let unique_unit: [String]?
    //    let unique_tech: [String]?
    //    let team_bonus: String?
    //    let civilization_bonus: [String]?
    //    var image = Data()
    func setUpData(name: String, expansion: String, army_type: String, unique_unit: [String], unique_tech: [String], team_bonus: String, civilization_bonus: [String], image: Data){
        self.name.text = name
        self.expansion.text = expansion
        self.army_type.text = "\(army_type) Civilization"
        var uniqueUnitName = String()
        var uniqueTechName = String()
        var civBonus = String()
        
        unique_unit.map { unique_unit in
            APIManager.shared.getUnitData(url: unique_unit) { unit in
                uniqueUnitName.append(unit.name ?? "")
                print("uniqueUnitName = \(uniqueUnitName)")
                self.unique_unit.attributedText = NSMutableAttributedString()
                    .bold("\(uniqueUnitName)\n")
                    .normal("Unique Unit")
            }
        }
        unique_tech.map { unique_tech in
            APIManager.shared.getTechData(url: unique_tech) { techModel in
                uniqueTechName.append(techModel.name ?? "")
                self.unique_tech.attributedText = NSMutableAttributedString()
                    .bold("\(uniqueTechName)\n")
                    .normal("Unique Tech")
            }
        }
        civilization_bonus.map { cvBns in
            civBonus.append("\(cvBns) \n")
            self.civilization_bonus.attributedText = NSMutableAttributedString()
                .bold("\(civBonus)\n")
                .normal("Civ Bonus")
        }
        
        self.team_bonus.attributedText = NSMutableAttributedString()
            .bold("\(team_bonus)\n")
            .normal("Team Bonus")
 
        self.civImage.image = UIImage(data: image)
    }
    //MARK: Constraints:
    
    func configureConstraints(){
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 50)
        
        scrollView.addSubview(civImage)
        scrollView.addSubview(name)
        scrollView.addSubview(army_type)
        scrollView.addSubview(unique_unit)
        scrollView.addSubview(unique_tech)
        scrollView.addSubview(team_bonus)
        scrollView.addSubview(civilization_bonus)
        
        
        scrollView.backgroundColor = colors.softBlack
        scrollView.snp.makeConstraints { scrollView in
            scrollView.top.equalTo(view)
            scrollView.left.equalTo(view)
            scrollView.right.equalTo(view)
            scrollView.bottom.equalTo(view)
        }
        civImage.snp.makeConstraints { civImage in
            civImage.width.equalTo(200)
            civImage.height.equalTo(200)
            civImage.centerX.equalTo(scrollView)
            civImage.top.equalTo(scrollView).offset(10)
        }
        name.snp.makeConstraints { name in
            name.height.equalTo(30)
            name.top.equalTo(civImage.snp.bottom)
            name.width.equalTo(scrollView)
            name.centerX.equalTo(scrollView)
        }
        army_type.snp.makeConstraints { army_type in
            army_type.height.equalTo(50)
            army_type.top.equalTo(name.snp.bottom)
            army_type.width.equalTo(scrollView)
            army_type.centerX.equalTo(scrollView)
        }
        unique_unit.snp.makeConstraints { unique_unit in
            unique_unit.height.equalTo(50)
            unique_unit.top.equalTo(army_type.snp.bottom)
            unique_unit.width.equalTo(scrollView)
            unique_unit.centerX.equalTo(scrollView)
        }
        unique_tech.snp.makeConstraints { unique_tech in
            unique_tech.height.equalTo(50)
            unique_tech.top.equalTo(unique_unit.snp.bottom)
            unique_tech.width.equalTo(scrollView)
            unique_tech.centerX.equalTo(scrollView)
        }
        team_bonus.snp.makeConstraints { team_bonus in
            team_bonus.height.equalTo(50)
            team_bonus.top.equalTo(unique_tech.snp.bottom)
            team_bonus.width.equalTo(scrollView)
            team_bonus.centerX.equalTo(scrollView)
        }
        civilization_bonus.snp.makeConstraints { civilization_bonus in
            civilization_bonus.height.equalTo(125)
            civilization_bonus.top.equalTo(team_bonus.snp.bottom)
            civilization_bonus.width.equalTo(scrollView)
            civilization_bonus.centerX.equalTo(scrollView)
        }
        
    }
}
