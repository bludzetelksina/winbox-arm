add_executable(winbox-arm
    main.cpp
    winbox_client.cpp
    ui/main_window.cpp
    ui/resources.qrc
    protocol/winbox_protocol.cpp
    utils/logger.cpp
)

target_link_libraries(winbox-arm Qt6::Widgets Qt6::Network)
target_include_directories(winbox-arm PRIVATE protocol/ ui/ utils/)

# Translation files
set(TS_FILES
    ../assets/translations/en_US.ts
    ../assets/translations/ru_RU.ts
)

# Generate .qm files from .ts files and add to target
qt6_add_translations(winbox-arm TS_FILES ${TS_FILES})