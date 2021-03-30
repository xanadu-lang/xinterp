# Xinterp-D3

An interpreter for assigning dynamic semantics to the D3-level syntax
of ATS3/Xanadu

## Build Status

* [![Build Status](https://travis-ci.org/xanadu-lang/Xinterp-D3.svg?branch=master)](https://travis-ci.org/xanadu-lang/Xinterp-D3) Ubuntu

## Download

```
git clone --recursive https://github.com/xanadu-lang/Xinterp-D3.git
```

## Prerequisites

ATS2-0.4.0 or a later version is required,
which is available [here](http://www.ats-lang.org/Downloads.html)

## Build with ATS2

```
(cd Xinterp-D3 && sh build.sh)
```

## Testing

```
cd Xinterp-D3
./bin/xinterp -h
make -C srcgen/TEST test > output
```

## Remarks

- Xinterp-D3 is for debugging ATS3/Xanadu

- Xinterp-D3 is *not* meant to be a practical interpreter for ATS3

- This project should be constantly under construction for quite some time
