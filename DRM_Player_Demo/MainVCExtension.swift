//
//  Videoplayer.swift
//  DRM_Player_Demo
//
//  Created by Appsquadz on 01/12/24.
//

import Foundation
import PallyConFPSSDK

extension MainVC: PallyConFPSLicenseDelegate {

    func fpsLicenseDidSuccessAcquiring(contentId: String) {
        print(" license provided")
    }

    func fpsLicense(contentId: String, didFailWithError error: Error) {
        print("didFailWithError. error message (\(error.localizedDescription))")
        if let error = error as? PallyConSDKException {
            switch error {
                case .ServerConnectionFail(let message):
                    print("server connection fail = \(message)")
                case .NetworkError(let networkError):
                    print("Network Error = \(networkError)")
                case .AcquireLicenseFailFromServer(let code, let message):
                    print("ServerCode = \(code).\n\(message)")
                case .DatabaseProcessError(let message):
                    print("DB Error = \(message)")
                case .InternalException(let message):
                    print("SDK internal Error = \(message)")
                default:
                    print("Error: \(error). Unkown.")
            }
        } else {
            print("Error: \(error). Unkown")
        }
    }
}
