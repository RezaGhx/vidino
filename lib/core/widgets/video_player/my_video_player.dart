import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../config/resoureces/my_color.dart';

class MyVideoPlayer extends StatefulWidget {
  EdgeInsetsGeometry? padding;
  String? videoUrl;
  double? size;
  Function(ChewieController?)? onTap;

  MyVideoPlayer({super.key,
    this.padding,
    this.videoUrl,
    this.size,
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() {
    return _MyVideoPlayerState();
  }
}

class _MyVideoPlayerState extends State<MyVideoPlayer>
    with WidgetsBindingObserver {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;
  bool _isMuted = false,
      isFullScreen = false,
      isCheck = false,
      isVisibleLoading = false;
  String? progressString, nameFile, local;
  String? nameFolder;
  String timeLineFullScreen = "";
  double positionTimeLine = 0.0, positionMaxTimeLine = 1.0;
  Stream<FileResponse>? fileStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // _getStoragePermission();
    _createChewieController(widget.videoUrl!, false);
    setState(() {
      isCheck = false;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // setState(() {
    _videoPlayerController1.dispose();
    _chewieController!.dispose();
    // });
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // user returned to our app
    } else if (state == AppLifecycleState.inactive) {
      setState(() {
        _chewieController!.pause();
        _videoPlayerController1.pause();
      });
      // app is inactive
    } else if (state == AppLifecycleState.paused) {
      // user is about quit our app temporally
    }
  }

  void _createChewieController(String? path, bool? check) async {
    _videoPlayerController1 = check == false
        ? VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl!),
    )
        : VideoPlayerController.file(
      File(path!),
    )
      ..addListener(() {
        setState(() {

          positionTimeLine =
              _videoPlayerController1.value.position.inSeconds.toDouble();
          positionMaxTimeLine =
              _videoPlayerController1.value.duration.inSeconds.toDouble();
          if (_videoPlayerController1.value.position ==
              _videoPlayerController1.value.duration) {
            // Video has ended, close the page
            isFullScreen = true;
            if (_chewieController != null) {
              _chewieController!.exitFullScreen();

              _chewieController = _chewieController!.copyWith(
                customControls: StatefulBuilder(
                  builder: (context, setState) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_chewieController!.isPlaying) {
                                _chewieController!.pause();
                                _videoPlayerController1.pause();
                                _chewieController = _chewieController!.copyWith(
                                  customControls: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: MyColor.white,
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.play_circle,
                                                size: 30,
                                                color: MyColor.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              } else {
                                // appDocumentsDir.
                                _chewieController = _chewieController!.copyWith(
                                  customControls: StatefulBuilder(
                                    builder: (context, setState) {
                                      return const Stack(
                                        children: [
                                        ],
                                      );
                                    },
                                  ),
                                );

                                _chewieController!.play();
                                _videoPlayerController1.play();

                              }
                            });
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              isVisibleLoading == false &&
                                  _chewieController!.isPlaying
                                  ? Icons.pause
                                  : Icons.play_circle,
                              size: 30,
                              color: MyColor.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                fullScreenByDefault: false,
                allowFullScreen: false,
                autoPlay: false,
                autoInitialize: true,
                deviceOrientationsOnEnterFullScreen: [
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft
                ],
                deviceOrientationsAfterFullScreen: [
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft
                ],
              );
            }
          }
        });
      })
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController1,
            // aspectRatio: _videoPlayerController1.value.size.aspectRatio,
            // aspectRatio: _videoPlayerController1.value.aspectRatio,
            aspectRatio: _videoPlayerController1.value.aspectRatio,
            autoPlay: false,
            looping: false,
            autoInitialize: true,
            allowedScreenSleep: true,
            allowMuting: true,
            allowFullScreen: true,
            allowPlaybackSpeedChanging: false,
            showOptions: true,
            isLive: false,

