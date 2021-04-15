//
//  MainVC.swift
//  Guidomia
//
//  Created by Rohan Aurora on 4/13/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: CarVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CarVM()
        prepareViews()
    }
    
    private func prepareViews() {
        tableView.separatorStyle = .none
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        let nibHeader = UINib(nibName: CarHeaderView.nibName, bundle: nil)
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: CarHeaderView.headerID)
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.datasource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CarCell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        cell.car = viewModel?.datasource?[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CarHeaderView.headerID)
        return header
    }
}
