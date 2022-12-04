# swift-flipper

<p align="center">
  <img src="swift-flipper.png" />
</p>

## What is swift-flipper?
swift-flipper is a new Swift package that exposes a Flipper client to your iOS | MacOS | executable packages | server-side Swift applications and, allows you to easily develop new or reuse existing Flipper plugins.

This new swift-flipper SDK expands Flipper’s focus area and adds support for non-mobile Swift applications.

This repository has a bunch of example applications that you can play with to understand how to write a Flipper plugin, how to send/listen to events, and how the end-to-end integration works. (UserDefaults Plugin, Network Plugin, Custom Logger Plugin, Tic-Tac-Toe to demonstrate bi-directional communication etc.)

The assumptions, working, connection constraints of swift-flipper here are the same as that of [js-flipper](https://developers.facebook.com/blog/post/2022/08/25/flipper-and-js-why-we-added-javascript-support-to-a-mobile-debugging-platform/) (open-sourced by Meta).

## Why swift-flipper?

<p align="center">
  <img src="flipper.png" />
</p>

I am a huge fan of Flipper and have been using it in a lot of my projects for quite some time. The following are the benefits I thought would be something that swift-flipper can help with:

Extending the debugging experience for non-mobile Swift applications as this is something that the official Flipper SDK doesn’t support. It is helpful for Swift server-side applications.
swift-flipper has ZERO dependencies. This can be leveraged for mobile applications as well if you are facing issues with the official SDK (dependency hassles - don’t want to support a big dependency stack for your debug builds, etc.)
It is a great alternative to debug your iOS, macOS, React Native, etc applications. Checkout this thread that talks about why something like this would be helpful to the developer community as this package helps you to directly connect to Flipper IDE without needing any intermediate bridges, without going through any dependency management hassles (there are 0 dependencies for this to work in the Swift world) - https://github.com/facebook/flipper/issues/3319.
Swift package support - Flipper is a great tool and this just makes it a bit more accessible to developers that have similar requirements. https://github.com/facebook/flipper/issues/1431.
We also don’t need to install any IDB support. (and so don’t have to deal with any [IDB](https://github.com/facebook/idb) related issues).
Having the entire Client SDK in Swift also makes it easier for the Swift community to maintain, iterate and contribute.

## Limitations of this tool and Solutions

1. Simulator and Device connectivity both work well. However, when debugging on a device(connected via USB), the client needs to connect via web-socket to the Flipper IDE opened on the developer’s machine. So, we need to explicitly provide the developer machine’s IP address.  This is taken as a part of the client side configuration. Now, though this sounds doable and also works well, it might not be the ideal developer experience. We ideally would want this connectivity to be purely invisible regardless of simulator/device host. In order to achieve this, we need a bunch of extra libraries like Peertalk, OpenSSL etc to achieve the above as well as have secure connections with the Flipper IDE. In order to keep things light-weight and since this might not be a concern for a few use-cases, we don’t plan to support this in swift-flipper and the solution is to use [FlipperLite](https://github.com/chiragramani/FlipperLite) or the official Flipper SDK.

2. You might want developers to take advantage of device specific support that is provided via IDB, (screenshot captures and video recording from the Flipper IDE, Logs plugin). This is not supported by swift-flipper and the solution is to use [FlipperLite](https://github.com/chiragramani/FlipperLite)  or the official Flipper SDK.

## If you are interested to know more about Flipper, the following should help:

1. https://fbflipper.com/
2. https://engineering.fb.com/2018/06/11/android/flipper/ 
3. https://fbflipper.com/blog/2022/02/21/js-flipper-announcement/
4. Mobile@Scale Tel Aviv – Flipper: An extensible mobile app debugger - https://www.facebook.com/atscaleevents/videos/mobilescale-tel-aviv-flipper-an-extensible-mobile-app-debugger/2210661825632394/ 
5. [Flipper and JS: why we added JavaScript support to a mobile debugging platform](https://developers.facebook.com/blog/post/2022/08/25/flipper-and-js-why-we-added-javascript-support-to-a-mobile-debugging-platform/)
6. https://www.youtube.com/watch?v=WCs09c1B1Lk 
7. Flipper: The Extensible DevTool Platform for React Native - Michel Weststrate aka @mweststrate - https://www.youtube.com/watch?v=WltZTn3ODW4
