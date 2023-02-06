import UIKit
import SnapKit
class MainCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let colors = C()
    let categoryImage : UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFill
    imgView.clipsToBounds = true
    imgView.layer.cornerRadius = 8.0
    imgView.backgroundColor = .white
    return imgView
    }()
    
    //MARK: - Constraints
    func configureConstraints(){
        contentView.addSubview(categoryImage)
//        contentView.backgroundColor = colors.softBlack
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            categoryImage.snp.makeConstraints { categoryImage in
                categoryImage.height.equalTo(contentView.frame.size.height * 0.85)
                categoryImage.width.equalTo(contentView.frame.size.width * 0.70)
                categoryImage.centerX.equalTo(contentView)
                categoryImage.centerY.equalTo(contentView)
            }
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            categoryImage.snp.makeConstraints { categoryImage in
                categoryImage.height.equalTo(contentView.frame.size.height * 0.85)
                categoryImage.width.equalTo(contentView.frame.size.width * 0.85)
                categoryImage.centerX.equalTo(contentView)
                categoryImage.centerY.equalTo(contentView)
            }
        }
    }
}
