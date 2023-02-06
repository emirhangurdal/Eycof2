import UIKit
import SnapKit
class StCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let colors = C()
    let stImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 8.0
        return imgView
    }()
    let middleSeparator: UIView = {
        let vw = UIView()
        return vw
    }()
    private var nameValue : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
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
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    

    
    //MARK: - Data
    func getDataWith(data: [StructureModel], index: Int) {
        stImage.image = UIImage(named: "1")!
        nameValue.text = data[index].name
        age.text = "Age: \(data[index].age ?? "")"
        let costText = NSMutableAttributedString()
            .normal("Cost:\n Wood: \(data[index].cost?.Wood ?? 0)\n Stone: \(data[index].cost?.Stone ?? 0)\n Gold: \(data[index].cost?.Gold ?? 0)\n Food: \(data[index].cost?.Food ?? 0)")
        cost.attributedText = costText
        
    }
    
    //MARK: - Constraints
    func configureConstraints(){
        contentView.frame.size.height = 300
        contentView.backgroundColor = colors.softBlack
        contentView.addSubview(middleSeparator)
        contentView.addSubview(stImage)
        contentView.addSubview(nameValue)
        contentView.addSubview(age)
        contentView.addSubview(cost)
        
        middleSeparator.snp.makeConstraints { middleSeparator in
            middleSeparator.height.equalTo(1)
            middleSeparator.width.equalTo(1)
            middleSeparator.centerX.equalTo(contentView)
            middleSeparator.centerY.equalTo(contentView)
        }
        
        print("contentView.frame.size.height = \(contentView.frame.size.height)")
        stImage.snp.makeConstraints { stImage in
            stImage.height.equalTo(contentView.frame.size.height * 0.50)
            stImage.width.equalTo(contentView.frame.size.width * 0.50)
            stImage.centerX.equalTo(contentView)
            stImage.top.equalTo(contentView).offset(10)
        }
        nameValue.snp.makeConstraints { nameValue in
            nameValue.height.equalTo(15)
            nameValue.width.equalTo(contentView)
            nameValue.top.equalTo(stImage.snp.bottom).offset(5)
            nameValue.centerX.equalTo(contentView)
        }
        age.snp.makeConstraints { age in
            age.height.equalTo(15)
            age.width.equalTo(contentView)
            age.top.equalTo(nameValue.snp.bottom).offset(5)
            age.centerX.equalTo(contentView)
        }
        cost.snp.makeConstraints { cost in
            cost.height.equalTo(80)
            cost.width.equalTo(contentView)
            cost.top.equalTo(age.snp.bottom).offset(5)
            cost.centerX.equalTo(contentView)
        }
        
    }
}
