//
//  UIWebView+Smooth.m
//  SmoothWebView
//
//  Created by kaiinui on 2014/10/31.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "UIWebView+Smooth.h"

@implementation UIWebView (Smooth)

# pragma mark - Enchant WebView Native Bahavior
/** @name Enchant WebView Native Bahavior */

- (void)smooth_enableNativeLikeBahavior {
    [self smooth_enableSmoothScroll];
    [self smooth_removeGrayBackground];
    [self smooth_removeShadow];
}

# pragma mark - Enhance WebView Bahavior
/** @name Enhance WebView Bahvior */

- (void)smooth_enableSmoothScroll {
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
}

- (void)smooth_removeGrayBackground {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)smooth_removeShadow {
    for (UIView *subview in self.scrollView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            [subview setHidden:YES];
        }
    }
}

# pragma mark - Injecting the page Native Behavior
/** @name Injecting the page Native Behavior */

- (void)smooth_smoothAllForCurrentPage {
    [self smooth_removeSelectionCapabilityForCurrentPage];
    [self smooth_removeTapLatencyForCurrentPage];
    [self smooth_removeTapHighLightForCurrentPage];
    [self smooth_removeLongPressBehaviorForCurrentPage];
}

/**
 *  Setting all <a>'s `-webkit-tap-highlight-color` to transparent.
 *
 *  @see http://www.quora.com/How-do-you-make-UIWebView-behave-like-a-native-app
 */
- (void)smooth_removeTapHighLightForCurrentPage {
    [self stringByEvaluatingJavaScriptFromString:@"NodeList.prototype.forEach=Array.prototype.forEach;document.querySelectorAll('a').forEach(function(el){el.style['-webkit-tap-highlight-color']='rgba(0,0,0,0)'});"];
}

- (void)smooth_removeSelectionCapabilityForCurrentPage {
    [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
}

- (void)smooth_removeLongPressBehaviorForCurrentPage {
    [self stringByEvaluatingJavaScriptFromString:@"document.body.style.webkitTouchCallout='none';"];
}

/**
 *  @see https://github.com/tmwagency/swiftclick
 */
- (void)smooth_removeTapLatencyForCurrentPage {
    /*
     ---------------------------------------------------------------------------------------------
     
     The SwiftClick library has been inspired by and uses much of the core logic from FastClick:
     
     https://github.com/ftlabs/fastclick
     Copyright (C) 2012 The Financial Times Ltd.
     
     ---------------------------------------------------------------------------------------------
     
     Copyright (C) 2013 Tullo Marshall Warren.
     
     Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
     
     The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
     
     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
     */
    [self stringByEvaluatingJavaScriptFromString:@"function SwiftClick(a){function b(){\"function\"==typeof k&&(j.addEventListener(\"click\",c,!1),j.onclick=null),j.addEventListener(\"touchstart\",d,!1),j.addEventListener(\"click\",f,!0)}function c(a){k(a)}function d(a){var b=a.target,c=b.nodeName.toLowerCase(),d=a.changedTouches[0];return m.x=d.pageX,m.y=d.pageY,n=h(),\"undefined\"==typeof i.options.elements[c]?!0:l?(o=!1,!0):(a.stopPropagation(),l=!0,b.removeEventListener(\"touchend\",e,!1),b.addEventListener(\"touchend\",e,!1),void 0)}function e(a){var b,c=a.target,d=!0;return c.removeEventListener(\"touchend\",e,!1),b=a.changedTouches[0],!o||Math.abs(b.pageX-m.x)>i.options.maxTouchDrift||Math.abs(b.pageY-m.y)>i.options.maxTouchDrift||Math.abs(h().x-n.x)>i.options.maxTouchDrift||Math.abs(h().y-n.y)>i.options.maxTouchDrift?(l&&(a.stopPropagation(),a.preventDefault(),d=!1),l=!1,o=!0,d):(a.stopPropagation(),a.preventDefault(),p=!1,c.focus(),g(c,b),l=!1,o=!0,!1)}function f(a){var b=a.target,c=b.nodeName.toLowerCase();if(\"undefined\"!=typeof i.options.elements[c]){if(p)return p=!1,a.stopPropagation(),a.preventDefault(),!1;p=!0}}function g(a,b){var c=document.createEvent(\"MouseEvents\");c.initMouseEvent(\"click\",!0,!0,window,1,b.screenX,b.screenY,b.clientX,b.clientY,!1,!1,!1,!1,0,null),a.dispatchEvent(c)}function h(){var a={x:window.pageXOffset||document.body.scrollLeft||document.documentElement.scrollLeft||0,y:window.pageYOffset||document.body.scrollTop||document.documentElement.scrollTop||0};return a}if(\"undefined\"!=typeof SwiftClick.swiftDictionary[a])return SwiftClick.swiftDictionary[a];SwiftClick.swiftDictionary[a]=this,this.options={elements:{a:\"a\",div:\"div\",span:\"span\",button:\"button\"},maxTouchDrift:30};var i=this,j=a,k=j.onclick,l=!1,m={x:0,y:0},n={x:0,y:0},o=!0,p=!1;\"onorientationchange\"in window&&\"ontouchstart\"in window&&b(),i.addNodeNamesToTrack=function(a){var b,c=0,d=a.length;for(c;d>c;c++){if(\"string\"!=typeof a[c])throw new TypeError(\"all values within the 'nodeNames' array must be of type 'string'\");b=a[c].toLowerCase(),i.options.elements[b]=b}},i.replaceNodeNamesToTrack=function(a){i.options.elements={},i.addNodeNamesToTrack(a)}}SwiftClick.swiftDictionary={},SwiftClick.attach=function(a){\"use strict\";return\"undefined\"!=typeof SwiftClick.swiftDictionary[a]?SwiftClick.swiftDictionary[a]:new SwiftClick(a)},\"undefined\"!=typeof define&&define.amd?define(function(){\"use strict\";return SwiftClick}):\"undefined\"!=typeof module&&module.exports?module.exports=SwiftClick:window.SwiftClick=SwiftClick;SwiftClick.attach(document.body);"];
}

@end
