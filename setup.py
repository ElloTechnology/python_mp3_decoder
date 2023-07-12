#!/usr/bin/env python

""" Setup mp3 decoder """

from setuptools import setup, Extension

interlace_module = Extension(
    "pymp3decoder._pymp3_c",
    sources=[
        "pymp3decoder/pymp3_c.i",
    ],
    libraries=['mp3lame'],
    # Assuming homebrew on mac
    include_dirs=[
        '/opt/homebrew/include',
        '/usr/local/include',
    ],
    runtime_library_dirs=[
        '/opt/homebrew/lib',
        '/usr/local/lib',
    ],
    swig_opts=['-c++', '-py3', '-module', 'pymp3_c']
)

setup(
    name="pymp3decoder",
    version="0.0.1",
    author="Michael Boulton",
    license="MIT",
    keywords="mp3 decoder",
    author_email="michael.boulton@gmail.com",
    description="Simple chunked mp3 decoder",
    ext_modules=[interlace_module],
    packages=["pymp3decoder"],
    test_suite="tests",
    setup_requires=['pytest-runner'],
    tests_require=['pytest', 'pyaudio'],
)