            customControls: StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_chewieController!.isPlaying) {
                              _chewieController!.pause();
                              _videoPlayerController1.pause();
                              _chewieController = _chewieController!.copyWith(
                                customControls: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Stack(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (_chewieController!
                                                    .isPlaying) {
                                                  _chewieController!.pause();
                                                  _videoPlayerController1
                                                      .pause();
                                                  _chewieController =
                                                      _chewieController!
                                                          .copyWith(
                                                        customControls:
                                                        StatefulBuilder(
                                                          builder:
                                                              (context, setState) {
                                                            return const Stack(
                                                              children: [],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                } else {
                                                  _chewieController =
                                                      _chewieController!
                                                          .copyWith(
                                                        customControls:
                                                        StatefulBuilder(
                                                          builder:
                                                              (context, setState) {
                                                            return const Stack(
                                                              children: [

                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );

                                                  _chewieController!.play();
                                                  _videoPlayerController1
                                                      .play();

                                                }
                                              });
                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color: MyColor.white,
                                                    shape: BoxShape.circle),
                                                height: 40,
                                                width: 40,
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  size: 30,
                                                  color: MyColor.black,
                                                ),
                                              ),
                                            )),
                                      ],
                                    );
                                  },
                                ),
                              );
                            } else {
                              // appDocumentsDir.
                              _chewieController = _chewieController!.copyWith(
                                customControls: StatefulBuilder(
                                  builder: (context, setState) {
                                    return const Stack(
                                      children: [
                                      ],
                                    );
                                  },
                                ),
                              );

                              _chewieController!.play();

                            }
                          });
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: MyColor.white,
                                shape: BoxShape.circle),
                            height: 40,
                            width: 40,
                            child: const Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: MyColor.black,
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
            showControls: true,

            draggableProgressBar: false,
            fullScreenByDefault: false,
            showControlsOnInitialize: true,
            deviceOrientationsOnEnterFullScreen: [
              DeviceOrientation.portraitDown,
              DeviceOrientation.portraitUp,
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeRight,
            ],
            materialProgressColors: ChewieProgressColors(
                backgroundColor: MyColor.nearShadeLightFc,
                playedColor: MyColor.primary,
                bufferedColor: MyColor.white,
                handleColor: MyColor.primary),

            deviceOrientationsAfterFullScreen: [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
              // DeviceOrientation.landscapeRight,
              // DeviceOrientation.landscapeLeft
            ],
            hideControlsTimer: const Duration(seconds: 1),
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            progressIndicatorDelay: bufferDelay != null
                ? Duration(milliseconds: bufferDelay!)
                : null,

            subtitleBuilder: (context, dynamic subtitle) => Container(
              padding: const EdgeInsets.all(10.0),
              child: subtitle is InlineSpan
                  ? RichText(
                text: subtitle,
              )
                  : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              if (widget.onTap != null) {
                widget.onTap!(_chewieController);
              }
            });
          });
          setState(() {
            isVisibleLoading = false;
          });
        });
      });
  }

  int currPlayIndex = 0;

  String formatDuration(Duration duration) {
    // Format the duration as needed (e.g., HH:mm:ss)
    return duration.toString();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _chewieController!.setVolume(_isMuted ? 0 : 1);
    });
  }

  String getFullNumberShow(int? number) {
    return number! > 9 ? number.toString() : "0$number";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: Get.width,
      height: _chewieController != null &&
          _chewieController!.videoPlayerController.value.isInitialized &&
          isVisibleLoading == false
          ? null
          : 180,
      decoration: BoxDecoration(
          color: _chewieController != null &&
              _chewieController!
                  .videoPlayerController.value.isInitialized &&
              isVisibleLoading == false
              ? MyColor.black
              : MyColor.neaDarkFc,
          borderRadius: BorderRadius.circular(16)),
      child: _chewieController != null &&
          _chewieController!.videoPlayerController.value.isInitialized &&
          isVisibleLoading == false
          ? Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: _videoPlayerController1.value.aspectRatio,
                  child: Chewie(
                    controller: _chewieController!,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
              color: MyColor.black,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!_chewieController!.isFullScreen) {
                            isFullScreen = false;
                            _chewieController =
                                _chewieController!.copyWith(
                                  customControls: StatefulBuilder(
                                      builder: (context, setState) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 30, right: 30, left: 30),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isFullScreen = true;
                                                          _chewieController!
                                                              .exitFullScreen();
                                                          _chewieController =
                                                              _chewieController!
                                                                  .copyWith(
                                                                customControls: const Align(
                                                                  alignment: Alignment
                                                                      .bottomCenter,
                                                                  child: Row(
                                                                    children: [],
                                                                  ),
                                                                ),
                                                                fullScreenByDefault:
                                                                false,
                                                                allowFullScreen:
                                                                false,
                                                                autoPlay: false,
                                                                autoInitialize: true,
                                                                deviceOrientationsOnEnterFullScreen: [
                                                                  DeviceOrientation
                                                                      .portraitUp,
                                                                  DeviceOrientation
                                                                      .portraitDown,
                                                                  DeviceOrientation.landscapeRight,
                                                                  DeviceOrientation.landscapeLeft
                                                                ],
                                                                deviceOrientationsAfterFullScreen: [
                                                                  DeviceOrientation
                                                                      .portraitUp,
                                                                  DeviceOrientation
                                                                      .portraitDown,
                                                                  DeviceOrientation.landscapeRight,
                                                                  DeviceOrientation.landscapeLeft
                                                                ],
                                                              );
                                                          // SystemChrome
                                                          //     .setPreferredOrientations([
                                                          //   DeviceOrientation
                                                          //       .portraitUp,
                                                          //   DeviceOrientation
                                                          //       .portraitDown,
                                                          // ]);
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.fullscreen_exit,
                                                        color: MyColor
                                                            .white,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                  fullScreenByDefault: true,
                                  allowFullScreen: true,
                                  autoPlay: true,
                                  autoInitialize: true,
                                  deviceOrientationsOnEnterFullScreen: [
                                    DeviceOrientation.portraitDown,
                                    DeviceOrientation.portraitUp,
                                    DeviceOrientation.landscapeRight,
                                    DeviceOrientation.landscapeLeft
                                  ],
                                );
                          }
                        });
                      },
                      child: const Icon(
                        Icons.fullscreen,
                        color: MyColor.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: _toggleMute,
                      child: Icon(
                        _isMuted ? Icons.volume_mute : Icons.volume_down_alt,
                        color: MyColor.white,
                      )),
                  const SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: MyColor.white,
                      thickness: 0.5,
                    ),
                  ),
                  Text(
                    // "${getFullNumberShow((_videoPlayerController1.value.duration.inSeconds))}:${getFullNumberShow((_videoPlayerController1.value.position.inSeconds))} ",
                    "${getFullNumberShow((_videoPlayerController1.value.duration.inSeconds - _videoPlayerController1.value.position.inSeconds) % 60)} :"
                        " ${getFullNumberShow((_videoPlayerController1.value.duration.inSeconds - _videoPlayerController1.value.position.inSeconds) ~/ 60)}",
                    style: const TextStyle(color: MyColor.white),
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        children: [
                          // Slider(
                          //   // value: _videoPlayerController1
                          //   //     .value.position.inSeconds
                          //   //     .toDouble(),
                          //   value: _downloadProgress,
                          //
                          //   inactiveColor: MyColor.defaultGreyLight,
                          //   activeColor: MyColor.defaultBlue,
                          //   onChanged: null,
                          // ),
                          Slider(
                            value: _videoPlayerController1
                                .value.position.inSeconds
                                .toDouble(),
                            // value: _downloadProgress,
                            min: 0,
                            max: _videoPlayerController1
                                .value.duration.inSeconds
                                .toDouble(),
                            inactiveColor: MyColor.nearShadeLight,
                            activeColor: MyColor.primary,
                            onChanged: (double value) {
                              setState(() {
                                Duration newPosition =
                                Duration(seconds: value.toInt());
                                _videoPlayerController1
                                    .seekTo(newPosition);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_chewieController!.isPlaying) {
                            _chewieController!.pause();
                            _videoPlayerController1.pause();
                            _chewieController =
                                _chewieController!.copyWith(
                                  customControls: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (_chewieController!
                                                    .isPlaying) {
                                                  _chewieController =
                                                      _chewieController!
                                                          .copyWith(
                                                        customControls:
                                                        StatefulBuilder(
                                                          builder: (context,
                                                              setState) {
                                                            return Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                  Alignment
                                                                      .center,
                                                                  child:
                                                                  Container(
                                                                    decoration:const BoxDecoration(
                                                                        color: MyColor
                                                                            .white,
                                                                        shape: BoxShape
                                                                            .circle),
                                                                    child:const Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      size: 30,
                                                                      color: MyColor
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                  _chewieController!.pause();
                                                  _videoPlayerController1
                                                      .pause();
                                                } else {
                                                  _chewieController =
                                                      _chewieController!
                                                          .copyWith(
                                                          customControls:
                                                          const SizedBox());

                                                  _chewieController!.play();
                                                  _videoPlayerController1.play();

                                                }
                                              });
                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color:
                                                    MyColor.white,
                                                    shape: BoxShape.circle),
                                                height: 40,
                                                width: 40,
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  size: 30,
                                                  color: MyColor.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                          } else {
                            _chewieController =
                                _chewieController!.copyWith(
                                  customControls: StatefulBuilder(
                                    builder: (context, setState) {
                                      return const Stack(
                                        children: [

                                        ],
                                      );
                                    },
                                  ),
                                );

                            _chewieController!.play();
                            _videoPlayerController1.play();

                          }
                        });
                      },
                      child: Icon(
                        isVisibleLoading == false &&
                            _chewieController!.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 30,
                        color: MyColor.white,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      )
          : widget.videoUrl!.isEmpty || widget.videoUrl.toString() == "null"
          ? Container(
        decoration: BoxDecoration(
            color: MyColor.white,
            // border: Border.all(width: 2, color: MyColor.defaultBlue),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset:
                const Offset(2, 3), // changes position of shadow
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/new/non_categorized.png"),
            const Text('فیلم برای نمایش وجود ندارد'),
          ],
        ),
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyLoading(),
          const SizedBox(height: 20),
          const Text('در حال پردازش'),
        ],
      ),
    );
  }
}

class DelaySlider extends StatefulWidget {
  const DelaySlider({Key? key, required this.delay, required this.onSave})
      : super(key: key);

  final int? delay;
  final void Function(int?) onSave;

  @override
  State<DelaySlider> createState() => _DelaySliderState();
}

class _DelaySliderState extends State<DelaySlider> {
  int? delay;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    delay = widget.delay;
  }

  @override
  Widget build(BuildContext context) {
    const int max = 1000;
    return ListTile(
      title: Text(
        "Progress indicator delay ${delay != null ? "${delay.toString()} MS" : ""}",
      ),
      subtitle: Slider(
        value: delay != null ? (delay! / max) : 0,
        onChanged: (value) async {
          delay = (value * max).toInt();
          setState(() {
            saved = false;
          });
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.save),
        onPressed: saved
            ? null
            : () {
          widget.onSave(delay);
          setState(() {
            saved = true;
          });
        },
      ),
    );
  }
}

