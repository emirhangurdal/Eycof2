import UIKit
import SnapKit

class TechsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        callAPI()
    }
    
    //MARK: Properties:
    let colors = C()
    let results = TechResult()
    let reuseIdentifier = "TechCell"
    var tableView = UITableView()
    //MARK: Get Data
    
    func callAPI() {
        APIManager.shared.getTechsData { techData in
            self.results.techResult = techData
            self.tableView.reloadData()
        }
    }
    //MARK: Constraints and View
    func setupTableView(){
        tableView.rowHeight = 300
        tableView.backgroundColor = colors.backGroundBlack
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(TechCell.self, forCellReuseIdentifier: reuseIdentifier)
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

extension TechsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.techResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let techCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TechCell
        techCell.getDataWith(data: results.techResult, index: indexPath.row)
        return techCell
         
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // lunch structure detail.
        let techDetail = TechDetail(techData: results.techResult[indexPath.row])
        navigationController?.present(techDetail, animated: true, completion: nil)
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

