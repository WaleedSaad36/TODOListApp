//
//  APIRouter.swift
//  TODOApp-MVC-Demo
//
//  Created by Ibrahim El-geddawy on 11/7/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{
    
    // The endpoint name
    case login(_ email: String, _ password: String)
    case register(_ name: String, _ email: String,_ password:String ,_ age:Int)
    case getLoggin
    case getTodos
    case addNewTask(_ description: String)
    case UpdateProfileData(_ key: String,_ newValue: String)
    case uploadPhoto(_ image :UIImage)
    case getUserPhoto (_ id: String)
    case logOutUser
    
    // MARK: - HttpMethod
    private var method: HTTPMethod {
        switch self{
        case .getTodos , .getUserPhoto, .getLoggin :
            return .get
        case .UpdateProfileData :
            return .put
        default:
            return .post
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [ParameterKeys.email: email, ParameterKeys.password: password]
            
        case .register(let userName, let email, let password, let age):
            return [ParameterKeys.name:userName, ParameterKeys.email: email , ParameterKeys.password: password, ParameterKeys.age: age]
        case .addNewTask(let description):
            return [ParameterKeys.description:description]
        case .getUserPhoto(let id):
            return [ParameterKeys.id:id]
        case .UpdateProfileData(let key, let newValue):
            switch key {
            case ParameterKeys.name:
                return [ParameterKeys.name: newValue]
            case ParameterKeys.email:
                return [ParameterKeys.email: newValue]
            default:
                return [ParameterKeys.age: newValue]
            }
        default:
            return nil
        }
    }
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
            return URLs.login
        case .register:
            return URLs.register
        case .getLoggin:
            return URLs.getLoginUser
        case .addNewTask:
            return URLs.addNewTask
        case .UpdateProfileData:
            return URLs.updateProfile
        case .uploadPhoto:
            return URLs.uploadImage
        case .getUserPhoto:
            return URLs.getImage
        case .logOutUser:
            return URLs.logOut
        case .getTodos:
            return URLs.getAllTask
        }
    }
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        //httpMethod
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getTodos , .addNewTask, .getLoggin, .logOutUser, .UpdateProfileData:
            urlRequest.setValue("Bearer \(UserDefaultsManager.shared().token ?? "")",
            forHTTPHeaderField: HeaderKeys.authorization)
            
        default:
            break
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        
        
        
        // HTTP Body
        let httpBody: Data? = {
            switch self {
            default:
                return nil
            }
        }()
        
        // Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }

// type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
    
}
