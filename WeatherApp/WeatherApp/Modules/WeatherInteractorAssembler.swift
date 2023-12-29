//
//  WeatherInteractorAssembler.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation

final class WeatherInteractorAssembler: Assembler{
    static var shareInstance = WeatherInteractorAssembler()
    private let weatherRepository: WeatherRepositoryDataSource
    
    init() {
        self.weatherRepository = WeatherRepository(remoteDataSource: WeatherAPI())
    }
    
    func assemble() {
        let container = DIContainer.shared
        container.register(weatherRepository)
        
    }
    
    
}
 
