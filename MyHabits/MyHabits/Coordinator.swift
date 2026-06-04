import Foundation
import SwiftUI

@Observable
final class Coordinator {
    var path = NavigationPath()
    
    var addHabit: ((String) -> Void)?
    
    func goTo(_ screen: SelectedScreen) {
        path.append(screen)
    }
    func back () {
        path.removeLast()
    }
}
