# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

# Enable Python fault handler on Pythons >= 3.3.
PYTHONFAULTHANDLER=1

set -e -x

function pre_build {
    # Install the build dependencies
    suppress build_netcdf
}

function run_tests {
    :
}
