//
//  UIWebView+Smooth.h
//  SmoothWebView
//
//  Created by kaiinui on 2014/10/31.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Smooth)

# pragma mark - Enchant WebView Native Bahavior
/** @name Enchant WebView Native Bahavior */

/**
 *  Force this WebView to behave like native.
 *
 *  This is a composition method which does
 *
 *  1. `- smooth_enableSmoothScroll`
 *  2. `- smooth_removeGrayBackground`
 *  3. `- smooth_removeShadow`
 */
- (void)smooth_enableNativeLikeBahavior;

# pragma mark - Enhance WebView Bahavior
/** @name Enhance WebView Bahvior */

/**
 *  Enables smoother scroll.
 */
- (void)smooth_enableSmoothScroll;

/**
 *  Removes the gray background.
 */
- (void)smooth_removeGrayBackground;

/**
 *  Removes the shadow.
 */
- (void)smooth_removeShadow;

# pragma mark - Injecting the page Native Behavior
/** @name Injecting the page Native Behavior */

/**
 *  Removes all unexpected behavior from current page.
 *
 *  @warning This method should be called after the page loaded. (Typically on `- webViewDidFinishLoad:`)
 */
- (void)smooth_smoothAllForCurrentPage;

# pragma mark - Injecting the page Native Behavior in Low Level
/** @name Injecting the page Native Behavior in Low Level */

/**
 *  Disable selection that can be achive by long pressing.
 *
 *  @warning This method should be called after the page loaded. (Typically on `- webViewDidFinishLoad:`)
 */
- (void)smooth_removeSelectionCapabilityForCurrentPage;

/**
 *  Removes highlight color which appear on tapping links from current page.
 *
 *  @warning This method should be called after the page loaded. (Typically on `- webViewDidFinishLoad:`)
 */
- (void)smooth_removeTapHighLightForCurrentPage;

/**
 *  Removes action sheets that appears when you long press a link.
 *
 *  @warning This method should be called after the page loaded. (Typically on `- webViewDidFinishLoad:`)
 */
- (void)smooth_removeLongPressBehaviorForCurrentPage;

/**
 *  Removes tap latency which iOS inject for detecting double tap.
 *
 *  @warning This method should be called after the page loaded. (Typically on `- webViewDidFinishLoad:`)
 */
- (void)smooth_removeTapLatencyForCurrentPage;

@end
