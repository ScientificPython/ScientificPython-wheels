# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# Enable Python fault handler on Pythons >= 3.3.
PYTHONFAULTHANDLER=1

function build_qt {
    build_simple qt-everywhere-opensource-src 
        4.8.7 https://download.qt.io/official_releases/qt/4.8/4.8.7 tar.gz
        -release -opensource -confirm-license
}

function pre_build {
    # Install the build dependencies
    build_qt
    suppress build_netcdf
}

function run_tests {
    :
}
