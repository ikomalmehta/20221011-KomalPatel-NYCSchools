//
//  Constants.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import Foundation
import UIKit

//MARK:- SCREEN BOUNDS

let SCREEN_WIDTH    = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT   = UIScreen.main.bounds.size.height

var maxScreenLength:CGFloat { return max(SCREEN_WIDTH, SCREEN_HEIGHT) }
var phone:Bool { return UIDevice.current.userInterfaceIdiom == .phone }
var IS_IPHONE_X: Bool { return phone && maxScreenLength == 812 }
var IS_IPHONE_XI: Bool { return phone && maxScreenLength > 812 }
var IS_IPHONE_SE: Bool { return phone && maxScreenLength <= 568 }


public typealias completionHandler =  ((_ isSuccess:Bool) -> Void)

//Global Arrays

var globalSchoolListArray   : [SchoolListModel]   = []
var globalSchoolDetailArray : [SchoolDetailModel] = []
