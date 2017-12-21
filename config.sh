# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# Enable Python fault handler on Pythons >= 3.3.
PYTHONFAULTHANDLER=1

function build_simple {
    # Example: build_simple libpng $LIBPNG_VERSION \
    #               http://download.sourceforge.net/libpng tar.gz \
    #               --additional --configure --arguments
    local name=$1
    local version=$2
    local url=$3
    local ext=${4:-tar.gz}
    local configure_args=${@:5}
    if [ -e "${name}-stamp" ]; then
        return
    fi
    local name_version="${name}-${version}"
    local archive=${name_version}.${ext}
    fetch_unpack $url/$archive
    (cd $name_version \
        && ./configure --prefix=$BUILD_PREFIX $configure_args \
        && make -j4 \
        && make install)
    touch "${name}-stamp"
}

function build_qt {
    build_simple qt-everywhere-opensource-src 4.8.7 \
        https://download.qt.io/official_releases/qt/4.8/4.8.7 tar.gz \
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
