//
//  Request.swift
//  ImoApp
//
//  Created by Boussair Samy on 14/08/2024.
//
import Foundation

public enum HomeServiceError: Error {
    case invalidURL
    case wrongStatusCode
    case parsingError
    case noResponse
}

protocol HomeService {
//    func fetchRegions() async -> Result<[RestModelRegions], HomeServiceError>
//    func mockRegions() async -> [RestModelRegions]
}

// MARK: - HomeRequest
final class RequestHome: HomeService {
  
}
