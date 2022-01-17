//
//  ServerConfig.swift
//  MutipleCogfigurations
//
//  Created by M3ts LLC on 1/17/22.
//

import Foundation

enum BaseUrl: String {
    case LOCAL = "https:\\xyz-local.com"
    case DEV = "https:\\xyz-dev.com"
    case QA = "https:\\xyz-qa.com"
    case PROD = "https:\\xyz-prod.com"
    case DEMO = "https:\\xyz-demo.com"
}

class ServerConfig {
    static let shared: ServerConfig = ServerConfig()
    var baseUrl: String?
    
    func setupServerConfig() {
    #if LOCAL
        print("\nself.baseUrl = BaseUrl.LOCAL.rawValue  =>  : \(self.baseUrl = BaseUrl.LOCAL.rawValue) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
        self.baseUrl = BaseUrl.LOCAL.rawValue
    #elseif DEV
        print("\nself.baseUrl = BaseUrl.DEV.rawValue  =>  : \(self.baseUrl = BaseUrl.DEV.rawValue) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
        self.baseUrl = BaseUrl.DEV.rawValue
    #elseif QA
        print("\nself.baseUrl = BaseUrl.QA.rawValue  =>  : \(self.baseUrl = BaseUrl.QA.rawValue) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
        self.baseUrl = BaseUrl.QA.rawValue
    #elseif PROD
        print("\nself.baseUrl = BaseUrl.PROD.rawValue  =>  : \(self.baseUrl = BaseUrl.PROD.rawValue) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
        self.baseUrl = BaseUrl.PROD.rawValue
    #elseif DEMO
        print("\nself.baseUrl = BaseUrl.DEMO.rawValue  =>  : \(self.baseUrl = BaseUrl.DEMO.rawValue) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
        self.baseUrl = BaseUrl.DEMO.rawValue
    #endif
    }
    
    func setupFireBaseConfigFiles() {
        let fileName = getFireBaseConfigFileName()
        getFireBaseConfigFiles(fileName: fileName)
    }
    
    private func getFireBaseConfigFileName() -> String {
        var fileName = ""
    #if LOCAL
        fileName = "GoogleService-Info"
        print("\n File Name for FirebaseConfigs  in LOCAL =>  : \(fileName) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
    #elseif DEV
        fileName = "GoogleService-Info-dev"
        print("\n File Name for FirebaseConfigs  in DEV =>  : \(fileName) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
    #elseif QA
        fileName = "GoogleService-Info-dev"
        print("\n File Name for FirebaseConfigs  in QA =>  : \(fileName) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
    #elseif PROD
        fileName = "GoogleService-Info-dev"
        print("\n File Name for FirebaseConfigs  in PROD =>  : \(fileName) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
    #elseif DEMO
        fileName =  "GoogleService-Info-dev"
        print("\n File Name for FirebaseConfigs  in DEMO =>  : \(fileName) --- AT LINE : \(#line) -- OF \(#function) --IN \(#file)\n")
    #endif
        return fileName
    }
    
    private func getFireBaseConfigFiles(fileName: String) {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "plist")
        // Uncomment these rows when import Firebase and install the pod
       /* guard let fileopts = FirebaseOptions(contentsOfFile : filePath!) else {
            print("Cound not load firebase file.")
            return
        }
        FirebaseApp.configure(options: fileopts) */
    }
}

// Sources : 
// https://www.youtube.com/watch?v=W0uQd6QdnG0
