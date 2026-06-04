import Foundation
import SwiftUI

struct AddHabitScreen: View {
    @Environment(Coordinator.self) var coordinator
    @State private var habbitTitle = ""
    var body: some View {
        List{
            Section("Название привычки"){
                TextField("Название", text: $habbitTitle)
            }
            Section{
                Button{
                    coordinator.addHabit?(habbitTitle)
                    coordinator.back()
                }label: {
                    Text("Добавить")
                }
                .disabled(habbitTitle.isEmpty)
            }
            Section{
                Button{
                    coordinator.back()
                }label: {
                    Text("Отменить")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}
