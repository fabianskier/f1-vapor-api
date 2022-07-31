//
//  Team.swift
//  
//
//  Created by Oscar Cristaldo on 2022-07-31.
//

import Fluent
import Vapor

final class Team: Model, Content {
    static let schema = "teams"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "base")
    var base: String
    
    @Field(key: "logo_image_url")
    var logoImageUrl: String
    
    @Field(key: "car_image_url")
    var carImageUrl: String
    
    init() { }
    
    init(id: UUID? = nil, name: String, base: String, logoImageUrl: String, carImageUrl: String) {
        self.id = id
        self.name = name
        self.base = base
        self.logoImageUrl = logoImageUrl
        self.carImageUrl = carImageUrl
    }
}
