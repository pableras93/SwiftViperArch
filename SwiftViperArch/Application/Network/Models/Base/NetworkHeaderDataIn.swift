//
//  NetworkHeaderDataIn.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 This class econdes the common fields that are sent in every service network call.
 */
class NetworkHeaderDataIn: NetworkConfigInfo, Encodable {
    
    /**
     Enum with all literals fields sent into every service network call.
     */
    
    // TODO: INFORMAR ESTOS CAMPOS CUANDO ESTÉN SUS SERVICIOS
    let clientId = ""
    let languageId = ""
    let userId = ""
    
    enum NetworkHeaderDataInCodingKeys: String, CodingKey {
        case branding = "branding"
        case appId = "idAplicacion"
        case channelId = "idCanal"
        case companyId = "idEmpresa"
        case clientId = "idCliente"
        case uniqueId = "idUnico"
        case userId = "idUsuario"
        case languageId = "idIdioma"
        case prescriberId = "idPrescriptor"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: NetworkHeaderDataInCodingKeys.self)
        try container.encode(branding, forKey: .branding)
        try container.encode(appId, forKey: .appId)
        try container.encode(channelId, forKey: .channelId)
        try container.encode(companyId, forKey: .companyId)
        try container.encode(clientId, forKey: .clientId)
        try container.encode(uniqueId, forKey: .uniqueId)
        try container.encode(userId, forKey: .userId)
        try container.encode(languageId, forKey: .languageId)
        try container.encode(prescriberId, forKey: .prescriberId)
    }
}
