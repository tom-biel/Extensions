//
//  File.swift
//  
//
//  Created by Tom Biel on 11/2/19.
//


CF_IMPLICIT_BRIDGING_ENABLED            // get rid of Unmanaged
#pragma clang assume_nonnull begin      // also get rid of !s

CFStringRef CreateJoinedString(CFStringRef string1, CFStringRef string2);

#pragma clang assume_nonnull end
CF_IMPLICIT_BRIDGING_DISABLED
