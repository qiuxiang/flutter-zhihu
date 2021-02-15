// To parse this JSON data, do
//
//     final childComment = childCommentFromJson(jsonString);
//     final recommend = recommendFromJson(jsonString);
//     final rootComment = rootCommentFromJson(jsonString);

import 'dart:convert';

ChildComment childCommentFromJson(String str) =>
    ChildComment.fromJson(json.decode(str));

String childCommentToJson(ChildComment data) => json.encode(data.toJson());

Recommend recommendFromJson(String str) => Recommend.fromJson(json.decode(str));

String recommendToJson(Recommend data) => json.encode(data.toJson());

RootComment rootCommentFromJson(String str) =>
    RootComment.fromJson(json.decode(str));

String rootCommentToJson(RootComment data) => json.encode(data.toJson());

class ChildComment {
  ChildComment({
    this.paging,
    this.data,
  });

  final Paging paging;
  final List<PurpleDatum> data;

  factory ChildComment.fromJson(Map<String, dynamic> json) => ChildComment(
        paging: Paging.fromJson(json["paging"]),
        data: List<PurpleDatum>.from(
            json["data"].map((x) => PurpleDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paging": paging.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PurpleDatum {
  PurpleDatum({
    this.id,
    this.type,
    this.url,
    this.voteCount,
    this.voting,
    this.liked,
    this.createdTime,
    this.isDelete,
    this.resourceType,
    this.content,
    this.attachedInfo,
    this.author,
    this.isAuthor,
    this.allowLike,
    this.allowDelete,
    this.repliesCount,
    this.canRecommend,
    this.top,
    this.canCollapse,
    this.replyToAuthor,
    this.allowReply,
    this.extraInfo,
  });

  final int id;
  final PurpleType type;
  final String url;
  final int voteCount;
  final bool voting;
  final bool liked;
  final int createdTime;
  final bool isDelete;
  final ResourceTypeEnum resourceType;
  final String content;
  final String attachedInfo;
  final Author author;
  final bool isAuthor;
  final bool allowLike;
  final bool allowDelete;
  final int repliesCount;
  final bool canRecommend;
  final bool top;
  final bool canCollapse;
  final Author replyToAuthor;
  final bool allowReply;
  final ExtraInfo extraInfo;

  factory PurpleDatum.fromJson(Map<String, dynamic> json) => PurpleDatum(
        id: json["id"],
        type: purpleTypeValues.map[json["type"]],
        url: json["url"],
        voteCount: json["vote_count"],
        voting: json["voting"],
        liked: json["liked"],
        createdTime: json["created_time"],
        isDelete: json["is_delete"],
        resourceType: resourceTypeEnumValues.map[json["resource_type"]],
        content: json["content"],
        attachedInfo: json["attached_info"],
        author: Author.fromJson(json["author"]),
        isAuthor: json["is_author"],
        allowLike: json["allow_like"],
        allowDelete: json["allow_delete"],
        repliesCount: json["replies_count"],
        canRecommend: json["can_recommend"],
        top: json["top"],
        canCollapse: json["can_collapse"],
        replyToAuthor: Author.fromJson(json["reply_to_author"]),
        allowReply: json["allow_reply"],
        extraInfo: ExtraInfo.fromJson(json["extra_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": purpleTypeValues.reverse[type],
        "url": url,
        "vote_count": voteCount,
        "voting": voting,
        "liked": liked,
        "created_time": createdTime,
        "is_delete": isDelete,
        "resource_type": resourceTypeEnumValues.reverse[resourceType],
        "content": content,
        "attached_info": attachedInfo,
        "author": author.toJson(),
        "is_author": isAuthor,
        "allow_like": allowLike,
        "allow_delete": allowDelete,
        "replies_count": repliesCount,
        "can_recommend": canRecommend,
        "top": top,
        "can_collapse": canCollapse,
        "reply_to_author": replyToAuthor.toJson(),
        "allow_reply": allowReply,
        "extra_info": extraInfo.toJson(),
      };
}

class Author {
  Author({
    this.role,
    this.member,
  });

  final Role role;
  final Member member;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        role: roleValues.map[json["role"]],
        member: Member.fromJson(json["member"]),
      );

  Map<String, dynamic> toJson() => {
        "role": roleValues.reverse[role],
        "member": member.toJson(),
      };
}

class Member {
  Member({
    this.id,
    this.url,
    this.name,
    this.headline,
    this.gender,
    this.avatarUrl,
    this.type,
    this.userType,
    this.badge,
    this.levelInfo,
    this.isFollowing,
    this.isFollowed,
    this.urlToken,
    this.isOrg,
    this.followersCount,
    this.avatarUrlTemplate,
    this.isAdvertiser,
  });

  final String id;
  final String url;
  final String name;
  final String headline;
  final int gender;
  final String avatarUrl;
  final UserTypeEnum type;
  final UserTypeEnum userType;
  final List<Badge> badge;
  final LevelInfo levelInfo;
  final bool isFollowing;
  final bool isFollowed;
  final String urlToken;
  final bool isOrg;
  final int followersCount;
  final String avatarUrlTemplate;
  final bool isAdvertiser;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        headline: json["headline"],
        gender: json["gender"] == null ? null : json["gender"],
        avatarUrl: json["avatar_url"],
        type: userTypeEnumValues.map[json["type"]],
        userType: userTypeEnumValues.map[json["user_type"]],
        badge: json["badge"] == null
            ? null
            : List<Badge>.from(json["badge"].map((x) => Badge.fromJson(x))),
        levelInfo: json["level_info"] == null
            ? null
            : LevelInfo.fromJson(json["level_info"]),
        isFollowing: json["is_following"] == null ? null : json["is_following"],
        isFollowed: json["is_followed"] == null ? null : json["is_followed"],
        urlToken: json["url_token"] == null ? null : json["url_token"],
        isOrg: json["is_org"] == null ? null : json["is_org"],
        followersCount:
            json["followers_count"] == null ? null : json["followers_count"],
        avatarUrlTemplate: json["avatar_url_template"] == null
            ? null
            : json["avatar_url_template"],
        isAdvertiser:
            json["is_advertiser"] == null ? null : json["is_advertiser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "headline": headline,
        "gender": gender == null ? null : gender,
        "avatar_url": avatarUrl,
        "type": userTypeEnumValues.reverse[type],
        "user_type": userTypeEnumValues.reverse[userType],
        "badge": badge == null
            ? null
            : List<dynamic>.from(badge.map((x) => x.toJson())),
        "level_info": levelInfo == null ? null : levelInfo.toJson(),
        "is_following": isFollowing == null ? null : isFollowing,
        "is_followed": isFollowed == null ? null : isFollowed,
        "url_token": urlToken == null ? null : urlToken,
        "is_org": isOrg == null ? null : isOrg,
        "followers_count": followersCount == null ? null : followersCount,
        "avatar_url_template":
            avatarUrlTemplate == null ? null : avatarUrlTemplate,
        "is_advertiser": isAdvertiser == null ? null : isAdvertiser,
      };
}

class Badge {
  Badge({
    this.type,
    this.description,
    this.topics,
    this.topicNames,
  });

  final BadgeType type;
  final String description;
  final List<dynamic> topics;
  final List<String> topicNames;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        type: badgeTypeValues.map[json["type"]],
        description: json["description"],
        topics: json["topics"] == null
            ? null
            : List<dynamic>.from(json["topics"].map((x) => x)),
        topicNames: json["topic_names"] == null
            ? null
            : List<String>.from(json["topic_names"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": badgeTypeValues.reverse[type],
        "description": description,
        "topics":
            topics == null ? null : List<dynamic>.from(topics.map((x) => x)),
        "topic_names": topicNames == null
            ? null
            : List<dynamic>.from(topicNames.map((x) => x)),
      };
}

enum BadgeType { IDENTITY, BEST_ANSWERER }

final badgeTypeValues = EnumValues(
    {"best_answerer": BadgeType.BEST_ANSWERER, "identity": BadgeType.IDENTITY});

class LevelInfo {
  LevelInfo({
    this.exp,
    this.level,
    this.nicknameColor,
    this.levelIcon,
    this.iconInfo,
  });

  final int exp;
  final int level;
  final NicknameColor nicknameColor;
  final String levelIcon;
  final IconInfo iconInfo;

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
        exp: json["exp"],
        level: json["level"],
        nicknameColor: NicknameColor.fromJson(json["nickname_color"]),
        levelIcon: json["level_icon"],
        iconInfo: IconInfo.fromJson(json["icon_info"]),
      );

  Map<String, dynamic> toJson() => {
        "exp": exp,
        "level": level,
        "nickname_color": nicknameColor.toJson(),
        "level_icon": levelIcon,
        "icon_info": iconInfo.toJson(),
      };
}

class IconInfo {
  IconInfo({
    this.url,
    this.nightModeUrl,
    this.width,
    this.height,
  });

  final String url;
  final String nightModeUrl;
  final int width;
  final int height;

  factory IconInfo.fromJson(Map<String, dynamic> json) => IconInfo(
        url: json["url"],
        nightModeUrl: json["night_mode_url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "night_mode_url": nightModeUrl,
        "width": width,
        "height": height,
      };
}

class NicknameColor {
  NicknameColor({
    this.color,
    this.nightModeColor,
  });

  final String color;
  final String nightModeColor;

  factory NicknameColor.fromJson(Map<String, dynamic> json) => NicknameColor(
        color: json["color"],
        nightModeColor: json["night_mode_color"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "night_mode_color": nightModeColor,
      };
}

enum UserTypeEnum { PEOPLE, TOPIC }

final userTypeEnumValues =
    EnumValues({"people": UserTypeEnum.PEOPLE, "topic": UserTypeEnum.TOPIC});

enum Role { NORMAL, AUTHOR }

final roleValues = EnumValues({"author": Role.AUTHOR, "normal": Role.NORMAL});

class ExtraInfo {
  ExtraInfo();

  factory ExtraInfo.fromJson(Map<String, dynamic> json) => ExtraInfo();

  Map<String, dynamic> toJson() => {};
}

enum ResourceTypeEnum { ANSWER, ARTICLE, ZVIDEO }

final resourceTypeEnumValues = EnumValues({
  "answer": ResourceTypeEnum.ANSWER,
  "article": ResourceTypeEnum.ARTICLE,
  "zvideo": ResourceTypeEnum.ZVIDEO
});

enum PurpleType { COMMENT }

final purpleTypeValues = EnumValues({"comment": PurpleType.COMMENT});

class Paging {
  Paging({
    this.isEnd,
    this.next,
    this.previous,
    this.totals,
    this.isStart,
  });

  final bool isEnd;
  final String next;
  final String previous;
  final int totals;
  final bool isStart;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        isEnd: json["is_end"],
        next: json["next"],
        previous: json["previous"],
        totals: json["totals"] == null ? null : json["totals"],
        isStart: json["is_start"] == null ? null : json["is_start"],
      );

  Map<String, dynamic> toJson() => {
        "is_end": isEnd,
        "next": next,
        "previous": previous,
        "totals": totals == null ? null : totals,
        "is_start": isStart == null ? null : isStart,
      };
}

class Recommend {
  Recommend({
    this.data,
    this.paging,
    this.freshText,
  });

  final List<RecommendDatum> data;
  final Paging paging;
  final String freshText;

  factory Recommend.fromJson(Map<String, dynamic> json) => Recommend(
        data: List<RecommendDatum>.from(
            json["data"].map((x) => RecommendDatum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
        freshText: json["fresh_text"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
        "fresh_text": freshText,
      };
}

class RecommendDatum {
  RecommendDatum({
    this.id,
    this.type,
    this.offset,
    this.verb,
    this.createdTime,
    this.updatedTime,
    this.target,
    this.brief,
    this.uninterestReasons,
    this.attachedInfo,
    this.actors,
    this.showActorTime,
    this.actionText,
    this.actionTextTpl,
    this.actionCard,
    this.count,
    this.ad,
    this.adList,
    this.adjson,
    this.pcontent,
    this.ncontent,
    this.extInfo,
  });

  final String id;
  final FluffyType type;
  final int offset;
  final Verb verb;
  final int createdTime;
  final int updatedTime;
  final Target target;
  final String brief;
  final List<UninterestReason> uninterestReasons;
  final String attachedInfo;
  final List<Actor> actors;
  final bool showActorTime;
  final String actionText;
  final ActionTextTpl actionTextTpl;
  final bool actionCard;
  final int count;
  final Ad ad;
  final List<dynamic> adList;
  final String adjson;
  final String pcontent;
  final String ncontent;
  final ExtInfo extInfo;

  factory RecommendDatum.fromJson(Map<String, dynamic> json) => RecommendDatum(
        id: json["id"],
        type: fluffyTypeValues.map[json["type"]],
        offset: json["offset"] == null ? null : json["offset"],
        verb: json["verb"] == null ? null : verbValues.map[json["verb"]],
        createdTime: json["created_time"] == null ? null : json["created_time"],
        updatedTime: json["updated_time"] == null ? null : json["updated_time"],
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        brief: json["brief"],
        uninterestReasons: json["uninterest_reasons"] == null
            ? null
            : List<UninterestReason>.from(json["uninterest_reasons"]
                .map((x) => UninterestReason.fromJson(x))),
        attachedInfo: json["attached_info"],
        actors: json["actors"] == null
            ? null
            : List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        showActorTime:
            json["show_actor_time"] == null ? null : json["show_actor_time"],
        actionText: json["action_text"],
        actionTextTpl: json["action_text_tpl"] == null
            ? null
            : actionTextTplValues.map[json["action_text_tpl"]],
        actionCard: json["action_card"] == null ? null : json["action_card"],
        count: json["count"] == null ? null : json["count"],
        ad: json["ad"] == null ? null : Ad.fromJson(json["ad"]),
        adList: json["ad_list"] == null
            ? null
            : List<dynamic>.from(json["ad_list"].map((x) => x)),
        adjson: json["adjson"] == null ? null : json["adjson"],
        pcontent: json["pcontent"] == null ? null : json["pcontent"],
        ncontent: json["ncontent"] == null ? null : json["ncontent"],
        extInfo: json["ext_info"] == null
            ? null
            : ExtInfo.fromJson(json["ext_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": fluffyTypeValues.reverse[type],
        "offset": offset == null ? null : offset,
        "verb": verb == null ? null : verbValues.reverse[verb],
        "created_time": createdTime == null ? null : createdTime,
        "updated_time": updatedTime == null ? null : updatedTime,
        "target": target == null ? null : target.toJson(),
        "brief": brief,
        "uninterest_reasons": uninterestReasons == null
            ? null
            : List<dynamic>.from(uninterestReasons.map((x) => x.toJson())),
        "attached_info": attachedInfo,
        "actors": actors == null
            ? null
            : List<dynamic>.from(actors.map((x) => x.toJson())),
        "show_actor_time": showActorTime == null ? null : showActorTime,
        "action_text": actionText,
        "action_text_tpl": actionTextTpl == null
            ? null
            : actionTextTplValues.reverse[actionTextTpl],
        "action_card": actionCard == null ? null : actionCard,
        "count": count == null ? null : count,
        "ad": ad == null ? null : ad.toJson(),
        "ad_list":
            adList == null ? null : List<dynamic>.from(adList.map((x) => x)),
        "adjson": adjson == null ? null : adjson,
        "pcontent": pcontent == null ? null : pcontent,
        "ncontent": ncontent == null ? null : ncontent,
        "ext_info": extInfo == null ? null : extInfo.toJson(),
      };
}

enum ActionTextTpl { EMPTY }

final actionTextTplValues = EnumValues({"热门内容, 来自: {}": ActionTextTpl.EMPTY});

class Actor {
  Actor({
    this.id,
    this.type,
    this.url,
    this.avatarUrl,
    this.name,
    this.excerpt,
    this.introduction,
  });

  final String id;
  final UserTypeEnum type;
  final String url;
  final String avatarUrl;
  final String name;
  final String excerpt;
  final String introduction;

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["id"],
        type: userTypeEnumValues.map[json["type"]],
        url: json["url"],
        avatarUrl: json["avatar_url"],
        name: json["name"],
        excerpt: json["excerpt"],
        introduction: json["introduction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": userTypeEnumValues.reverse[type],
        "url": url,
        "avatar_url": avatarUrl,
        "name": name,
        "excerpt": excerpt,
        "introduction": introduction,
      };
}

class Ad {
  Ad({
    this.count,
    this.position,
    this.adVerb,
    this.closeTrack,
    this.revertCloseTrack,
    this.template,
    this.loadTracks,
    this.creatives,
    this.voteUpCount,
    this.commentCount,
    this.isFollowing,
    this.category,
    this.id,
    this.canInteract,
    this.userId,
    this.ctr,
    this.displayAdvertisingTag,
    this.debugTracks,
    this.landPrefetch,
    this.nativePrefetch,
    this.isNewWebview,
    this.experimentInfo,
    this.downloadSilent,
    this.isSpeeding,
    this.brand,
  });

  final int count;
  final int position;
  final String adVerb;
  final String closeTrack;
  final String revertCloseTrack;
  final String template;
  final List<String> loadTracks;
  final List<Creative> creatives;
  final int voteUpCount;
  final int commentCount;
  final bool isFollowing;
  final int category;
  final int id;
  final bool canInteract;
  final int userId;
  final int ctr;
  final bool displayAdvertisingTag;
  final List<String> debugTracks;
  final bool landPrefetch;
  final bool nativePrefetch;
  final bool isNewWebview;
  final String experimentInfo;
  final bool downloadSilent;
  final bool isSpeeding;
  final AdBrand brand;

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        count: json["count"],
        position: json["position"],
        adVerb: json["ad_verb"],
        closeTrack: json["close_track"],
        revertCloseTrack: json["revert_close_track"],
        template: json["template"],
        loadTracks: List<String>.from(json["load_tracks"].map((x) => x)),
        creatives: List<Creative>.from(
            json["creatives"].map((x) => Creative.fromJson(x))),
        voteUpCount: json["vote_up_count"],
        commentCount: json["comment_count"],
        isFollowing: json["is_following"],
        category: json["category"],
        id: json["id"],
        canInteract: json["can_interact"],
        userId: json["user_id"],
        ctr: json["ctr"],
        displayAdvertisingTag: json["display_advertising_tag"],
        debugTracks: List<String>.from(json["debug_tracks"].map((x) => x)),
        landPrefetch: json["land_prefetch"],
        nativePrefetch: json["native_prefetch"],
        isNewWebview: json["is_new_webview"],
        experimentInfo: json["experiment_info"],
        downloadSilent: json["download_silent"],
        isSpeeding: json["is_speeding"],
        brand: AdBrand.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "position": position,
        "ad_verb": adVerb,
        "close_track": closeTrack,
        "revert_close_track": revertCloseTrack,
        "template": template,
        "load_tracks": List<dynamic>.from(loadTracks.map((x) => x)),
        "creatives": List<dynamic>.from(creatives.map((x) => x.toJson())),
        "vote_up_count": voteUpCount,
        "comment_count": commentCount,
        "is_following": isFollowing,
        "category": category,
        "id": id,
        "can_interact": canInteract,
        "user_id": userId,
        "ctr": ctr,
        "display_advertising_tag": displayAdvertisingTag,
        "debug_tracks": List<dynamic>.from(debugTracks.map((x) => x)),
        "land_prefetch": landPrefetch,
        "native_prefetch": nativePrefetch,
        "is_new_webview": isNewWebview,
        "experiment_info": experimentInfo,
        "download_silent": downloadSilent,
        "is_speeding": isSpeeding,
        "brand": brand.toJson(),
      };
}

class AdBrand {
  AdBrand({
    this.name,
    this.logo,
    this.type,
    this.actionText,
  });

  final String name;
  final String logo;
  final String type;
  final String actionText;

  factory AdBrand.fromJson(Map<String, dynamic> json) => AdBrand(
        name: json["name"],
        logo: json["logo"],
        type: json["type"],
        actionText: json["action_text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "logo": logo,
        "type": type,
        "action_text": actionText,
      };
}

class Creative {
  Creative({
    this.landingUrl,
    this.image,
    this.image2X,
    this.title,
    this.description,
    this.button,
    this.actionButton,
    this.footer,
    this.cta,
    this.brand,
    this.appPromotionUrl,
    this.nativeUrl,
    this.deepUrl,
    this.videoWatchNum,
    this.zaAdInfo,
    this.zaAdInfoJson,
    this.externalClickUrl,
    this.impressionTracks,
    this.clickTracks,
    this.id,
    this.name,
    this.conversionTracks,
    this.contentType,
    this.targetToken,
  });

  final String landingUrl;
  final String image;
  final String image2X;
  final String title;
  final String description;
  final String button;
  final bool actionButton;
  final Cta footer;
  final Cta cta;
  final CreativeBrand brand;
  final String appPromotionUrl;
  final String nativeUrl;
  final String deepUrl;
  final int videoWatchNum;
  final String zaAdInfo;
  final String zaAdInfoJson;
  final String externalClickUrl;
  final List<String> impressionTracks;
  final List<String> clickTracks;
  final int id;
  final String name;
  final List<String> conversionTracks;
  final String contentType;
  final String targetToken;

  factory Creative.fromJson(Map<String, dynamic> json) => Creative(
        landingUrl: json["landing_url"],
        image: json["image"],
        image2X: json["image_2x"],
        title: json["title"],
        description: json["description"],
        button: json["button"],
        actionButton: json["action_button"],
        footer: Cta.fromJson(json["footer"]),
        cta: Cta.fromJson(json["cta"]),
        brand: CreativeBrand.fromJson(json["brand"]),
        appPromotionUrl: json["app_promotion_url"],
        nativeUrl: json["native_url"],
        deepUrl: json["deep_url"],
        videoWatchNum: json["video_watch_num"],
        zaAdInfo: json["za_ad_info"],
        zaAdInfoJson: json["za_ad_info_json"],
        externalClickUrl: json["external_click_url"],
        impressionTracks:
            List<String>.from(json["impression_tracks"].map((x) => x)),
        clickTracks: List<String>.from(json["click_tracks"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        conversionTracks:
            List<String>.from(json["conversion_tracks"].map((x) => x)),
        contentType: json["content_type"],
        targetToken: json["target_token"],
      );

  Map<String, dynamic> toJson() => {
        "landing_url": landingUrl,
        "image": image,
        "image_2x": image2X,
        "title": title,
        "description": description,
        "button": button,
        "action_button": actionButton,
        "footer": footer.toJson(),
        "cta": cta.toJson(),
        "brand": brand.toJson(),
        "app_promotion_url": appPromotionUrl,
        "native_url": nativeUrl,
        "deep_url": deepUrl,
        "video_watch_num": videoWatchNum,
        "za_ad_info": zaAdInfo,
        "za_ad_info_json": zaAdInfoJson,
        "external_click_url": externalClickUrl,
        "impression_tracks": List<dynamic>.from(impressionTracks.map((x) => x)),
        "click_tracks": List<dynamic>.from(clickTracks.map((x) => x)),
        "id": id,
        "name": name,
        "conversion_tracks": List<dynamic>.from(conversionTracks.map((x) => x)),
        "content_type": contentType,
        "target_token": targetToken,
      };
}

class CreativeBrand {
  CreativeBrand({
    this.id,
    this.name,
    this.logo,
  });

  final int id;
  final String name;
  final String logo;

  factory CreativeBrand.fromJson(Map<String, dynamic> json) => CreativeBrand(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}

class Cta {
  Cta({
    this.value,
  });

  final String value;

  factory Cta.fromJson(Map<String, dynamic> json) => Cta(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class ExtInfo {
  ExtInfo({
    this.contentType,
    this.contentId,
    this.priority,
    this.ecpm,
    this.type,
  });

  final dynamic contentType;
  final dynamic contentId;
  final int priority;
  final double ecpm;
  final int type;

  factory ExtInfo.fromJson(Map<String, dynamic> json) => ExtInfo(
        contentType: json["content_type"],
        contentId: json["content_id"],
        priority: json["priority"],
        ecpm: json["ecpm"].toDouble(),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "content_type": contentType,
        "content_id": contentId,
        "priority": priority,
        "ecpm": ecpm,
        "type": type,
      };
}

class Target {
  Target({
    this.id,
    this.type,
    this.url,
    this.author,
    this.createdTime,
    this.updatedTime,
    this.voteupCount,
    this.thanksCount,
    this.commentCount,
    this.isCopyable,
    this.question,
    this.thumbnail,
    this.excerpt,
    this.excerptNew,
    this.previewType,
    this.previewText,
    this.reshipmentSettings,
    this.content,
    this.markInfos,
    this.relationship,
    this.isLabeled,
    this.visitedCount,
    this.title,
    this.excerptTitle,
    this.imageUrl,
    this.commentPermission,
    this.created,
    this.updated,
    this.voting,
    this.upvotedFollowees,
    this.linkbox,
    this.column,
    this.description,
    this.memberId,
    this.voteCount,
    this.thumbnailExtraInfo,
    this.playCount,
    this.attachment,
  });

  final dynamic id;
  final ResourceTypeEnum type;
  final String url;
  final Member author;
  final int createdTime;
  final int updatedTime;
  final int voteupCount;
  final int thanksCount;
  final int commentCount;
  final bool isCopyable;
  final Question question;
  final String thumbnail;
  final String excerpt;
  final String excerptNew;
  final PreviewType previewType;
  final String previewText;
  final ReshipmentSettings reshipmentSettings;
  final String content;
  final List<dynamic> markInfos;
  final TargetRelationship relationship;
  final bool isLabeled;
  final int visitedCount;
  final String title;
  final String excerptTitle;
  final String imageUrl;
  final String commentPermission;
  final int created;
  final int updated;
  final int voting;
  final List<dynamic> upvotedFollowees;
  final Linkbox linkbox;
  final Column column;
  final String description;
  final int memberId;
  final int voteCount;
  final ThumbnailExtraInfo thumbnailExtraInfo;
  final int playCount;
  final Attachment attachment;

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        type: resourceTypeEnumValues.map[json["type"]],
        url: json["url"] == null ? null : json["url"],
        author: Member.fromJson(json["author"]),
        createdTime: json["created_time"] == null ? null : json["created_time"],
        updatedTime: json["updated_time"] == null ? null : json["updated_time"],
        voteupCount: json["voteup_count"] == null ? null : json["voteup_count"],
        thanksCount: json["thanks_count"] == null ? null : json["thanks_count"],
        commentCount: json["comment_count"],
        isCopyable: json["is_copyable"] == null ? null : json["is_copyable"],
        question: json["question"] == null
            ? null
            : Question.fromJson(json["question"]),
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        excerpt: json["excerpt"],
        excerptNew: json["excerpt_new"] == null ? null : json["excerpt_new"],
        previewType: json["preview_type"] == null
            ? null
            : previewTypeValues.map[json["preview_type"]],
        previewText: json["preview_text"] == null ? null : json["preview_text"],
        reshipmentSettings: json["reshipment_settings"] == null
            ? null
            : reshipmentSettingsValues.map[json["reshipment_settings"]],
        content: json["content"] == null ? null : json["content"],
        markInfos: json["mark_infos"] == null
            ? null
            : List<dynamic>.from(json["mark_infos"].map((x) => x)),
        relationship: json["relationship"] == null
            ? null
            : TargetRelationship.fromJson(json["relationship"]),
        isLabeled: json["is_labeled"] == null ? null : json["is_labeled"],
        visitedCount:
            json["visited_count"] == null ? null : json["visited_count"],
        title: json["title"] == null ? null : json["title"],
        excerptTitle:
            json["excerpt_title"] == null ? null : json["excerpt_title"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        commentPermission: json["comment_permission"] == null
            ? null
            : json["comment_permission"],
        created: json["created"] == null ? null : json["created"],
        updated: json["updated"] == null ? null : json["updated"],
        voting: json["voting"] == null ? null : json["voting"],
        upvotedFollowees: json["upvoted_followees"] == null
            ? null
            : List<dynamic>.from(json["upvoted_followees"].map((x) => x)),
        linkbox:
            json["linkbox"] == null ? null : Linkbox.fromJson(json["linkbox"]),
        column: json["column"] == null ? null : Column.fromJson(json["column"]),
        description: json["description"] == null ? null : json["description"],
        memberId: json["member_id"] == null ? null : json["member_id"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        thumbnailExtraInfo: json["thumbnail_extra_info"] == null
            ? null
            : ThumbnailExtraInfo.fromJson(json["thumbnail_extra_info"]),
        playCount: json["play_count"] == null ? null : json["play_count"],
        attachment: json["attachment"] == null
            ? null
            : Attachment.fromJson(json["attachment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": resourceTypeEnumValues.reverse[type],
        "url": url == null ? null : url,
        "author": author.toJson(),
        "created_time": createdTime == null ? null : createdTime,
        "updated_time": updatedTime == null ? null : updatedTime,
        "voteup_count": voteupCount == null ? null : voteupCount,
        "thanks_count": thanksCount == null ? null : thanksCount,
        "comment_count": commentCount,
        "is_copyable": isCopyable == null ? null : isCopyable,
        "question": question == null ? null : question.toJson(),
        "thumbnail": thumbnail == null ? null : thumbnail,
        "excerpt": excerpt,
        "excerpt_new": excerptNew == null ? null : excerptNew,
        "preview_type":
            previewType == null ? null : previewTypeValues.reverse[previewType],
        "preview_text": previewText == null ? null : previewText,
        "reshipment_settings": reshipmentSettings == null
            ? null
            : reshipmentSettingsValues.reverse[reshipmentSettings],
        "content": content == null ? null : content,
        "mark_infos": markInfos == null
            ? null
            : List<dynamic>.from(markInfos.map((x) => x)),
        "relationship": relationship == null ? null : relationship.toJson(),
        "is_labeled": isLabeled == null ? null : isLabeled,
        "visited_count": visitedCount == null ? null : visitedCount,
        "title": title == null ? null : title,
        "excerpt_title": excerptTitle == null ? null : excerptTitle,
        "image_url": imageUrl == null ? null : imageUrl,
        "comment_permission":
            commentPermission == null ? null : commentPermission,
        "created": created == null ? null : created,
        "updated": updated == null ? null : updated,
        "voting": voting == null ? null : voting,
        "upvoted_followees": upvotedFollowees == null
            ? null
            : List<dynamic>.from(upvotedFollowees.map((x) => x)),
        "linkbox": linkbox == null ? null : linkbox.toJson(),
        "column": column == null ? null : column.toJson(),
        "description": description == null ? null : description,
        "member_id": memberId == null ? null : memberId,
        "vote_count": voteCount == null ? null : voteCount,
        "thumbnail_extra_info":
            thumbnailExtraInfo == null ? null : thumbnailExtraInfo.toJson(),
        "play_count": playCount == null ? null : playCount,
        "attachment": attachment == null ? null : attachment.toJson(),
      };
}

class Attachment {
  Attachment({
    this.type,
    this.url,
  });

  final int type;
  final String url;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

class Column {
  Column({
    this.id,
    this.type,
    this.url,
    this.author,
    this.title,
    this.imageUrl,
    this.commentPermission,
    this.intro,
    this.updated,
    this.isFollowing,
  });

  final String id;
  final String type;
  final String url;
  final Member author;
  final String title;
  final String imageUrl;
  final String commentPermission;
  final String intro;
  final int updated;
  final bool isFollowing;

  factory Column.fromJson(Map<String, dynamic> json) => Column(
        id: json["id"],
        type: json["type"],
        url: json["url"],
        author: Member.fromJson(json["author"]),
        title: json["title"],
        imageUrl: json["image_url"],
        commentPermission: json["comment_permission"],
        intro: json["intro"] == null ? null : json["intro"],
        updated: json["updated"],
        isFollowing: json["is_following"] == null ? null : json["is_following"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
        "author": author.toJson(),
        "title": title,
        "image_url": imageUrl,
        "comment_permission": commentPermission,
        "intro": intro == null ? null : intro,
        "updated": updated,
        "is_following": isFollowing == null ? null : isFollowing,
      };
}

class Linkbox {
  Linkbox({
    this.pic,
    this.title,
    this.url,
    this.category,
  });

  final String pic;
  final String title;
  final String url;
  final String category;

  factory Linkbox.fromJson(Map<String, dynamic> json) => Linkbox(
        pic: json["pic"],
        title: json["title"],
        url: json["url"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "pic": pic,
        "title": title,
        "url": url,
        "category": category,
      };
}

enum PreviewType { DEFAULT }

final previewTypeValues = EnumValues({"default": PreviewType.DEFAULT});

class Question {
  Question({
    this.id,
    this.type,
    this.url,
    this.author,
    this.title,
    this.created,
    this.answerCount,
    this.followerCount,
    this.commentCount,
    this.boundTopicIds,
    this.isFollowing,
    this.excerpt,
    this.relationship,
    this.detail,
    this.questionType,
  });

  final int id;
  final QuestionType type;
  final String url;
  final Member author;
  final String title;
  final int created;
  final int answerCount;
  final int followerCount;
  final int commentCount;
  final List<int> boundTopicIds;
  final bool isFollowing;
  final String excerpt;
  final QuestionRelationship relationship;
  final String detail;
  final Role questionType;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        type: questionTypeValues.map[json["type"]],
        url: json["url"],
        author: Member.fromJson(json["author"]),
        title: json["title"],
        created: json["created"],
        answerCount: json["answer_count"],
        followerCount: json["follower_count"],
        commentCount: json["comment_count"],
        boundTopicIds: List<int>.from(json["bound_topic_ids"].map((x) => x)),
        isFollowing: json["is_following"],
        excerpt: json["excerpt"],
        relationship: QuestionRelationship.fromJson(json["relationship"]),
        detail: json["detail"],
        questionType: roleValues.map[json["question_type"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": questionTypeValues.reverse[type],
        "url": url,
        "author": author.toJson(),
        "title": title,
        "created": created,
        "answer_count": answerCount,
        "follower_count": followerCount,
        "comment_count": commentCount,
        "bound_topic_ids": List<dynamic>.from(boundTopicIds.map((x) => x)),
        "is_following": isFollowing,
        "excerpt": excerpt,
        "relationship": relationship.toJson(),
        "detail": detail,
        "question_type": roleValues.reverse[questionType],
      };
}

class QuestionRelationship {
  QuestionRelationship({
    this.isAuthor,
  });

  final bool isAuthor;

  factory QuestionRelationship.fromJson(Map<String, dynamic> json) =>
      QuestionRelationship(
        isAuthor: json["is_author"],
      );

  Map<String, dynamic> toJson() => {
        "is_author": isAuthor,
      };
}

enum QuestionType { QUESTION }

final questionTypeValues = EnumValues({"question": QuestionType.QUESTION});

class TargetRelationship {
  TargetRelationship({
    this.isThanked,
    this.isNothelp,
    this.voting,
    this.upvotedFolloweeIds,
  });

  final bool isThanked;
  final bool isNothelp;
  final int voting;
  final List<dynamic> upvotedFolloweeIds;

  factory TargetRelationship.fromJson(Map<String, dynamic> json) =>
      TargetRelationship(
        isThanked: json["is_thanked"],
        isNothelp: json["is_nothelp"],
        voting: json["voting"],
        upvotedFolloweeIds:
            List<dynamic>.from(json["upvoted_followee_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "is_thanked": isThanked,
        "is_nothelp": isNothelp,
        "voting": voting,
        "upvoted_followee_ids":
            List<dynamic>.from(upvotedFolloweeIds.map((x) => x)),
      };
}

enum ReshipmentSettings { DISALLOWED, ALLOWED }

final reshipmentSettingsValues = EnumValues({
  "allowed": ReshipmentSettings.ALLOWED,
  "disallowed": ReshipmentSettings.DISALLOWED
});

class ThumbnailExtraInfo {
  ThumbnailExtraInfo({
    this.videoId,
    this.type,
    this.url,
    this.height,
    this.width,
    this.duration,
    this.playlist,
    this.showMakerEntrance,
  });

  final String videoId;
  final String type;
  final String url;
  final int height;
  final int width;
  final int duration;
  final Playlist playlist;
  final bool showMakerEntrance;

  factory ThumbnailExtraInfo.fromJson(Map<String, dynamic> json) =>
      ThumbnailExtraInfo(
        videoId: json["video_id"],
        type: json["type"],
        url: json["url"],
        height: json["height"],
        width: json["width"],
        duration: json["duration"],
        playlist: Playlist.fromJson(json["playlist"]),
        showMakerEntrance: json["show_maker_entrance"],
      );

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "type": type,
        "url": url,
        "height": height,
        "width": width,
        "duration": duration,
        "playlist": playlist.toJson(),
        "show_maker_entrance": showMakerEntrance,
      };
}

class Playlist {
  Playlist({
    this.ld,
    this.sd,
    this.hd,
  });

  final Hd ld;
  final Hd sd;
  final Hd hd;

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        ld: Hd.fromJson(json["ld"]),
        sd: Hd.fromJson(json["sd"]),
        hd: Hd.fromJson(json["hd"]),
      );

  Map<String, dynamic> toJson() => {
        "ld": ld.toJson(),
        "sd": sd.toJson(),
        "hd": hd.toJson(),
      };
}

class Hd {
  Hd({
    this.url,
    this.bitrate,
    this.duration,
    this.format,
    this.fps,
    this.height,
    this.size,
    this.width,
  });

  final String url;
  final int bitrate;
  final int duration;
  final String format;
  final int fps;
  final int height;
  final int size;
  final int width;

  factory Hd.fromJson(Map<String, dynamic> json) => Hd(
        url: json["url"],
        bitrate: json["bitrate"],
        duration: json["duration"],
        format: json["format"],
        fps: json["fps"],
        height: json["height"],
        size: json["size"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "bitrate": bitrate,
        "duration": duration,
        "format": format,
        "fps": fps,
        "height": height,
        "size": size,
        "width": width,
      };
}

enum FluffyType { FEED, FEED_ADVERT }

final fluffyTypeValues = EnumValues(
    {"feed": FluffyType.FEED, "feed_advert": FluffyType.FEED_ADVERT});

class UninterestReason {
  UninterestReason({
    this.reasonId,
    this.reasonType,
    this.objectToken,
    this.objectType,
    this.reasonText,
  });

  final int reasonId;
  final ReasonType reasonType;
  final String objectToken;
  final UserTypeEnum objectType;
  final String reasonText;

  factory UninterestReason.fromJson(Map<String, dynamic> json) =>
      UninterestReason(
        reasonId: json["reason_id"],
        reasonType: reasonTypeValues.map[json["reason_type"]],
        objectToken: json["object_token"],
        objectType: userTypeEnumValues.map[json["object_type"]],
        reasonText: json["reason_text"],
      );

  Map<String, dynamic> toJson() => {
        "reason_id": reasonId,
        "reason_type": reasonTypeValues.reverse[reasonType],
        "object_token": objectToken,
        "object_type": userTypeEnumValues.reverse[objectType],
        "reason_text": reasonText,
      };
}

enum ReasonType { TOPIC, CREATOR }

final reasonTypeValues =
    EnumValues({"creator": ReasonType.CREATOR, "topic": ReasonType.TOPIC});

enum Verb { TOPIC_ACKNOWLEDGED_ANSWER, TOPIC_ACKNOWLEDGED_ARTICLE, COMMON_CARD }

final verbValues = EnumValues({
  "COMMON_CARD": Verb.COMMON_CARD,
  "TOPIC_ACKNOWLEDGED_ANSWER": Verb.TOPIC_ACKNOWLEDGED_ANSWER,
  "TOPIC_ACKNOWLEDGED_ARTICLE": Verb.TOPIC_ACKNOWLEDGED_ARTICLE
});

class RootComment {
  RootComment({
    this.featuredCounts,
    this.commonCounts,
    this.collapsedCounts,
    this.reviewingCounts,
    this.paging,
    this.data,
  });

  final int featuredCounts;
  final int commonCounts;
  final int collapsedCounts;
  final int reviewingCounts;
  final Paging paging;
  final List<ChildCommentElement> data;

  factory RootComment.fromJson(Map<String, dynamic> json) => RootComment(
        featuredCounts: json["featured_counts"],
        commonCounts: json["common_counts"],
        collapsedCounts: json["collapsed_counts"],
        reviewingCounts: json["reviewing_counts"],
        paging: Paging.fromJson(json["paging"]),
        data: List<ChildCommentElement>.from(
            json["data"].map((x) => ChildCommentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featured_counts": featuredCounts,
        "common_counts": commonCounts,
        "collapsed_counts": collapsedCounts,
        "reviewing_counts": reviewingCounts,
        "paging": paging.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChildCommentElement {
  ChildCommentElement({
    this.id,
    this.type,
    this.url,
    this.content,
    this.featured,
    this.top,
    this.collapsed,
    this.isAuthor,
    this.isDelete,
    this.createdTime,
    this.resourceType,
    this.reviewing,
    this.allowLike,
    this.allowDelete,
    this.allowReply,
    this.allowVote,
    this.canRecommend,
    this.canCollapse,
    this.attachedInfo,
    this.author,
    this.voteCount,
    this.replyToAuthor,
    this.voting,
    this.liked,
    this.disliked,
    this.censorStatus,
    this.childCommentCount,
    this.childComments,
  });

  final int id;
  final PurpleType type;
  final String url;
  final String content;
  final bool featured;
  final bool top;
  final bool collapsed;
  final bool isAuthor;
  final bool isDelete;
  final int createdTime;
  final ResourceTypeEnum resourceType;
  final bool reviewing;
  final bool allowLike;
  final bool allowDelete;
  final bool allowReply;
  final bool allowVote;
  final bool canRecommend;
  final bool canCollapse;
  final String attachedInfo;
  final Author author;
  final int voteCount;
  final Author replyToAuthor;
  final bool voting;
  final bool liked;
  final bool disliked;
  final int censorStatus;
  final int childCommentCount;
  final List<ChildCommentElement> childComments;

  factory ChildCommentElement.fromJson(Map<String, dynamic> json) =>
      ChildCommentElement(
        id: json["id"],
        type: purpleTypeValues.map[json["type"]],
        url: json["url"],
        content: json["content"],
        featured: json["featured"],
        top: json["top"],
        collapsed: json["collapsed"],
        isAuthor: json["is_author"],
        isDelete: json["is_delete"],
        createdTime: json["created_time"],
        resourceType: resourceTypeEnumValues.map[json["resource_type"]],
        reviewing: json["reviewing"],
        allowLike: json["allow_like"],
        allowDelete: json["allow_delete"],
        allowReply: json["allow_reply"],
        allowVote: json["allow_vote"],
        canRecommend: json["can_recommend"],
        canCollapse: json["can_collapse"],
        attachedInfo: json["attached_info"],
        author: Author.fromJson(json["author"]),
        voteCount: json["vote_count"],
        replyToAuthor: json["reply_to_author"] == null
            ? null
            : Author.fromJson(json["reply_to_author"]),
        voting: json["voting"],
        liked: json["liked"],
        disliked: json["disliked"],
        censorStatus: json["censor_status"],
        childCommentCount: json["child_comment_count"] == null
            ? null
            : json["child_comment_count"],
        childComments: json["child_comments"] == null
            ? null
            : List<ChildCommentElement>.from(json["child_comments"]
                .map((x) => ChildCommentElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": purpleTypeValues.reverse[type],
        "url": url,
        "content": content,
        "featured": featured,
        "top": top,
        "collapsed": collapsed,
        "is_author": isAuthor,
        "is_delete": isDelete,
        "created_time": createdTime,
        "resource_type": resourceTypeEnumValues.reverse[resourceType],
        "reviewing": reviewing,
        "allow_like": allowLike,
        "allow_delete": allowDelete,
        "allow_reply": allowReply,
        "allow_vote": allowVote,
        "can_recommend": canRecommend,
        "can_collapse": canCollapse,
        "attached_info": attachedInfo,
        "author": author.toJson(),
        "vote_count": voteCount,
        "reply_to_author":
            replyToAuthor == null ? null : replyToAuthor.toJson(),
        "voting": voting,
        "liked": liked,
        "disliked": disliked,
        "censor_status": censorStatus,
        "child_comment_count":
            childCommentCount == null ? null : childCommentCount,
        "child_comments": childComments == null
            ? null
            : List<dynamic>.from(childComments.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
