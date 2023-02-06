
import UIKit
import SnapKit

class TechDetail: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.backGroundBlack
        configureConstraints()
    }
    
    init(techData: TechModel) {
        super.init(nibName: nil, bundle: nil)
        setUpData(name: techData.name ?? "",
                  description: techData.description ?? "",
                  expansion: techData.expansion ?? "",
                  age: techData.age ?? "",
                  develops_in: techData.develops_in ?? "",
                  cost: techData.cost ?? CostTech(Wood: 0, Food: 0, Stone: 0, Gold: 0),
                  desc: techData.description ?? "",
                  build_time: techData.build_time ?? 0,
                  applies_to: techData.applies_to ?? [])
    }
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    //MARK: Properties
    let scrollView = UIScrollView()
    let colors = C()
    let supporting = Supporting()
    let techImage : UIImageView = {
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
    private var age : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var cost : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var desc : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var develops_in : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var build_time : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var applies_to : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    /*
     API Response
     {
          "id": 1,
          "name": "Crossbowman",
          "description": "Upgrade to Crossbowman",
          "expansion": "Age of Kings",
          "age": "Castle",
          "develops_in": "https://age-of-empires-2-api.herokuapp.com/api/v1/structure/archery_range",
          "cost": {
              "Food": 125,
              "Gold": 75
          },
          "build_time": 35,
          "applies_to": [
              "https://age-of-empires-2-api.herokuapp.com/api/v1/unit/archer"
          ]
      }
     */
  
    func setUpData(name: String,
                   description: String,
                   expansion: String,
                   age: String,
                   develops_in: String,
                   cost: CostTech,
                   desc: String,
                   build_time: Int,
                   applies_to: [String]){
        self.name.attributedText = NSMutableAttributedString()
            .bold("\(name)")
        self.desc.attributedText = NSMutableAttributedString()
            .bold("\(desc)")
        self.expansion.attributedText = NSMutableAttributedString()
            .bold("\(expansion)")
        self.age.attributedText = NSMutableAttributedString()
            .bold("\(age)")
        APIManager.shared.getTechData(url: develops_in) { technology in
            self.develops_in.attributedText = NSMutableAttributedString()
                .normal("Develops In")
                .bold(technology.develops_in ?? "")
        }
        self.cost.attributedText = NSMutableAttributedString()
            .normal("Cost: \n")
            .bold("\(cost.Wood ?? 0) \n \(cost.Food ?? 0) \n \(cost.Gold ?? 0) \n \(cost.Stone ?? 0)")
        self.build_time.attributedText = NSMutableAttributedString()
            .bold("\(build_time) \n")
            .normal("Build Time")
        var applitesToText = String()
        
        
        applies_to.map { aplsto in
            
            APIManager.shared.getUnitData(url: aplsto) { unit in
                applitesToText.append("\(unit.name ?? "") \n")
                self.applies_to.attributedText = NSMutableAttributedString()
                    .bold(applitesToText)
                    .normal("Applies To")
            }
        }
        
        
    }
    //MARK: Constraints:
    
    func configureConstraints(){
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 50)
        scrollView.addSubview(techImage)
        scrollView.addSubview(name)
        scrollView.addSubview(expansion)
        scrollView.addSubview(age)
        scrollView.addSubview(cost)
        scrollView.addSubview(build_time)
        scrollView.addSubview(develops_in)
        scrollView.addSubview(applies_to)
        
        scrollView.backgroundColor = colors.softBlack
        scrollView.snp.makeConstraints { scrollView in
            scrollView.top.equalTo(view)
            scrollView.left.equalTo(view)
            scrollView.right.equalTo(view)
            scrollView.bottom.equalTo(view)
        }
        techImage.snp.makeConstraints { techImage in
            techImage.width.equalTo(200)
            techImage.height.equalTo(200)
            techImage.centerX.equalTo(scrollView)
            techImage.top.equalTo(scrollView).offset(10)
        }
        name.snp.makeConstraints { name in
            name.height.equalTo(30)
            name.top.equalTo(techImage.snp.bottom)
            name.width.equalTo(scrollView)
            name.centerX.equalTo(scrollView)
        }
        expansion.snp.makeConstraints { expansion in
            expansion.height.equalTo(30)
            expansion.top.equalTo(name.snp.bottom)
            expansion.width.equalTo(scrollView)
            expansion.centerX.equalTo(scrollView)
        }
        age.snp.makeConstraints { age in
            age.height.equalTo(30)
            age.top.equalTo(expansion.snp.bottom)
            age.width.equalTo(scrollView)
            age.centerX.equalTo(scrollView)
        }
        cost.snp.makeConstraints { cost in
            cost.height.equalTo(100)
            cost.top.equalTo(age.snp.bottom)
            cost.width.equalTo(scrollView)
            cost.centerX.equalTo(scrollView)
        }
        build_time.snp.makeConstraints { build_time in
            build_time.height.equalTo(50)
            build_time.top.equalTo(cost.snp.bottom)
            build_time.width.equalTo(scrollView)
            build_time.centerX.equalTo(scrollView)
        }
        applies_to.snp.makeConstraints { applies_to in
            applies_to.height.equalTo(100)
            applies_to.top.equalTo(build_time.snp.bottom)
            applies_to.width.equalTo(scrollView)
            applies_to.centerX.equalTo(scrollView)
        }
        develops_in.snp.makeConstraints { develops_in in
            develops_in.height.equalTo(30)
            develops_in.top.equalTo(applies_to.snp.bottom)
            develops_in.width.equalTo(scrollView)
            develops_in.centerX.equalTo(scrollView)
        }
    }
}
