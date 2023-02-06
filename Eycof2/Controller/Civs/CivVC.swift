import UIKit
import SnapKit

class CivVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        callAPI()
    }
    
    //MARK: Properties:
    let colors = C()
    let reuseIdentifier = "CivCell"
    var tableView = UITableView()
    var civResultData = CivResult()
    //MARK: Get Data
    
    func callAPI() {
        APIManager.shared.getData(category: "civilizations") { civilizations in
            self.civResultData.civResult = civilizations
            print("civilizations = \(civilizations)")
            self.tableView.reloadData()
        }
    }
    //MARK: Constraints and View
    func setupTableView(){
        tableView.rowHeight = 150
        tableView.backgroundColor = colors.backGroundBlack
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(CivCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureConstraints(){
        setupTableView()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(view)
            tableView.bottom.equalTo(view)
            tableView.right.equalTo(view).offset(-20)
            tableView.left.equalTo(view).offset(20)
        }
    }
}

extension CivVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        civResultData.civResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let civCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CivCell
        
        civCell.getDataWith(data: civResultData.civResult, index: indexPath.row)
        return civCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let civDetail = CivDetail(civData: civResultData.civResult[indexPath.row])
        self.navigationController?.present(civDetail, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 10
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
