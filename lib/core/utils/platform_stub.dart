// Stub file to handle platform-specific imports
// This prevents Isar files from being compiled for web

export 'platform_stub_unsupported.dart'
    if (dart.library.io) 'platform_stub_io.dart'
    if (dart.library.html) 'platform_stub_web.dart';
