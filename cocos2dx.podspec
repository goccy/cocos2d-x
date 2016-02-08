Pod::Spec.new do |s|

  cocos2dx_root  = "$(PODS_ROOT)/../cocos2dx"
  cocos_root     = "#{cocos2dx_root}/cocos"
  s.name         = "cocos2dx"
  s.version      = "0.0.1"
  s.summary      = ""
  s.description  = ""
  s.homepage     = ""
  s.license      = { :type => 'MIT' }
  s.author       = { "goccy" => "goccy54@gmail.com" }
  s.public_header_files = ''
  
  header_search_path = "#{cocos_root} #{cocos2dx_root} #{cocos2dx_root}/extensions #{cocos_root}/editor-support #{cocos2dx_root}/external #{cocos2dx_root}/external/freetype2/include/ios/freetype2 #{cocos2dx_root}/external/curl/include/ios #{cocos_root}/platform/ios #{cocos_root}/platform/ios/Simulation  #{cocos2dx_root}/external/websockets/include/ios #{cocos2dx_root}/external/bullet"

  library_search_path_template = "#{cocos2dx_root}/external/%s/prebuilt/ios"
  ios_library_search_path = [
    'curl', 'png', 'jpeg', 'chipmunk', 'freetype2', 'tiff', 'webp', 'websockets'
  ].map { |lib|
    sprintf(library_search_path_template, lib)
  }.join(' ')
  
  s.ios.preserve_paths  = "external/**/prebuilt/ios/lib*.a"
  s.libraries           = 'curl', 'crypto', 'ssl', 'png', 'jpeg', 'chipmunk', 'freetype', 'tiff', 'webp', 'websockets', 'iconv'
  s.ios.frameworks      = 'CoreMotion', 'GameController'
  
  s.xcconfig = {
    HEADER_SEARCH_PATHS: header_search_path,
    LIBRARY_SEARCH_PATHS: ios_library_search_path
  }

  s.source        = { :git => "git@github.com:goccy/cocos2d-x.git", :tag => "0.0.1" }
  s.source_files  = 'cocos/*.{h,cpp}'
  s.requires_arc  = false

  cocos_2d     = "cocos/2d/**/*.{h,cpp}"
  cocos_3d     = "cocos/3d/**/*.{h,cpp}"
  cocos_audio  = "cocos/audio/*.cpp", "cocos/audio/include/*.h", "cocos/audio/ios/**/*.{h,m}"
  cocos_base   = "cocos/base/**/*.{h,cpp,c,mm}"
  cocos_deprecated = "cocos/deprecated/**/*.{h,cpp}"
  cocos_editor_support = "cocos/editor-support/**/*.{h,cpp}"
  cocos_extensions     = "cocos/extensions/**/*.{h,cpp}"
  cocos_math           = "cocos/math/**/*.{h,cpp}"
  cocos_navmesh        = "cocos/navmesh/**/*.{h,cpp}"
  cocos_network        = "cocos/network/CCDownloader.{h,cpp}", "cocos/network/CCDownloader-curl.{h,cpp}", "cocos/network/HttpClient.{h,cpp}", "cocos/network/HttpCookie.{h,cpp}", "cocos/network/SocketIO.{h,cpp}", "cocos/network/WebSocket.{h,cpp}", "cocos/network/Http{Request,Response}.h"
  cocos_physics        = "cocos/physics/**/*.{h,cpp}"
  cocos_physics3d      = "cocos/physics3d/**/*.{h,cpp}"
  cocos_platform       = "cocos/platform/*.{h,cpp}", "cocos/platform/{ios,apple}/**/*.{h,cpp,m,mm}"
  cocos_renderer       = "cocos/renderer/**/*.{h,cpp}"
  cocos_storage        = "cocos/storage/**/*.{h,cpp}"
  cocos_ui             = "cocos/ui/**/*.{h,cpp,mm}"

  external_clipper = "external/clipper/**/*.{hpp,cpp}"
  external_recast  = "external/recast/**/*.{h,cpp,c}"
  external_poly2tri = "external/poly2tri/**/*.{h,cc}"
  external_flatbuffers  = "external/flatbuffers/**/*.{h,cpp}"
  external_ConvertUTF  = "external/ConvertUTF/**/*.{h,cpp,c}"
  external_xxhash  = "external/xxhash/**/*.{h,c}"
  external_Box2D  = "external/Box2D/**/*.{h,cpp}"
  external_bullet = "external/bullet/**/*.{h,cpp}"
  external_chipmunk  = "external/chipmunk/**/*.h"
  external_curl  = "external/curl/include/ios/*.h"
  external_edtaa3func  = "external/edtaa3func/**/*.{h,cpp}"
  external_freetype2  = "external/freetype2/include/ios/**/*.h"
  external_jpeg       = "external/jpeg/include/ios/*.h"
  external_png       = "external/png/include/ios/*.h"
  external_json      = "external/json/*.h", "external/json/internal/*.h"
  external_tiff      = "external/tiff/include/ios/*.h"
  external_tinyxml2  = "external/tinyxml2/*.{h,cpp}"
  external_unzip     = "external/unzip/*.{h,cpp}"
  external_webp      = "external/webp/include/ios/*.h"
  external_websocket = "external/websockets/include/ios/*.h"

  source_files = [
    cocos_2d, cocos_3d, cocos_audio, cocos_base, cocos_deprecated, cocos_editor_support,
    cocos_extensions, cocos_math, cocos_navmesh, cocos_network, cocos_physics, cocos_physics3d,
    cocos_platform, cocos_renderer, cocos_storage, cocos_ui,
    external_tinyxml2, external_curl, external_unzip, external_edtaa3func, external_jpeg, external_png,
    external_tiff, external_webp, external_xxhash, external_flatbuffers, external_clipper,
    external_poly2tri, external_ConvertUTF, external_chipmunk, external_recast, external_bullet
  ].flatten
  
#  exclude_platforms = [ 'android', 'apple', 'desktop', 'linux', 'mac', 'win32', 'win8.1-universal', 'winrt' ]
#  exclude_files = exclude_platforms.map { |platform| "cocos/platform/#{platform}/**/*.{h,cpp}" }

  s.subspec 'source' do |ss|
    ss.source_files  = source_files
    ss.exclude_files = "cocos/**/*android.{h,cpp}", "cocos/ui/UIWebView.cpp", "external/**/*DX11*", "external/**/*Win32*", "external/**/*OpenCL*", "external/**/btSoftBodySolverOutputCLtoGL*", "cocos/**/*winrt.{h,cpp}"
  end

end
