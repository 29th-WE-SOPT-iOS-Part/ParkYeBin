//
//  LoginResponseDataModel.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/11/14.
//

import Foundation

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
