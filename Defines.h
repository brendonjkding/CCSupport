#if TARGET_OS_SIMULATOR
#define RootPath "/opt/simject"
#else
#define RootPath
#endif

#define DefaultModuleConfigurationPath @"/var/mobile/Library/ControlCenter/ModuleConfiguration.plist"
#define CCSupportModuleConfigurationPath @RootPath@"/var/mobile/Library/ControlCenter/ModuleConfiguration_CCSupport.plist"
#define DefaultModuleOrderPath @"/System/Library/PrivateFrameworks/ControlCenterServices.framework/DefaultModuleOrder~%@.plist"

#define CCSupportBundlePath @RootPath@"/Library/Application Support/CCSupport"
#define CCSupportModulesPath @RootPath@"/Library/ControlCenter/Bundles"
#define CCSupportProvidersPath @RootPath@"/Library/ControlCenter/CCSupport_Providers"

#define iOS15_WhitelistedFixedModuleIdentifiers @[@"com.apple.replaykit.AudioConferenceControlCenterModule", @"com.apple.replaykit.VideoConferenceControlCenterModule"]

#ifndef kCFCoreFoundationVersionNumber_iOS_15_0
#define kCFCoreFoundationVersionNumber_iOS_15_0 1854
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_16_0
#define kCFCoreFoundationVersionNumber_iOS_16_0 1932.101
#endif
