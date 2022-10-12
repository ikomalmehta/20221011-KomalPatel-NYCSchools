//
//  SchoolListViewModel.swift
//  20221011-KomalPatel-NYCSchools
//
//  Created by komal patel on 11/10/22.
//

import Foundation

class SchoolListViewModel{
    
    //MARK: - API call
    
    func SchoolListApiCalling(completetion : @escaping(completionHandler)){
        guard let url = URL(string: URL_GET_SCHOOL_LIST) else{return}
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode([SchoolListModel].self, from: data)
                    globalSchoolListArray = tasks
                    completetion(true)
                    
                }catch{
                    completetion(false)
                }
            }
        }
        task.resume()
    }
}

class SchoolDetailViewModel{
    
    //MARK: - API call
    func SchoolDataApiCalling(completetion : @escaping(completionHandler)){
        guard let url = URL(string: URL_GET_SCHOOL_DETAIL) else{return}
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode([SchoolDetailModel].self, from: data)
                    globalSchoolDetailArray = tasks
                    completetion(true)
                    
                }catch{
                    completetion(false)
                }
            }
        }
        task.resume()
    }
}

