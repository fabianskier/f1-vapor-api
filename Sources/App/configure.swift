import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    try app.databases.use(.postgres(url: Environment.databaseURL), as: .psql)

    // register migration
    app.migrations.add(CreateTeam())
    
    // run migration programaticatelly
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
    
    print(app.routes.all)
}
