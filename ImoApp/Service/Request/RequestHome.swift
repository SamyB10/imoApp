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
    func fetchRegions() async -> Result<[RestModelRegions], HomeServiceError>
    func mockRegions() async -> [RestModelRegions]

    func fetchDepartments(with keyRegion: String) async -> Result<[RestModelDepartment], HomeServiceError>
    func mockDepartments(with keyRegion: String?) async -> [RestModelDepartment]

    func fetchCity(with keyDepartment: String) async -> Result<[RestModelCity], HomeServiceError>
    func mockCity(with keyDepartment: String?) async -> [RestModelCity]
}

// MARK: - HomeRequest
final class RequestHome: HomeService {
    func mockRegions() async -> [RestModelRegions] {
        let path = Bundle.main.path(forResource: "Regions", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let decodeResponse = try! JSONDecoder().decode([RestModelRegions].self, from: data)
        return decodeResponse
    }

    func fetchRegions() async -> Result<[RestModelRegions], HomeServiceError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "geo.api.gouv.fr"
        urlComponents.path = "/regions"

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        let request = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let response = response as? HTTPURLResponse else {
                return .failure(HomeServiceError.noResponse)
            }

            guard (200...299).contains(response.statusCode) else {
                return .failure(HomeServiceError.wrongStatusCode)
            }

            let decodeResponse = try JSONDecoder().decode([RestModelRegions].self, from: data)
            return .success(decodeResponse)
        } catch {
            return .failure(HomeServiceError.parsingError)
        }
    }

    func mockDepartments(with keyRegion: String?) async -> [RestModelDepartment] {
        let path = Bundle.main.path(forResource: "Departments", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let decodeResponse = try! JSONDecoder().decode([RestModelDepartment].self, from: data)
        if let keyRegion {
            let filteredDepartments = decodeResponse.filter { $0.keyRegion == keyRegion }
            return filteredDepartments
        } else {
            return decodeResponse
        }
    }

    func fetchDepartments(with keyRegion: String) async -> Result<[RestModelDepartment], HomeServiceError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "geo.api.gouv.fr"
        urlComponents.path = "/departements"
        urlComponents.queryItems = [
            URLQueryItem(name: "codeRegion", value: keyRegion),
        ]

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        let request = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let response = response as? HTTPURLResponse else {
                return .failure(HomeServiceError.noResponse)
            }

            guard (200...299).contains(response.statusCode) else {
                return .failure(HomeServiceError.wrongStatusCode)
            }

            let decodeResponse = try JSONDecoder().decode([RestModelDepartment].self, from: data)
            return .success(decodeResponse)
        } catch {
            return .failure(HomeServiceError.parsingError)
        }
    }

    func mockCity(with keyDepartment: String?) async -> [RestModelCity] {
        let path = Bundle.main.path(forResource: "City", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let decodeResponse = try! JSONDecoder().decode([RestModelCity].self, from: data)
        if let keyDepartment {
            let filteredCity = decodeResponse.filter { $0.keyDepartment == keyDepartment }
            return filteredCity
        } else {
            return decodeResponse
        }
    }

    func fetchCity(with keyDepartment: String) async -> Result<[RestModelCity], HomeServiceError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "geo.api.gouv.fr"
        urlComponents.path = "/communes"
        urlComponents.queryItems = [
            URLQueryItem(name: "codeDepartement", value: keyDepartment),
        ]

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        let request = URLRequest(url: url)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let response = response as? HTTPURLResponse else {
                return .failure(HomeServiceError.noResponse)
            }

            guard (200...299).contains(response.statusCode) else {
                return .failure(HomeServiceError.wrongStatusCode)
            }

            let decodeResponse = try JSONDecoder().decode([RestModelCity].self, from: data)
            return .success(decodeResponse)
        } catch {
            return .failure(HomeServiceError.parsingError)
        }
    }
}
