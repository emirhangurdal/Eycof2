import UIKit
import SnapKit
class CivCell: UITableViewCell {
    
    
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
    let civImage : UIImageView = {
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
    private var team_bonus : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 13)
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        return lbl
    }()
    

    
    //MARK: - Data
    func getDataWith(data: [CivModel], index: Int) {
        self.civImage.image = UIImage(data: data[index].image)
        self.nameValue.text = data[index].name ?? ""
        self.army_type.text = data[index].army_type ?? ""
        self.team_bonus.text = data[index].team_bonus ?? ""
    }
    
    //MARK: - Constraints
    func configureConstraints(){
        contentView.frame.size.height = 150
        contentView.backgroundColor = colors.softBlack
        contentView.addSubview(middleSeparator)
        contentView.addSubview(civImage)
        contentView.addSubview(nameValue)
        contentView.addSubview(army_type)
        contentView.addSubview(team_bonus)
        
        
        middleSeparator.snp.makeConstraints { middleSeparator in
            middleSeparator.height.equalTo(1)
            middleSeparator.width.equalTo(1)
            middleSeparator.centerX.equalTo(contentView)
            middleSeparator.centerY.equalTo(contentView)
        }
        
        print("contentView.frame.size.height = \(contentView.frame.size.height)")
        civImage.snp.makeConstraints { civImage in
            civImage.height.equalTo(contentView.frame.size.height * 0.50)
            civImage.width.equalTo(contentView.frame.size.width * 0.50)
            civImage.centerX.equalTo(contentView)
            civImage.top.equalTo(contentView).offset(10)
        }
        nameValue.snp.makeConstraints { nameValue in
            nameValue.height.equalTo(15)
            nameValue.width.equalTo(contentView)
            nameValue.top.equalTo(civImage.snp.bottom).offset(5)
            nameValue.centerX.equalTo(contentView)
        }
        army_type.snp.makeConstraints { army_type in
            army_type.height.equalTo(15)
            army_type.width.equalTo(contentView)
            army_type.top.equalTo(nameValue.snp.bottom)
            army_type.centerX.equalTo(contentView)
        }
        team_bonus.snp.makeConstraints { team_bonus in
            team_bonus.height.equalTo(15)
            team_bonus.width.equalTo(contentView)
            team_bonus.top.equalTo(army_type.snp.bottom)
            team_bonus.centerX.equalTo(contentView)
        }
    }
}
