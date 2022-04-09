# pixel_perfect

[![Pub](https://img.shields.io/pub/v/pixel_perfect.svg)](https://pub.dartlang.org/packages/pixel_perfect)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/kherel/pixel_perfect)
[![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)](https://github.com/Solido/awesome-flutter)

![logo](logo.png)

Put a semi-transparent image with the design over the top of the developed layout. It helps you to compare original design and current page.

![demo1](demo1.gif)


![demo2](demo2.gif)

## Getting started

Add pixel_perfect in your `pubspec.yaml` dependencies.

```yaml
dependencies:
 pixel_perfect: any
```

### How To Use

**Simple use**

Add assets folder with images to your `pubspec.yaml`

```yaml
  uses-material-design: true
  assets:
    - assets/
```

Import the following package in your dart file

```dart
import 'package:pixel_perfect/pixel_perfect.dart';
```

```dart

return PixelPerfect(
  assetPath: 'assets/design.png', // path to your asset image
  scale: 1, // scale value (optional)
  initBottom: 20, //  default bottom distance (optional)
  offset: Offset.zero, // default image offset (optional)
  initOpacity: 0.4, // init opacity value (optional)
  child: Scaffold(
    ..
  )
)
```

**Extended use**

```dart

return PixelPerfect.extended(
  image: Image.asset( // any image file
    'assets/element.png',
    scale: 2,
  ), 
  initBottom: 20, //  default bottom distance (optional)
  offset: Offset.zero, // default image offset (optional)
  initOpacity: 0.4, // init opacity value (optional)
  child: Scaffold(
    ..
  )
)
```


**Video tutorials** by [Learn App Code](https://www.youtube.com/channel/UChMjpXwPFzK6x82qz-R_TEQ)

[How to Make Pixel Perfect Flutter Apps](https://www.youtube.com/watch?v=L4G_ylrmKQ8)  
[How to Make Responsive Flutter Apps, Pixel Perfect](https://www.youtube.com/watch?v=Chat5vYVGg0) 
