import 'package:dart_plex_api/dart_plex_api.dart';

class PlexRoot extends PlexObject {
  static final String path = "";

  final bool? allowCameraUpload;
  final bool? allowChannelAccess;
  final bool? allowMediaDeletion;
  final bool? allowSharing;
  final bool? allowSync;
  final bool? allowTuners;
  final bool? backgroundProcessing;
  final bool? certificate;
  final bool? companionProxy;
  final String? countryCode;
  final String? diagnostics;
  final bool? eventStream;
  final String? friendlyName;
  final bool? hubSearch;
  final bool? itemClusters;
  final int? livetv;
  final String? machineIdentifier;
  final bool? mediaProviders;
  final bool? multiuser;
  final bool? myPlex;
  final String? myPlexMappingState;
  final String? myPlexSigninState;
  final bool? myPlexSubscription;
  final String? myPlexUsername;
  final String? ownerFeatures;
  final bool? photoAutoTag;
  final String? platform;
  final String? platformVersion;
  final bool? pluginHost;
  final bool? pushNotifications;
  final bool? readOnlyLibraries;
  final bool? requestParametersInCookie;
  final int? streamingBrainABRVersion;
  final int? streamingBrainVersion;
  final bool? sync;
  final int? transcoderActiveVideoSessions;
  final bool? transcoderAudio;
  final bool? transcoderLyrics;
  final bool? transcoderPhoto;
  final bool? transcoderSubtitles;
  final bool? transcoderVideo;
  final String? transcoderVideoBitrates;
  final String? transcoderVideoQualities;
  final String? transcoderVideoResolutions;
  final int? updatedAt;
  final bool? updater;
  final String? version;
  final bool? voiceSearch;
  final List<PlexDirectory>? directory;

  PlexRoot({
    required PlexConnection connection,
    this.allowCameraUpload,
    this.allowChannelAccess,
    this.allowMediaDeletion,
    this.allowSharing,
    this.allowSync,
    this.allowTuners,
    this.backgroundProcessing,
    this.certificate,
    this.companionProxy,
    this.countryCode,
    this.diagnostics,
    this.eventStream,
    this.friendlyName,
    this.hubSearch,
    this.itemClusters,
    this.livetv,
    this.machineIdentifier,
    this.mediaProviders,
    this.multiuser,
    this.myPlex,
    this.myPlexMappingState,
    this.myPlexSigninState,
    this.myPlexSubscription,
    this.myPlexUsername,
    this.ownerFeatures,
    this.photoAutoTag,
    this.platform,
    this.platformVersion,
    this.pluginHost,
    this.pushNotifications,
    this.readOnlyLibraries,
    this.requestParametersInCookie,
    this.streamingBrainABRVersion,
    this.streamingBrainVersion,
    this.sync,
    this.transcoderActiveVideoSessions,
    this.transcoderAudio,
    this.transcoderLyrics,
    this.transcoderPhoto,
    this.transcoderSubtitles,
    this.transcoderVideo,
    this.transcoderVideoBitrates,
    this.transcoderVideoQualities,
    this.transcoderVideoResolutions,
    this.updatedAt,
    this.updater,
    this.version,
    this.voiceSearch,
    this.directory,
  }) : super(
          connection: connection,
        );

