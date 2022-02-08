#import "RuntimePlugin.h"
#if __has_include(<runtime/runtime-Swift.h>)
#import <runtime/runtime-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "runtime-Swift.h"
#endif

@implementation RuntimePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRuntimePlugin registerWithRegistrar:registrar];
}
@end
