
cmake_minimum_required(VERSION 3.5)

project(Rosary LANGUAGES CXX VERSION 1.0.0)

# Find all required package, if some is missing it will result in error in target_link_libraries
find_package(Qt6 REQUIRED COMPONENTS
  Core
  Gui
  Qml
  Quick
  QuickControls2
  Svg
  Xml
  Pdf
#  QuickCompiler
  WebEngineQuick
  )
find_package(Qt6 QUIET COMPONENTS QmlWorkerScript)

add_executable(Rosary src/main.cpp qml/qml.qrc)

# Require cmake 3.8 but way nicer than writing to global CMAKE_CXX_STANDARD
target_compile_features(Rosary PUBLIC cxx_std_11)

# Better to use the target PROPERTIES and not global set(CMAKE_AUTOMOC ON)
# Otherwise if superbuild, moc will try to moc dependencies too.
set_target_properties(Rosary PROPERTIES AUTORCC TRUE)
set_target_properties(Rosary PROPERTIES AUTOMOC TRUE)

# target_link_libraries and not qt5_use_module because it is deprecated
target_link_libraries(Rosary PRIVATE
  Qt6::Core
  Qt6::Gui
  Qt6::Svg
  Qt6::Xml
  Qt6::Qml
  Qt6::Quick
  Qt6::QuickControls2
  Qt6::WebEngineQuick
  Qt6::Pdf
)

# Only use static macro if linking with static qt
get_target_property(QT_TARGET_TYPE Qt6::Core TYPE)
if(${QT_TARGET_TYPE} STREQUAL "STATIC_LIBRARY")
  include(cmake/FetchQtStaticCMake.cmake)

  qt_generate_plugin_import(Rosary VERBOSE)

  # EXTRA_PLUGIN are the one required by plugin loaded by qt_generate_plugin_import
  # It's not automatic yet :( All this workflow might change in future version of qt
  # with better and better cmake support
  qt_generate_qml_plugin_import(Rosary
    QML_SRC ${CMAKE_CURRENT_SOURCE_DIR}/qml
    EXTRA_PLUGIN
      QtQuickVirtualKeyboardPlugin
      QtQuickVirtualKeyboardSettingsPlugin
      QtQuickVirtualKeyboardStylesPlugin
      QmlFolderListModelPlugin
      QQuickLayoutsPlugin
    VERBOSE
  )

endif()

# This target needs to be linked after qt_generate_qml_plugin_import call.
# This is hiding a bug somewhere ...
if(TARGET Qt5::QmlWorkerScript)
  target_link_libraries(Rosary PRIVATE Qt5::QmlWorkerScript)
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "iOS")
  include(cmake/FetchQtIosCMake.cmake)
  add_qt_ios_app(Rosary VERBOSE)
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Emscripten")
  include(cmake/FetchQtWasmCMake.cmake)
  add_qt_wasm_app(Rosary)
endif()
