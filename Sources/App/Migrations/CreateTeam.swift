//
//  CreateTeam.swift
//  
//
//  Created by Oscar Cristaldo on 2022-07-31.
//

import Fluent

struct CreateTeam: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("teams")
            .id()
            .field("name", .string, .required)
            .field("base", .string, .required)
            .field("logo_image_url", .string, .required)
            .field("car_image_url", .string, .required)
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("teams").delete()
    }
}
