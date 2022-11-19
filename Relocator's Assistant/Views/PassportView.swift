//
//  PassportView.swift
//  Relocator's Assistant
//
//  Created by Александр on 10.11.22.
//

import SwiftUI
import ComposableArchitecture
import CoreMedia

struct PassportView: View {
    let stateStore: Store<PassportState, PassportActions>
    @State private var date = Date()

    var body: some View {
        WithViewStore(stateStore) { viewStore in
        GeometryReader { geometry in
            ScrollView{
                VStack {
                    Text("Заграничный паспорт")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Image("passportF")
                        .resizable()
                        .frame(width: 100, height: 150)
                    Text("Несмотря на то, что гражданам РФ в некоторые страны можно въехать по паспорту гражданина РФ, мы настоятельно рекомендуем оформить заграничный паспорт.\nОбратите внимание! Заграничный паспорт можно оформить в дипломатическом представительстве РФ, однако, сроки получения паспорта превышают несколько месяцев и присутствуют огромные очереди - проще и быстрее оформить его по месту проживания.\nВот инструкция по получению:")
                    
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing])
                    Text("[Как заказать загранпаспорт на Госуслугах](https://www.gosuslugi.ru/help/faq/foreign_passport/23)")
                        .padding(.trailing)
                    Text("Если у Вас уже есть Заграничный паспорт, давайте проверим его дату окончания срока действия: для этого выберете дату окончания срока действия вашего паспорта (на картинке вторая дата)")
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing])
                    
                    Image("PassportDateOfExpiry")                        .resizable()
                        .frame(width: 250, height: 100)
                    Spacer()
                    DatePicker(
                        "Дата окончания срока действия:",
                        selection: viewStore.binding(
                            get: \.dateOfExpiry, send: PassportActions.dateOfExpiryCheck),
                        displayedComponents: [.date]
                    )
                    
                    .padding(.horizontal)
                    
                }
                }
            }
        }
    }

}

struct PassportView_Previews: PreviewProvider {
    static var previews: some View {
        PassportView(stateStore: Store<PassportState, PassportActions>(
            initialState: PassportState(), reducer: passportReducer,
            environment: PassportEnvironment()
        ))
    }
}
