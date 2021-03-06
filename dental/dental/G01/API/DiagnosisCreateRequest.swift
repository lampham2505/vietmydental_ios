//
//  DiagnosisCreateRequest.swift
//  dental
//
//  Created by Pham Trung Nguyen on 5/16/18.
//  Copyright © 2018 SPJ. All rights reserved.
//

import UIKit
import harpyframework

class DiagnosisCreateRequest: BaseRequest {
    /**
     * Set data content
     * - parameter name:        Name
     * - parameter description: Description
     */
    func setData(name: String, description: String) {
        self.data = "q=" + String.init(
            format: "{\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":\"%@\",\"%@\":%d}",
            DomainConst.KEY_TOKEN,              BaseModel.shared.getUserToken(),
            DomainConst.KEY_NAME,               name,
            DomainConst.KEY_DESCRIPTION,        description,
            DomainConst.KEY_PLATFORM,           DomainConst.PLATFORM_IOS
        )
    }
    
    /**
     * Request
     * - parameter view:                Current view
     * - parameter name:                Name
     * - parameter description:         Description
     * - parameter completionHandler:   Action execute when finish this task
     */
    public static func request(view: BaseViewController,
                               name: String, description: String,
                               completionHandler: ((Any?) -> Void)?) {
        let request = DiagnosisCreateRequest(
            url: G01Const.PATH_DIAGNOSIS_CREATE,
            reqMethod: DomainConst.HTTP_POST_REQUEST,
            view: view)
        request.setData(name: name, description: description)
        request.completionBlock = completionHandler
        request.execute()
    }
}
