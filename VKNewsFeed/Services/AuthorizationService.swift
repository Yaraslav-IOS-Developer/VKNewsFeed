//
//  AuthorizationService.swift
//  VKNewsFeed
//
//  Created by Yaroslav on 20.04.2021.
//

import Foundation
import VK_ios_sdk


protocol AuthorizationServiceDelegate: class {
    func authServiceShouldShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

 class AuthorizationService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7831901"
    private let vkSdk: VKSdk
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    weak var delegate: AuthorizationServiceDelegate?
    
    func wakeUpSesssion() {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) {[delegate] (state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFail()
            
            }
        }
    }
    // MARK: - VKSdkDelegate
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    //MARK: - VKSdkUIDelegate
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }

    }
