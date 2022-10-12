//
//  SchoolDetailVC.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import UIKit

class SchoolDetailVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var lblReadingScore: UILabel!
    @IBOutlet weak var lblWritingScore: UILabel!
    @IBOutlet weak var lblMathScore: UILabel!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    
    //MARK: - Variables
    var schoolId : String = ""
    var schoolName : String = ""
    var schoolData : SchoolDetailModel?
    let schoolDetailViewModel = SchoolDetailViewModel()
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetup()
        Initilisation()
        callSchoolDetailAPI()
        // Do any additional setup after loading the view.
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
        
        lblSchoolName.text = schoolName
    }
    
    func Initilisation(){
        
    }
    
    //MARK: - Button Action Methods
    
    @IBAction func btnBack_Action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    //MARK: - APICall Methods
    
    func callSchoolDetailAPI(){
        schoolDetailViewModel.SchoolDataApiCalling(){status  in
            if status {
                globalSchoolDetailArray.forEach{ i in
                    //Get the School detail for particular School
                    let schoolId = i.dbn
                    if schoolId == self.schoolId{
                        self.schoolData = i
                    }
                    DispatchQueue.main.async {
                        self.lblMathScore.text = "Math Score: \(self.schoolData?.sat_math_avg_score ?? "")"
                        self.lblReadingScore.text = "Reading Score: \(self.schoolData?.sat_critical_reading_avg_score ?? "")"
                        self.lblWritingScore.text = "Writing Score: \(self.schoolData?.sat_writing_avg_score ?? "")"
                    }
                }
            } else {
                self.showToast(message: "Error in getting Response")
            }
        }
    }
}
