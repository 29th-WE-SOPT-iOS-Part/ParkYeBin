//
//  NetworkResult.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/11/14.
//

import Foundation

enum NetworkResult<T> {
    case success(T) // 서버 통신 성공했을 때
    case requestERR(T) // 요청 에러 발생했을 때
    case Err400(T) // 요청에 대한 분기처리
    case pathErr // 경로 에러 발생했을 때
    case serverErr // 서버의 내부적 에러가 발생했을 때
    case networkFail // 네트워크 연결 실패했을 때
}
