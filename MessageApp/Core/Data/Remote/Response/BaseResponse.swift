//
//  BaseResponse.swift
//  design_to_code14
//
//  Created by Iqbal Nur Haq on 09/12/23.
//  Copyright © 2023 Dheeraj Kumar Sharma. All rights reserved.
//

import Foundation


struct BaseResponse<T: Decodable>: Decodable {
    private enum CodingKeys: String, CodingKey {
        case results
    }
    
    let results: T
}
