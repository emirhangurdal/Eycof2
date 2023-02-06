
import UIKit
import SnapKit

class StDetail: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colors.backGroundBlack
        configureConstraints()
    }
    
    init(stData: StructureModel) {
        super.init(nibName: nil, bundle: nil)
        setUpData(id: stData.id ?? 0,
                  name: stData.name ?? "",
                  expansion: stData.expansion ?? "",
                  age: stData.age ?? "",
                  cost: stData.cost,
                  build_time: stData.build_time ?? 0,
                  hit_points: stData.hit_points ?? 0,
                  line_of_sight: stData.line_of_sight ?? 0,
                  armor: stData.armor ?? "",
                  special: stData.special ?? [])
    }
    required init?(coder: NSCoder) {
        fatalError("Invalid way of decoding this class")
    }
    //MARK: Properties
    let scrollView = UIScrollView()
    let colors = C()
    
    let stImage : UIImageView = {
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
    private var build_time : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var hit_points : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var line_of_sight : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var armor : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var special : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    
  
    func setUpData(id: Int,
     name: String,
     expansion: String,
     age: String,
     cost: CostStructure?,
     build_time: Int,
     hit_points: Int,
     line_of_sight: Int,
     armor: String,
     special: [String]){
        self.name.attributedText = NSMutableAttributedString()
            .bold("\(name)")
        self.expansion.attributedText = NSMutableAttributedString()
            .bold("\(expansion)")
        self.age.attributedText = NSMutableAttributedString()
            .bold("\(age)")
        let costText = NSMutableAttributedString()
            .normal("Cost:\n ")
            .bold("Wood: \(cost?.Wood ?? 0)\n Stone: \(cost?.Stone ?? 0)\n Gold: \(cost?.Gold ?? 0)\n Food: \(cost?.Food ?? 0)")
        self.cost.attributedText = costText
        self.build_time.attributedText = NSMutableAttributedString()
            .normal("Build Time \n")
            .bold("\(build_time)")
        self.hit_points.attributedText = NSMutableAttributedString()
            .normal("Hit Points \n")
            .bold("\(hit_points)")
        self.line_of_sight.attributedText = NSMutableAttributedString()
            .normal("Line of Sight \n")
            .bold("\(line_of_sight)")
        self.armor.attributedText = NSMutableAttributedString()
            .normal("Armor \n")
            .bold("\(armor)")
        special.map { specialItem in
            self.special.attributedText = NSMutableAttributedString()
                .normal("Special \n")
                .bold("\(specialItem)")
        }
    }
    //MARK: Constraints:
    
    func configureConstraints(){
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height + 50)
        
        scrollView.addSubview(stImage)
        scrollView.addSubview(name)
        scrollView.addSubview(expansion)
        scrollView.addSubview(age)
        scrollView.addSubview(cost)
        scrollView.addSubview(build_time)
        scrollView.addSubview(hit_points)
        scrollView.addSubview(line_of_sight)
        scrollView.addSubview(armor)
        scrollView.addSubview(special)
        
        
        scrollView.backgroundColor = colors.softBlack
        scrollView.snp.makeConstraints { scrollView in
            scrollView.top.equalTo(view)
            scrollView.left.equalTo(view)
            scrollView.right.equalTo(view)
            scrollView.bottom.equalTo(view)
        }
        stImage.snp.makeConstraints { stImage in
            stImage.width.equalTo(200)
            stImage.height.equalTo(200)
            stImage.centerX.equalTo(scrollView)
            stImage.top.equalTo(scrollView).offset(10)
        }
        name.snp.makeConstraints { name in
            name.height.equalTo(30)
            name.top.equalTo(stImage.snp.bottom)
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
        hit_points.snp.makeConstraints { hit_points in
            hit_points.height.equalTo(50)
            hit_points.top.equalTo(build_time.snp.bottom)
            hit_points.width.equalTo(scrollView)
            hit_points.centerX.equalTo(scrollView)
        }
        line_of_sight.snp.makeConstraints { line_of_sight in
            line_of_sight.height.equalTo(50)
            line_of_sight.top.equalTo(hit_points.snp.bottom)
            line_of_sight.width.equalTo(scrollView)
            line_of_sight.centerX.equalTo(scrollView)
        }
        armor.snp.makeConstraints { armor in
            armor.height.equalTo(40)
            armor.top.equalTo(line_of_sight.snp.bottom)
            armor.width.equalTo(scrollView)
            armor.centerX.equalTo(scrollView)
        }
        special.snp.makeConstraints { special in
            special.height.equalTo(100)
            special.top.equalTo(armor.snp.bottom)
            special.width.equalTo(scrollView)
            special.centerX.equalTo(scrollView)
        }
        
    }
}
