

import Foundation




// MARK: - WelcomeClass
struct WelcomeClass: Codable {
    let attack, defense: Int?
    let description: String?
    let evolutionChain: [EvolutionChain]?
    let height, id: Int?
    let imageURL: String?
    let name, type: String?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case attack, defense
        case description
        case evolutionChain  = "evolutionChain"
        case height, id
        case imageURL = "imageUrl"
        case name, type, weight
    }
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let id, name: String?
}



