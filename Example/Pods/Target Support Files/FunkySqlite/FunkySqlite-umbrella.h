#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HSModelProtocol.h"
#import "HSModelTool.h"
#import "HSSqliteModelTool.h"
#import "HSSqliteTool.h"
#import "HSTableTool.h"

FOUNDATION_EXPORT double FunkySqliteVersionNumber;
FOUNDATION_EXPORT const unsigned char FunkySqliteVersionString[];

