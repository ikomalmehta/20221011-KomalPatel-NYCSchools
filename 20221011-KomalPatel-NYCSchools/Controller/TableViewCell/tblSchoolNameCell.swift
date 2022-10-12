//
//  tblSchoolNameCell.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import UIKit

class tblSchoolNameCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblSchoolName: UILabel!
    @IBOutlet weak var viewMain: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UISetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Userdefined Functions
    func UISetup(){
        viewMain.setShadow()
    }
    
    func setupData(data: SchoolListModel){
        lblSchoolName.text = data.school_name
    }
}
