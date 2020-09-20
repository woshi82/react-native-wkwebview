//
//  NSURLProtocol+WebKitSupport.h
//  RCTWKWebView
//
//  Created by zengyanling on 2020/9/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLProtocol (WebKitSupport)
+ (void)wk_registerScheme:(NSString*)scheme;

+ (void)wk_unregisterScheme:(NSString*)scheme;
@end

NS_ASSUME_NONNULL_END
