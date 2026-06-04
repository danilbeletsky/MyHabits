import Foundation
import SwiftUI

struct AppNavigationView: View {
    @State private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MainScreen()
                .navigationDestination(for: SelectedScreen.self) { screen in
                    switch screen {
                    case .main:
                        MainScreen()
                    case .added:
                        AddHabitScreen()
                    }
                }
        }
        .environment(coordinator)
    }
}
