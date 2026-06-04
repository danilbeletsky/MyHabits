import Foundation

struct Cells: Identifiable, Codable {
    let id = UUID()
    let title: String
    var isCompletion: Bool
}
