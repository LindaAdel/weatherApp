//
//  CurrentWeatherInteractorAssembler.swift
//  WeatherApp
//
//  Created by Linda adel on 29/12/2023.
//

import Foundation

final class CurrentWeatherInteractorAssembler: Assembler{
    static var shareInstance = CurrentWeatherInteractorAssembler()
    private let currentWeatherRepository: CurrentWeatherRepositoryDataSource
    
    init() {
        self.currentWeatherRepository = CurrentWeatherRepository(remoteDataSource: CurrentWeatherAPI())
    }
    
    func assemble() {
        let container = DIContainer.shared
        container.register(currentWeatherRepository)
        
    }
    
    
}
 
