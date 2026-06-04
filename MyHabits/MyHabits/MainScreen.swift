import Foundation
import SwiftUI

struct MainScreen: View {
    @Environment(Coordinator.self) var coordinator
    @State private var habits: [Cells] = []
    var body: some View {
        List{
            ForEach($habits){ $habit in
                HStack{
                    Text(habit.title)
                    Spacer()
                    Button{
                        habit.isCompletion.toggle()
                    }label: {
                        Image(systemName: habit.isCompletion ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(habit.isCompletion ? .green : .gray)
                    }
                }
            }
        }
        .navigationTitle("Привычки")
        .toolbar{
            Button("Добавить", systemImage: "plus") {
                coordinator.addHabit = { title in
                    let newHabit = Cells(title: title, isCompletion: false)
                    self.habits.append(newHabit)
                }
                coordinator.goTo(.added)
            }
        }
    }
}

