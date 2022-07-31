import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("POSTGRES_DATABASE_HOST") ?? "localhost",
        port: Environment.get("POSTGRES_DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("POSTGRES_DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("POSTGRES_DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("POSTGRES_DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)

    // register migration
    app.migrations.add(CreateTeam())
    
    // run migration programaticatelly
    try app.autoMigrate().wait()

    // register routes
    try routes(app)
    
    print(app.routes.all)
}
