/**
 * Copyright IBM Corporation 2015
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import ObjectMapper
    
struct DialogError: WatsonError {
    var error: String!
    var code: Int!
    
    var nsError: NSError {
        let domain = DialogConstants.domain
        let userInfo = [NSLocalizedDescriptionKey: self.error]
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
    
    init() {}
    
    init?(_ map: Map) {}
    
    mutating func mapping(map: Map) {
        error <- map["error"]
        code <- map["code"]
    }
}
