
import UIKit
import SnapKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        configureConstraints()
    }
    //MARK: - Properties
    let colors = C()
    let imagesClass = MainVCImages()
    let images = [UIImage]()
    var aHeight = CGFloat()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 60, height: 120)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        //              collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return collectionView
    }()
    let reuseIdentifier = "MainCell"
    //MARK: - Set Up CollectionView
    
    func setUpCollectionView(){
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    
    //MARK: - Constraints
    func configureConstraints(){
        view.addSubview(collectionView)
        view.backgroundColor = colors.backGroundBlack
        collectionView.backgroundColor = .black
        collectionView.snp.makeConstraints { collectionView in
            collectionView.width.equalTo(view)
            collectionView.height.equalTo(view)
        }
    }
    
    func returnHeight() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            aHeight = 450
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            aHeight = 250
        }
    }
}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainCell
        let images = [imagesClass.civ, imagesClass.structures, imagesClass.tech, imagesClass.units]
        mainCell.categoryImage.image = images[indexPath.row]
        return mainCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("0")
            let civVC = CivVC()
            self.navigationController?.pushViewController(civVC, animated: true)
        case 1:
            print("1")
            let stVC = StructureVC()
            self.navigationController?.pushViewController(stVC, animated: true)

        case 2:
            let tecVC = TechsVC()
            self.navigationController?.pushViewController(tecVC, animated: true)
            print("2")
        case 3:
            print("3")
        default:
            print("default")
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
            
            return UIEdgeInsets(top: 1.0, left: 4.0, bottom: 1.0, right: 4.0)
        }

        
        func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
            returnHeight()
            return CGSize(width: widthPerItem - 8, height: aHeight)
        }
}

