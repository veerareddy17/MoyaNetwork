//
//  DataServices.swift
//  Learn Moya
//
//  Created by veera reddy on 17/09/18.
//  Copyright © 2018 veera reddy. All rights reserved.
//

import Foundation
import Moya
enum DataServices {
    case postUsers(path: String,parameter: [String: Any])
    case getUsers(path:String)
}
extension DataServices: TargetType {
    var path: String {
        switch self {
        case .postUsers(let path,_):
            return path
        case .getUsers(let path):
            return path
        }
    }
    var baseURL: URL {
        return URL(string: "https://rynlyuat.azurewebsites.net/api/")!
    }
    
    var method: Moya.Method {
        switch self {
        case .postUsers(_):
            return .post
        case .getUsers(_):
            return .get
        }
    }
    var sampleData: Data {
       return Data()
    }
    
    var task: Task {
        switch self {
        case .postUsers(_,let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .getUsers(_):
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return ["Content-typer" : "application/json"]
    }
}

