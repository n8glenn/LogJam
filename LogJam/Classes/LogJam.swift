//
//  LogJam.swift
//
//
//  Created by Nate Glenn on 10/17/2018.
//  Copyright © 2018 Nate Glenn. All rights reserved.
//

import Foundation

public enum LogLevel: Int
{
    case Information = 0
    case Debug = 1
    case Error = 2
}

public class LogJam: NSObject
{
    public var domains:Array<String> = Array<String>()
    public var active:Bool = false
    public var currentDomain:String = ""
    public var level:LogLevel = LogLevel.Error
    
    public static let shared = LogJam()
    private override init() {}

    // initialize as a singleton...
    /*
    class var sharedInstance:LogJam
    {
        struct Singleton
        {
            static let instance = LogJam()
        }
        return Singleton.instance;
    }
    */
    
    public func clearDomains()
    {        
        self.domains = Array<String>()
    }
    
    public func setAllDomains()
    {
        self.clearDomains()
        self.domains.append("all")
    }
    
    public func setNoDomains()
    {
        self.clearDomains()
        self.domains.append("none")
    }
    
    public func addDomain(domain:String)
    {
        if (domain.caseInsensitiveCompare("all") == ComparisonResult.orderedSame)
        {
            self.setAllDomains()
        }
        else if (domain.caseInsensitiveCompare("none") == ComparisonResult.orderedSame)
        {
            self.setNoDomains()
        }
        else
        {
            var found:Bool = false

            for (_, value) in self.domains.enumerated()
            {
                if (value.caseInsensitiveCompare(domain) == ComparisonResult.orderedSame)
                {
                    found = true
                }
            }
            if (!found)
            {
                self.domains.append(domain)
            }
        }
    }
    
    public func log(message:String)
    {
        self.log(level: .Error, domain: self.currentDomain, message: message)
    }
    
    public func log(level:LogLevel, message:String)
    {
        self.log(level: level, domain: self.currentDomain, message: message)
    }
    
    public func log(domain:String, message:String)
    {
        self.log(level: .Error, domain: domain, message: message)
    }
    
    public func log(level:LogLevel, domain:String, message:String)
    {
        if (!active) { return };
        
        var found:Bool = false
        
        for value in self.domains
        {
            if (level.rawValue < self.level.rawValue)
            {
                break
            }
            else if (value.caseInsensitiveCompare("all") == ComparisonResult.orderedSame)
            {
                found = true
                break
            }
            else if (value.caseInsensitiveCompare("none") == ComparisonResult.orderedSame)
            {
                break;
            }
            else
            {
                let domainArray:Array = value.split(separator: ".").map(String.init)
                let inputArray:Array = domain.split(separator: ".").map(String.init)
                var mismatch:Bool = false
                if (domainArray.count > inputArray.count)
                {
                    mismatch = true
                }
                else
                {
                    for (index, value) in domainArray.enumerated()
                    {
                        if (value.caseInsensitiveCompare(inputArray[index]) != ComparisonResult.orderedSame)
                        {
                            mismatch = true
                            break
                        }
                    }
                }
                found = !mismatch
                if (found)
                {
                    break
                }
            }
        }
        if (found)
        {
            switch level
            {
            case .Debug:
                NSLog("DEBUG......")
                break
            case .Information:
                NSLog("INFO.......")
                break
            case .Error:
                NSLog("!!!ERROR!!!")
                break
            }
            NSLog("Domain:.... %@", domain)
            NSLog("Message:... %@", message)
            NSLog("-----------")
        }
    }
}
