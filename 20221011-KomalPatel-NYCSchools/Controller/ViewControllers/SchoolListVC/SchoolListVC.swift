//
//  ViewController.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import UIKit

class SchoolListVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tblSchoolNameList: UITableView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Variables
    let schoolListViewModel = SchoolListViewModel()
    
    var arrSchools : [SchoolListModel] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        Initilisation()
        callSchoolListAPI()
    }

    //MARK: - UISetup & Initilisation
    
    func UISetup(){
        if IS_IPHONE_SE{
            headerViewHeightConstraint.constant = 80
        } else if IS_IPHONE_X || IS_IPHONE_XI{
            headerViewHeightConstraint.constant = 120
        } else {
            headerViewHeightConstraint.constant = 80
        }
    }
    
    func Initilisation(){
        tblSchoolNameList.register(UINib(nibName: "tblSchoolNameCell", bundle: nil), forCellReuseIdentifier: "tblSchoolNameCell")

        tblSchoolNameList.dataSource = self
        tblSchoolNameList.delegate = self
        tblSchoolNameList.separatorStyle = .none
    }
    
    //MARK: - APICall Methods
    
    func callSchoolListAPI(){
        schoolListViewModel.SchoolListApiCalling(){status  in
            if status {
                self.arrSchools = globalSchoolListArray
                DispatchQueue.main.async {
                    self.tblSchoolNameList.reloadData()
                }
            } else {
                self.showToast(message: "Error in getting Response")
            }
        }
    }
 
}


//MARK: - Tableview Delegate and DataSource Methods
extension SchoolListVC : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSchools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblSchoolNameCell", for: indexPath) as! tblSchoolNameCell
        cell.setupData(data: arrSchools[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SchoolDetailVC(nibName: "SchoolDetailVC", bundle: nil)
        vc.schoolId = arrSchools[indexPath.row].dbn ?? ""
        vc.schoolName = arrSchools[indexPath.row].school_name ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
