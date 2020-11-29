//
//  APIManager.swift
//  TODOApp-MVC-Demo
//
//  Created by IDEAcademy on 10/27/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Alamofire


class APIManager {
    //---------*******----------***LOGIN API****--------------
    class func login(with email: String, password: String, completion: @escaping(Result<LoginResponse,Error>)-> ()){
        
        request(APIRouter.login(email, password)) { (response) in
            completion(response)
        }
        
    }
    
    //---------*******----------***** Get Todos API ******--------------
    
    class func getAllTodos(completion: @escaping (Result<TaskResponse, Error>)-> ()){
        request(APIRouter.getTodos){ (response) in
            completion(response)
        }
    }
    
    
    class func register(name: String, email: String, password: String, age: Int, completion: @escaping (Result<LoginResponse, Error>)-> ()){
        request(APIRouter.register(name, email, password, age)){ (response) in
            completion(response)
        }
    }
    
    
    
    class func  getLoggin(completion: @escaping (Result<UserData, Error>)-> ()){
        request(APIRouter.getLoggin){ (response) in
            completion(response)
        }
    }
    
    
    class func addNewTask(description: String, completion: @escaping (Bool)-> Void){
        requestBool(APIRouter.addNewTask( description)) { (response) in
            completion(response)
        }
        
    }
    
    class func UpdateProfileData( key: String, newValue: String, completion: @escaping(Result<UpdataProfileData, Error>)-> ()){
        
        request(APIRouter.UpdateProfileData(key, newValue)) { (success) in
            completion(success)
        }
    }
    
    
    
    
    
    /*
    
    class func login(with email: String, password: String, completion: @escaping (_ error: Error?, _ loginData: LoginResponse?) -> Void) {
        
        
        
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
        let params: [String: Any] = [ParameterKeys.email: email,
                                     ParameterKeys.password: password]
        
        AF.request(URLs.login, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let loginData = try decoder.decode(LoginResponse.self, from: data)
                completion(nil, loginData)
            } catch let error {
                print(error)
            }
        }
        
        
    }
*/
    /*
    class func getAllTodos (Completion:@escaping (_ error: Error?, _ todoArr: [TaskData]?) -> Void) {
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.authorization:"Bearer \(UserDefaultsManager.shared().token!)"]
        AF.request(URLs.getAllTask, method: HTTPMethod.get, parameters: nil , encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                Completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let todoArr = try decoder.decode(TaskResponse.self, from: data).data
                Completion(nil, todoArr)
            } catch let error {
                print(error)
            }
        }
        
    }
 
 */

  /*
class func register(with name: String, email: String, password:String , age:Int, completion: @escaping (_ error: Error?, _ loginData: LoginResponse?) -> Void) {
    
    let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json"]
    let params: [String: Any] = [ParameterRegister.name: name, ParameterRegister.email: email, ParameterRegister.password: password, ParameterRegister.age: age]
    
    AF.request(URLs.register, method: HTTPMethod.post, parameters: params, encoding:URLEncoding.default, headers: headers).response {
        response in
        guard response.error == nil else {
            print(response.error!)
            completion(response.error, nil)
            return
        }
        
        guard let data = response.data else {
            print("didn't get any data from API")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let loginData = try decoder.decode(LoginResponse.self, from: data)
            completion(nil, loginData)
        } catch let error {
            print(error)
        }
    }
}
    
   */
    
    
    
    
    /*
    class func  getLoggin(completion: @escaping (_ error: Error?, _ loginData: UserData?) -> Void) {
        
        let headers: HTTPHeaders = [HeaderKeys.authorization:"Bearer \(UserDefaultsManager.shared().token!)"]
        AF.request(URLs.getLoginUser, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            
            guard let data = response.data else {
                print("didn't get any data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let loginData = try decoder.decode(UserData.self, from: data)
                completion(nil, loginData)
            } catch let error {
                print(error)
            }
        }
    }
    
    */
    
