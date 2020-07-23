# Dim-Target-Dectect

[![Dim-Target-Dectect compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/xiaoqi35/Dim-Target-Dectect)

A architech realized by **matlab** to detect dim and little point target.

The code of the whole project runs in Matlab environment. And the version of Matlab is R2019b runs on the Windows10.  

This repository contains:

1. [README](README.md) for how a standard README should look.
2. [data](./data/) A folder for storing data.
3. [./uitil](./uitil/) A folder filled by the IO files, and these files read/print image or video.
4. [other] Architech of detection: main* are main file and others are functions. Maybe you need to tune param struct data for detecting.

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Example Readmes](#example-readmes)
- [Contributing](#contributing)
- [License](#license)

## Background

1. Dim moving target detection and tracking technology has been a hot topic in the field of space remote sensing. At present, the miniaturization and high speed of the moving target to be detected and the further improvement of the detection range make the problem more complex. The civil aviation system uses the detection system based on visible light imaging to detect small targets moving in the radar blind area near the aircraft, such as birds, small unmanned aerial vehicles, etc., so as to avoid collision accidents between civil aircraft and these small targets. 
2. On the other hand, this dim target detection system can be used to detect space debris, meteorites and small meteors that endanger spacecraft in space exploration, so as to detect and warn in advance, so as to prepare for re planning the route or anti-collision. The detection system can find more faint asteroids and draw the track, which provides technical support for astrology, astronomy and other research.

## Install

This project uses [matlab](https://ww2.mathworks.cn/downloads/web_downloads/). Whether it is based windows or Linux, it can be okay! Go check them out if you don't have them locally installed.

## Usage

After your matlab done, run it and locate your directory. Carefully! Please add the project directory into executable path.  

### Generator

To use the generator, look at [generator-standard-readme](https://github.com/RichardLitt/generator-standard-readme). There is a global executable to run the generator in that package, aliased as `standard-readme`.

## Example Readmes

To see how the specification has been applied, see the [example-readmes](example-readmes/).

### Contributors

This project exists thanks to all the people who contribute. 
<a href="graphs/contributors"><img src="https://opencollective.com/standard-readme/contributors.svg?width=890&button=false" /></a>


## License

[shanghaitech](LICENSE) © xiaoqi
