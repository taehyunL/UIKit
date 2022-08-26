//
//  Petition.swift
//  WhitehousePetitions
//
//  Created by 이태현 on 2022/08/26.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