    /*
    class func addNewTask(userToken: String, description: String, completion: @escaping  (Bool) -> Void) {
        
        
        let headers: HTTPHeaders = [HeaderKeys.authorization : "Bearer \(UserDefaultsManager.shared().token!)",
                                    HeaderKeys.contentType: "application/json"]
        let params: [String: Any] = [ParameterKeys.description: description]
        
        
        AF.request(URLs.addNewTask, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(false)
                return
            }
        
            completion(true)
        
    }
    
    }
    
    */
    
    /*
    class func UpdateProfileData(with key: String, newValue: String, completion: @escaping (Bool) -> Void){
        guard let token = UserDefaultsManager.shared().token else {return}
        let headers: HTTPHeaders = [HeaderKeys.contentType: "application/json", HeaderKeys.authorization:"Bearer " + token]
        
        var params: [String: Any]?
        
        
        switch key {
        case "0" :
             params = [ParameterKeys.name : newValue]
        case "1":
             params = [ParameterKeys.email : newValue]
        case "2":
             params = [ParameterKeys.age: newValue]
            
        default:
            print("N/Y")
        }
        
        AF.request(URLs.updateProfile, method: HTTPMethod.put, parameters: params, encoding: JSONEncoding.default, headers: headers).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(false)
                return
            }
            completion(true)
            
        }
    
    }
 
 */
    
    
    
    
    class func uploadPhoto(with data:Data, compeltion:@escaping (Bool) -> (Void)  ){
        
         let headers: HTTPHeaders = [ HeaderKeys.authorization:"Bearer \(UserDefaultsManager.shared().token!)"]
        
        
        AF.upload(multipartFormData: {(fromData) in
            fromData.append(data,withName: "avatar",fileName:"/home/ali/Mine/c/nodejs-blog/public/img/blog-header.jpg",mimeType: "blog-header.jpg" )
        }, to: URLs.uploadImage,method: HTTPMethod.post,headers: headers).response {
            response in
            guard response.error == nil  else{
                print(response.error!.localizedDescription)
                compeltion (false)
                return
            }
            
            print(response)
            compeltion(true)
            
        }
        
    }
//    class func getuserPhoto(id :String,completion: @escaping(_ image: UIImage?,_ error:Error?) -> Void){
//        requestBool(APIRouter.getUserPhoto(id)){(image, error) in
//            completion(image, error)
//        }
//    }
//
   
    class func getUserPhoto (whit id: String ,completion: @escaping (_ error: Error?, _ image: Data?, _ imageResponese: ImageResponse?) -> Void) {
        
        print("\(URLs.getImage)/\(id)/avatar")
        
        AF.request("\(URLs.getImage)/\(id)/avatar",method: HTTPMethod.get).response {
            response in
            guard response.error == nil  else{
                print(response.error!.localizedDescription)
                completion(response.error!, nil, nil)
                return
            }
            
            guard let data = response.data else{
                print("cant get data")
                return
            }
            
            completion(nil,data,nil)
            print("success get image")
            print(response)
            
        }
        
    }
    
    
    class func logOutUser( compeltion:@escaping (Bool) -> (Void)  ){
        requestBool(APIRouter.logOutUser){ (response) in
            
            compeltion (response)
        }
    }

    
    
    
        
}

extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
            }
            .responseJSON { response in
                print(response)
        }
    }
    
    private static func requestBool(_ urlConvertible: URLRequestConvertible, completion: @escaping (_ image: UIImage?,_ error:Error?) -> ()){
        AF.request(urlConvertible).response{(response) in
            guard response.error == nil else{
                completion(nil, response.error)
                return
            }
            
            guard let data = response.data else{
                print("Cannot get any data from API")
                return
            }
            
            let image = UIImage(data: data)
            completion(image,nil)
            
        }
    }
    
    private static func requestBool(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Bool) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).response { (response) in
            switch response.result {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
}
