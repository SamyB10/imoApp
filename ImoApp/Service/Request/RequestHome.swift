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
    func mockTest() async -> [RestModelRegions]
}

final class RequestHome: HomeService {
    func mockTest() async -> [RestModelRegions] {
        let path = Bundle.main.path(forResource: "Region", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)

        let decodeResponse = try! JSONDecoder().decode([RestModelRegions].self, from: data)
        return decodeResponse
    }


    // MARK: - HomeRequest
    func fetchRegions() async -> Result<[RestModelRegions], HomeServiceError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "geo.api.gouv.fr"
        urlComponents.path = "/regions"

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)

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
}
