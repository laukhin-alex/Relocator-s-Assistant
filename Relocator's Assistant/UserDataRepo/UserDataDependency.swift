//
//  UserDataDependency.swift
//  Relocator's Assistant
//
//  Created by Александр on 07.02.23.
//

import Foundation
import ComposableArchitecture

// MARK: - можно использовать враппер @AppStorage - см книгу working with data in SwiftU, раздел про AppStorage

private enum RepoDataKey: DependencyKey {
    static let liveValue = UserDefaultsRepository()
}

extension DependencyValues {
    var repoData: UserDefaultsRepository {
        get { self[RepoDataKey.self] }
        set { self[RepoDataKey.self] = newValue }
    }

}
