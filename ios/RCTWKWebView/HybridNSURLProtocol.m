//
//  HybridNSURLProtocol.m
//  RCTWKWebView
//
//  Created by zengyanling on 2020/9/16.
//

#import <Foundation/Foundation.h>
#import "HybridNSURLProtocol.h"

static NSString* const KHybridNSURLProtocolHKey = @"KHybridNSURLProtocol";

@implementation HybridNSURLProtocol


+ (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog(@"zzzzz request.URL.absoluteString = %@",request.URL.absoluteString);
    NSString *scheme = [[request URL] scheme];
    if ( ([scheme caseInsensitiveCompare:@"http"]  == NSOrderedSame ||
          [scheme caseInsensitiveCompare:@"https"] == NSOrderedSame ))
    {
        NSLog(@"zzzzzzz HybridNSURLProtocol canInitWithRequest");
        //看看是否已经处理过了，防止无限循环
        if ([NSURLProtocol propertyForKey:KHybridNSURLProtocolHKey inRequest:request]) {
            return NO;
        }
        
        return YES;
    }
    return NO;
}
-(void) startLoading {
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    //给我们处理过的请求设置一个标识符, 防止无限循环,
    [NSURLProtocol setProperty:@YES forKey:KHybridNSURLProtocolHKey inRequest:mutableReqeust];
    
    NSLog(@"zzzzzz startLoading:: %@", mutableReqeust.URL.absoluteString);
    
}
- (void)stopLoading {
    NSLog(@"zzzzzz stopLoading");
}

@end

