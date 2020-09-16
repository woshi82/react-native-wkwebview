//
//  HybridNSURLProtocol.m
//  RCTWKWebView
//
//  Created by zengyanling on 2020/9/16.
//

#import <Foundation/Foundation.h>
#import "HybridNSURLProtocol.h"

@implementation HybridNSURLProtocol


+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog(@"request.URL.absoluteString = %@",request.URL.absoluteString);
    NSString *scheme = [[request URL] scheme];
    if ( ([scheme caseInsensitiveCompare:@"http"]  == NSOrderedSame ||
          [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame ))
    {
    //看看是否已经处理过了，防止无限循环
        // TODO: here
        if ([NSURLProtocol propertyForKey:KHybridNSURLProtocolHKey inRequest:request]) {
            return NO;
        }
        
        return YES;
    }
    return NO;
}

@end