  @override
  PlexRoot.fromJson({
    required PlexConnection connection,
    required dynamic json,
  })  : assert(json != null),
        allowCameraUpload = json['allowCameraUpload'],
        allowChannelAccess = json['allowChannelAccess'],
        allowMediaDeletion = json['allowMediaDeletion'],
        allowSharing = json['allowSharing'],
        allowSync = json['allowSync'],
        allowTuners = json['allowTuners'],
        backgroundProcessing = json['backgroundProcessing'],
        certificate = json['certificate'],
        companionProxy = json['companionProxy'],
        countryCode = json['countryCode'],
        diagnostics = json['diagnostics'],
        eventStream = json['eventStream'],
        friendlyName = json['friendlyName'],
        hubSearch = json['hubSearch'],
        itemClusters = json['itemClusters'],
        livetv = json['livetv'],
        machineIdentifier = json['machineIdentifier'],
        mediaProviders = json['mediaProviders'],
        multiuser = json['multiuser'],
        myPlex = json['myPlex'],
        myPlexMappingState = json['myPlexMappingState'],
        myPlexSigninState = json['myPlexSigninState'],
        myPlexSubscription = json['myPlexSubscription'],
        myPlexUsername = json['myPlexUsername'],
        ownerFeatures = json['ownerFeatures'],
        photoAutoTag = json['photoAutoTag'],
        platform = json['platform'],
        platformVersion = json['platformVersion'],
        pluginHost = json['pluginHost'],
        pushNotifications = json['pushNotifications'],
        readOnlyLibraries = json['readOnlyLibraries'],
        requestParametersInCookie = json['requestParametersInCookie'],
        streamingBrainABRVersion = json['streamingBrainABRVersion'],
        streamingBrainVersion = json['streamingBrainVersion'],
        sync = json['sync'],
        transcoderActiveVideoSessions = json['transcoderActiveVideoSessions'],
        transcoderAudio = json['transcoderAudio'],
        transcoderLyrics = json['transcoderLyrics'],
        transcoderPhoto = json['transcoderPhoto'],
        transcoderSubtitles = json['transcoderSubtitles'],
        transcoderVideo = json['transcoderVideo'],
        transcoderVideoBitrates = json['transcoderVideoBitrates'],
        transcoderVideoQualities = json['transcoderVideoQualities'],
        transcoderVideoResolutions = json['transcoderVideoResolutions'],
        updatedAt = json['updatedAt'],
        updater = json['updater'],
        version = json['version'],
        voiceSearch = json['voiceSearch'],
        directory = json['Directory'] != null
            ? List.generate(
                (json['Directory'] as List<dynamic>).length,
                (int index) => PlexDirectory.fromJson(
                  connection: connection,
                  json: json['Directory'][index],
                ),
              )
            : List.empty(),
        super(
          connection: connection,
        );

  @override
  Map<String, dynamic> toJson() => {
        'allowCameraUpload': allowCameraUpload,
        'allowChannelAccess': allowChannelAccess,
        'allowMediaDeletion': allowMediaDeletion,
        'allowSharing': allowSharing,
        'allowSync': allowSync,
        'allowTuners': allowTuners,
        'backgroundProcessing': backgroundProcessing,
        'certificate': certificate,
        'companionProxy': companionProxy,
        'countryCode': countryCode,
        'diagnostics': diagnostics,
        'eventStream': eventStream,
        'friendlyName': friendlyName,
        'hubSearch': hubSearch,
        'itemClusters': itemClusters,
        'livetv': livetv,
        'machineIdentifier': machineIdentifier,
        'mediaProviders': mediaProviders,
        'multiuser': multiuser,
        'myPlex': myPlex,
        'myPlexMappingState': myPlexMappingState,
        'myPlexSigninState': myPlexSigninState,
        'myPlexSubscription': myPlexSubscription,
        'myPlexUsername': myPlexUsername,
        'ownerFeatures': ownerFeatures,
        'photoAutoTag': photoAutoTag,
        'platform': platform,
        'platformVersion': platformVersion,
        'pluginHost': pluginHost,
        'pushNotifications': pushNotifications,
        'readOnlyLibraries': readOnlyLibraries,
        'requestParametersInCookie': requestParametersInCookie,
        'streamingBrainABRVersion': streamingBrainABRVersion,
        'streamingBrainVersion': streamingBrainVersion,
        'sync': sync,
        'transcoderActiveVideoSessions': transcoderActiveVideoSessions,
        'transcoderAudio': transcoderAudio,
        'transcoderLyrics': transcoderLyrics,
        'transcoderPhoto': transcoderPhoto,
        'transcoderSubtitles': transcoderSubtitles,
        'transcoderVideo': transcoderVideo,
        'transcoderVideoBitrates': transcoderVideoBitrates,
        'transcoderVideoQualities': transcoderVideoQualities,
        'transcoderVideoResolutions': transcoderVideoResolutions,
        'updatedAt': updatedAt,
        'updater': updater,
        'version': version,
        'voiceSearch': voiceSearch,
        'directory': directory,
      };
}
