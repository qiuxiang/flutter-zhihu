// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);
//     final recommend = recommendFromJson(jsonString);

import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data?.toJson());

Recommend recommendFromJson(String str) => Recommend.fromJson(json.decode(str));

String recommendToJson(Recommend data) => json.encode(data?.toJson());

class Comment {
    Comment({
        this.featuredCounts,
        this.commonCounts,
        this.collapsedCounts,
        this.reviewingCounts,
        this.paging,
        this.data,
    });

    final int? featuredCounts;
    final int? commonCounts;
    final int? collapsedCounts;
    final int? reviewingCounts;
    final CommentPaging? paging;
    final List<ChildCommentElement>? data;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        featuredCounts: json["featured_counts"],
        commonCounts: json["common_counts"],
        collapsedCounts: json["collapsed_counts"],
        reviewingCounts: json["reviewing_counts"],
        paging: CommentPaging.fromJson(json["paging"]),
        data: json["data"] == null ? [] : List<ChildCommentElement>.from(json["data"]!.map((x) => ChildCommentElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "featured_counts": featuredCounts,
        "common_counts": commonCounts,
        "collapsed_counts": collapsedCounts,
        "reviewing_counts": reviewingCounts,
        "paging": paging?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x?.toJson())),
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

    final int? id;
    final PurpleType? type;
    final String? url;
    final String? content;
    final bool? featured;
    final bool? top;
    final bool? collapsed;
    final bool? isAuthor;
    final bool? isDelete;
    final int? createdTime;
    final ResourceTypeEnum? resourceType;
    final bool? reviewing;
    final bool? allowLike;
    final bool? allowDelete;
    final bool? allowReply;
    final bool? allowVote;
    final bool? canRecommend;
    final bool? canCollapse;
    final String? attachedInfo;
    final ReplyToAuthorClass? author;
    final int? voteCount;
    final ReplyToAuthorClass? replyToAuthor;
    final bool? voting;
    final bool? liked;
    final bool? disliked;
    final int? censorStatus;
    final int? childCommentCount;
    final List<ChildCommentElement>? childComments;

    factory ChildCommentElement.fromJson(Map<String, dynamic> json) => ChildCommentElement(
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
        author: ReplyToAuthorClass.fromJson(json["author"]),
        voteCount: json["vote_count"],
        replyToAuthor: json["reply_to_author"] == null ? null : ReplyToAuthorClass.fromJson(json["reply_to_author"]),
        voting: json["voting"],
        liked: json["liked"],
        disliked: json["disliked"],
        censorStatus: json["censor_status"],
        childCommentCount: json["child_comment_count"] == null ? null : json["child_comment_count"],
        childComments: json["child_comments"] == null ? null : json["child_comments"] == null ? [] : List<ChildCommentElement>.from(json["child_comments"]!.map((x) => ChildCommentElement.fromJson(x))),
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
        "author": author?.toJson(),
        "vote_count": voteCount,
        "reply_to_author": replyToAuthor == null ? null : replyToAuthor?.toJson(),
        "voting": voting,
        "liked": liked,
        "disliked": disliked,
        "censor_status": censorStatus,
        "child_comment_count": childCommentCount == null ? null : childCommentCount,
        "child_comments": childComments == null ? null : childComments == null ? [] : List<dynamic>.from(childComments!.map((x) => x?.toJson())),
    };
}

class ReplyToAuthorClass {
    ReplyToAuthorClass({
        this.role,
        this.member,
    });

    final Role? role;
    final Member? member;

    factory ReplyToAuthorClass.fromJson(Map<String, dynamic> json) => ReplyToAuthorClass(
        role: roleValues.map[json["role"]],
        member: Member.fromJson(json["member"]),
    );

    Map<String, dynamic> toJson() => {
        "role": roleValues.reverse[role],
        "member": member?.toJson(),
    };
}

class Member {
    Member({
        this.id,
        this.urlToken,
        this.name,
        this.avatarUrl,
        this.avatarUrlTemplate,
        this.isOrg,
        this.type,
        this.url,
        this.userType,
        this.headline,
        this.badge,
        this.gender,
        this.isAdvertiser,
        this.followersCount,
        this.isFollowing,
        this.isFollowed,
    });

    final String? id;
    final String? urlToken;
    final String? name;
    final String? avatarUrl;
    final String? avatarUrlTemplate;
    final bool? isOrg;
    final UserTypeEnum? type;
    final String? url;
    final UserTypeEnum? userType;
    final String? headline;
    final List<MemberBadge>? badge;
    final int? gender;
    final bool? isAdvertiser;
    final int? followersCount;
    final bool? isFollowing;
    final bool? isFollowed;

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        urlToken: json["url_token"],
        name: json["name"],
        avatarUrl: json["avatar_url"],
        avatarUrlTemplate: json["avatar_url_template"] == null ? null : json["avatar_url_template"],
        isOrg: json["is_org"] == null ? null : json["is_org"],
        type: userTypeEnumValues.map[json["type"]],
        url: json["url"],
        userType: userTypeEnumValues.map[json["user_type"]],
        headline: json["headline"],
        badge: json["badge"] == null ? null : json["badge"] == null ? [] : List<MemberBadge>.from(json["badge"]!.map((x) => MemberBadge.fromJson(x))),
        gender: json["gender"] == null ? null : json["gender"],
        isAdvertiser: json["is_advertiser"] == null ? null : json["is_advertiser"],
        followersCount: json["followers_count"] == null ? null : json["followers_count"],
        isFollowing: json["is_following"] == null ? null : json["is_following"],
        isFollowed: json["is_followed"] == null ? null : json["is_followed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url_token": urlToken,
        "name": name,
        "avatar_url": avatarUrl,
        "avatar_url_template": avatarUrlTemplate == null ? null : avatarUrlTemplate,
        "is_org": isOrg == null ? null : isOrg,
        "type": userTypeEnumValues.reverse[type],
        "url": url,
        "user_type": userTypeEnumValues.reverse[userType],
        "headline": headline,
        "badge": badge == null ? null : badge == null ? [] : List<dynamic>.from(badge!.map((x) => x?.toJson())),
        "gender": gender == null ? null : gender,
        "is_advertiser": isAdvertiser == null ? null : isAdvertiser,
        "followers_count": followersCount == null ? null : followersCount,
        "is_following": isFollowing == null ? null : isFollowing,
        "is_followed": isFollowed == null ? null : isFollowed,
    };
}

class MemberBadge {
    MemberBadge({
        this.type,
        this.description,
    });

    final String? type;
    final String? description;

    factory MemberBadge.fromJson(Map<String, dynamic> json) => MemberBadge(
        type: json["type"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "description": description,
    };
}

enum UserTypeEnum { PEOPLE, TOPIC }

final userTypeEnumValues = EnumValues({
    "people": UserTypeEnum.PEOPLE,
    "topic": UserTypeEnum.TOPIC
});

enum Role { NORMAL }

final roleValues = EnumValues({
    "normal": Role.NORMAL
});

enum ResourceTypeEnum { ANSWER, ARTICLE, ZVIDEO }

final resourceTypeEnumValues = EnumValues({
    "answer": ResourceTypeEnum.ANSWER,
    "article": ResourceTypeEnum.ARTICLE,
    "zvideo": ResourceTypeEnum.ZVIDEO
});

enum PurpleType { COMMENT }

final purpleTypeValues = EnumValues({
    "comment": PurpleType.COMMENT
});

class CommentPaging {
    CommentPaging({
        this.isEnd,
        this.isStart,
        this.next,
        this.previous,
        this.totals,
    });

    final bool? isEnd;
    final bool? isStart;
    final String? next;
    final String? previous;
    final int? totals;

    factory CommentPaging.fromJson(Map<String, dynamic> json) => CommentPaging(
        isEnd: json["is_end"],
        isStart: json["is_start"],
        next: json["next"],
        previous: json["previous"],
        totals: json["totals"],
    );

    Map<String, dynamic> toJson() => {
        "is_end": isEnd,
        "is_start": isStart,
        "next": next,
        "previous": previous,
        "totals": totals,
    };
}

class Recommend {
    Recommend({
        this.data,
        this.paging,
        this.freshText,
    });

    final List<RecommendDatum>? data;
    final RecommendPaging? paging;
    final String? freshText;

    factory Recommend.fromJson(Map<String, dynamic> json) => Recommend(
        data: json["data"] == null ? [] : List<RecommendDatum>.from(json["data"]!.map((x) => RecommendDatum.fromJson(x))),
        paging: RecommendPaging.fromJson(json["paging"]),
        freshText: json["fresh_text"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x?.toJson())),
        "paging": paging?.toJson(),
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

    final String? id;
    final FluffyType? type;
    final int? offset;
    final Verb? verb;
    final int? createdTime;
    final int? updatedTime;
    final Target? target;
    final String? brief;
    final List<UninterestReason>? uninterestReasons;
    final String? attachedInfo;
    final List<Actor>? actors;
    final bool? showActorTime;
    final String? actionText;
    final ActionTextTpl? actionTextTpl;
    final bool? actionCard;
    final int? count;
    final Ad? ad;
    final List<dynamic>? adList;
    final String? adjson;
    final String? pcontent;
    final String? ncontent;
    final ExtInfo? extInfo;

    factory RecommendDatum.fromJson(Map<String, dynamic> json) => RecommendDatum(
        id: json["id"],
        type: fluffyTypeValues.map[json["type"]],
        offset: json["offset"] == null ? null : json["offset"],
        verb: json["verb"] == null ? null : verbValues.map[json["verb"]],
        createdTime: json["created_time"] == null ? null : json["created_time"],
        updatedTime: json["updated_time"] == null ? null : json["updated_time"],
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        brief: json["brief"],
        uninterestReasons: json["uninterest_reasons"] == null ? null : json["uninterest_reasons"] == null ? [] : List<UninterestReason>.from(json["uninterest_reasons"]!.map((x) => UninterestReason.fromJson(x))),
        attachedInfo: json["attached_info"],
        actors: json["actors"] == null ? null : json["actors"] == null ? [] : List<Actor>.from(json["actors"]!.map((x) => Actor.fromJson(x))),
        showActorTime: json["show_actor_time"] == null ? null : json["show_actor_time"],
        actionText: json["action_text"],
        actionTextTpl: json["action_text_tpl"] == null ? null : actionTextTplValues.map[json["action_text_tpl"]],
        actionCard: json["action_card"] == null ? null : json["action_card"],
        count: json["count"] == null ? null : json["count"],
        ad: json["ad"] == null ? null : Ad.fromJson(json["ad"]),
        adList: json["ad_list"] == null ? null : json["ad_list"] == null ? [] : List<dynamic>.from(json["ad_list"]!.map((x) => x)),
        adjson: json["adjson"] == null ? null : json["adjson"],
        pcontent: json["pcontent"] == null ? null : json["pcontent"],
        ncontent: json["ncontent"] == null ? null : json["ncontent"],
        extInfo: json["ext_info"] == null ? null : ExtInfo.fromJson(json["ext_info"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": fluffyTypeValues.reverse[type],
        "offset": offset == null ? null : offset,
        "verb": verb == null ? null : verbValues.reverse[verb],
        "created_time": createdTime == null ? null : createdTime,
        "updated_time": updatedTime == null ? null : updatedTime,
        "target": target == null ? null : target?.toJson(),
        "brief": brief,
        "uninterest_reasons": uninterestReasons == null ? null : uninterestReasons == null ? [] : List<dynamic>.from(uninterestReasons!.map((x) => x?.toJson())),
        "attached_info": attachedInfo,
        "actors": actors == null ? null : actors == null ? [] : List<dynamic>.from(actors!.map((x) => x?.toJson())),
        "show_actor_time": showActorTime == null ? null : showActorTime,
        "action_text": actionText,
        "action_text_tpl": actionTextTpl == null ? null : actionTextTplValues.reverse[actionTextTpl],
        "action_card": actionCard == null ? null : actionCard,
        "count": count == null ? null : count,
        "ad": ad == null ? null : ad?.toJson(),
        "ad_list": adList == null ? null : adList == null ? [] : List<dynamic>.from(adList!.map((x) => x)),
        "adjson": adjson == null ? null : adjson,
        "pcontent": pcontent == null ? null : pcontent,
        "ncontent": ncontent == null ? null : ncontent,
        "ext_info": extInfo == null ? null : extInfo?.toJson(),
    };
}

enum ActionTextTpl { EMPTY, ACTION_TEXT_TPL }

final actionTextTplValues = EnumValues({
    "热门内容, 来自: {}": ActionTextTpl.ACTION_TEXT_TPL,
    "热门内容, 来自:{}": ActionTextTpl.EMPTY
});

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

    final String? id;
    final UserTypeEnum? type;
    final String? url;
    final String? avatarUrl;
    final String? name;
    final String? excerpt;
    final String? introduction;

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

    final int? count;
    final int? position;
    final String? adVerb;
    final String? closeTrack;
    final String? revertCloseTrack;
    final String? template;
    final List<String>? loadTracks;
    final List<Creative>? creatives;
    final int? voteUpCount;
    final int? commentCount;
    final bool? isFollowing;
    final int? category;
    final int? id;
    final bool? canInteract;
    final int? userId;
    final int? ctr;
    final bool? displayAdvertisingTag;
    final List<String>? debugTracks;
    final bool? landPrefetch;
    final bool? nativePrefetch;
    final bool? isNewWebview;
    final String? experimentInfo;
    final bool? downloadSilent;
    final bool? isSpeeding;
    final AdBrand? brand;

    factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        count: json["count"],
        position: json["position"],
        adVerb: json["ad_verb"],
        closeTrack: json["close_track"],
        revertCloseTrack: json["revert_close_track"],
        template: json["template"],
        loadTracks: json["load_tracks"] == null ? [] : List<String>.from(json["load_tracks"]!.map((x) => x)),
        creatives: json["creatives"] == null ? [] : List<Creative>.from(json["creatives"]!.map((x) => Creative.fromJson(x))),
        voteUpCount: json["vote_up_count"],
        commentCount: json["comment_count"],
        isFollowing: json["is_following"],
        category: json["category"],
        id: json["id"],
        canInteract: json["can_interact"],
        userId: json["user_id"],
        ctr: json["ctr"],
        displayAdvertisingTag: json["display_advertising_tag"],
        debugTracks: json["debug_tracks"] == null ? [] : List<String>.from(json["debug_tracks"]!.map((x) => x)),
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
        "load_tracks": loadTracks == null ? [] : List<dynamic>.from(loadTracks!.map((x) => x)),
        "creatives": creatives == null ? [] : List<dynamic>.from(creatives!.map((x) => x?.toJson())),
        "vote_up_count": voteUpCount,
        "comment_count": commentCount,
        "is_following": isFollowing,
        "category": category,
        "id": id,
        "can_interact": canInteract,
        "user_id": userId,
        "ctr": ctr,
        "display_advertising_tag": displayAdvertisingTag,
        "debug_tracks": debugTracks == null ? [] : List<dynamic>.from(debugTracks!.map((x) => x)),
        "land_prefetch": landPrefetch,
        "native_prefetch": nativePrefetch,
        "is_new_webview": isNewWebview,
        "experiment_info": experimentInfo,
        "download_silent": downloadSilent,
        "is_speeding": isSpeeding,
        "brand": brand?.toJson(),
    };
}

class AdBrand {
    AdBrand({
        this.name,
        this.logo,
        this.type,
        this.actionText,
    });

    final String? name;
    final String? logo;
    final String? type;
    final String? actionText;

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

    final String? landingUrl;
    final String? image;
    final String? image2X;
    final String? title;
    final String? description;
    final String? button;
    final bool? actionButton;
    final Cta? footer;
    final Cta? cta;
    final CreativeBrand? brand;
    final String? appPromotionUrl;
    final String? nativeUrl;
    final String? deepUrl;
    final int? videoWatchNum;
    final String? zaAdInfo;
    final String? zaAdInfoJson;
    final String? externalClickUrl;
    final List<String>? impressionTracks;
    final List<String>? clickTracks;
    final int? id;
    final String? name;
    final List<String>? conversionTracks;
    final String? contentType;
    final String? targetToken;

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
        impressionTracks: json["impression_tracks"] == null ? [] : List<String>.from(json["impression_tracks"]!.map((x) => x)),
        clickTracks: json["click_tracks"] == null ? [] : List<String>.from(json["click_tracks"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        conversionTracks: json["conversion_tracks"] == null ? [] : List<String>.from(json["conversion_tracks"]!.map((x) => x)),
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
        "footer": footer?.toJson(),
        "cta": cta?.toJson(),
        "brand": brand?.toJson(),
        "app_promotion_url": appPromotionUrl,
        "native_url": nativeUrl,
        "deep_url": deepUrl,
        "video_watch_num": videoWatchNum,
        "za_ad_info": zaAdInfo,
        "za_ad_info_json": zaAdInfoJson,
        "external_click_url": externalClickUrl,
        "impression_tracks": impressionTracks == null ? [] : List<dynamic>.from(impressionTracks!.map((x) => x)),
        "click_tracks": clickTracks == null ? [] : List<dynamic>.from(clickTracks!.map((x) => x)),
        "id": id,
        "name": name,
        "conversion_tracks": conversionTracks == null ? [] : List<dynamic>.from(conversionTracks!.map((x) => x)),
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

    final int? id;
    final String? name;
    final String? logo;

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

    final String? value;

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

    final dynamic? contentType;
    final dynamic? contentId;
    final int? priority;
    final double? ecpm;
    final int? type;

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
        this.author,
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

    final dynamic? id;
    final ResourceTypeEnum? type;
    final String? url;
    final int? createdTime;
    final int? updatedTime;
    final int? voteupCount;
    final int? thanksCount;
    final int? commentCount;
    final bool? isCopyable;
    final Question? question;
    final String? thumbnail;
    final String? excerpt;
    final String? excerptNew;
    final PreviewType? previewType;
    final String? previewText;
    final ReshipmentSettings? reshipmentSettings;
    final String? content;
    final List<dynamic>? markInfos;
    final TargetRelationship? relationship;
    final bool? isLabeled;
    final int? visitedCount;
    final TargetAuthor? author;
    final String? title;
    final String? excerptTitle;
    final String? imageUrl;
    final String? commentPermission;
    final int? created;
    final int? updated;
    final int? voting;
    final List<dynamic>? upvotedFollowees;
    final Linkbox? linkbox;
    final Column? column;
    final String? description;
    final int? memberId;
    final int? voteCount;
    final ThumbnailExtraInfo? thumbnailExtraInfo;
    final int? playCount;
    final Attachment? attachment;

    factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        type: resourceTypeEnumValues.map[json["type"]],
        url: json["url"] == null ? null : json["url"],
        createdTime: json["created_time"] == null ? null : json["created_time"],
        updatedTime: json["updated_time"] == null ? null : json["updated_time"],
        voteupCount: json["voteup_count"] == null ? null : json["voteup_count"],
        thanksCount: json["thanks_count"] == null ? null : json["thanks_count"],
        commentCount: json["comment_count"],
        isCopyable: json["is_copyable"] == null ? null : json["is_copyable"],
        question: json["question"] == null ? null : Question.fromJson(json["question"]),
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        excerpt: json["excerpt"],
        excerptNew: json["excerpt_new"] == null ? null : json["excerpt_new"],
        previewType: json["preview_type"] == null ? null : previewTypeValues.map[json["preview_type"]],
        previewText: json["preview_text"] == null ? null : json["preview_text"],
        reshipmentSettings: json["reshipment_settings"] == null ? null : reshipmentSettingsValues.map[json["reshipment_settings"]],
        content: json["content"] == null ? null : json["content"],
        markInfos: json["mark_infos"] == null ? null : json["mark_infos"] == null ? [] : List<dynamic>.from(json["mark_infos"]!.map((x) => x)),
        relationship: json["relationship"] == null ? null : TargetRelationship.fromJson(json["relationship"]),
        isLabeled: json["is_labeled"] == null ? null : json["is_labeled"],
        visitedCount: json["visited_count"] == null ? null : json["visited_count"],
        author: json["author"] == null ? null : TargetAuthor.fromJson(json["author"]),
        title: json["title"] == null ? null : json["title"],
        excerptTitle: json["excerpt_title"] == null ? null : json["excerpt_title"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        commentPermission: json["comment_permission"] == null ? null : json["comment_permission"],
        created: json["created"] == null ? null : json["created"],
        updated: json["updated"] == null ? null : json["updated"],
        voting: json["voting"] == null ? null : json["voting"],
        upvotedFollowees: json["upvoted_followees"] == null ? null : json["upvoted_followees"] == null ? [] : List<dynamic>.from(json["upvoted_followees"]!.map((x) => x)),
        linkbox: json["linkbox"] == null ? null : Linkbox.fromJson(json["linkbox"]),
        column: json["column"] == null ? null : Column.fromJson(json["column"]),
        description: json["description"] == null ? null : json["description"],
        memberId: json["member_id"] == null ? null : json["member_id"],
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
        thumbnailExtraInfo: json["thumbnail_extra_info"] == null ? null : ThumbnailExtraInfo.fromJson(json["thumbnail_extra_info"]),
        playCount: json["play_count"] == null ? null : json["play_count"],
        attachment: json["attachment"] == null ? null : Attachment.fromJson(json["attachment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": resourceTypeEnumValues.reverse[type],
        "url": url == null ? null : url,
        "created_time": createdTime == null ? null : createdTime,
        "updated_time": updatedTime == null ? null : updatedTime,
        "voteup_count": voteupCount == null ? null : voteupCount,
        "thanks_count": thanksCount == null ? null : thanksCount,
        "comment_count": commentCount,
        "is_copyable": isCopyable == null ? null : isCopyable,
        "question": question == null ? null : question?.toJson(),
        "thumbnail": thumbnail == null ? null : thumbnail,
        "excerpt": excerpt,
        "excerpt_new": excerptNew == null ? null : excerptNew,
        "preview_type": previewType == null ? null : previewTypeValues.reverse[previewType],
        "preview_text": previewText == null ? null : previewText,
        "reshipment_settings": reshipmentSettings == null ? null : reshipmentSettingsValues.reverse[reshipmentSettings],
        "content": content == null ? null : content,
        "mark_infos": markInfos == null ? null : markInfos == null ? [] : List<dynamic>.from(markInfos!.map((x) => x)),
        "relationship": relationship == null ? null : relationship?.toJson(),
        "is_labeled": isLabeled == null ? null : isLabeled,
        "visited_count": visitedCount == null ? null : visitedCount,
        "author": author == null ? null : author?.toJson(),
        "title": title == null ? null : title,
        "excerpt_title": excerptTitle == null ? null : excerptTitle,
        "image_url": imageUrl == null ? null : imageUrl,
        "comment_permission": commentPermission == null ? null : commentPermission,
        "created": created == null ? null : created,
        "updated": updated == null ? null : updated,
        "voting": voting == null ? null : voting,
        "upvoted_followees": upvotedFollowees == null ? null : upvotedFollowees == null ? [] : List<dynamic>.from(upvotedFollowees!.map((x) => x)),
        "linkbox": linkbox == null ? null : linkbox?.toJson(),
        "column": column == null ? null : column?.toJson(),
        "description": description == null ? null : description,
        "member_id": memberId == null ? null : memberId,
        "vote_count": voteCount == null ? null : voteCount,
        "thumbnail_extra_info": thumbnailExtraInfo == null ? null : thumbnailExtraInfo?.toJson(),
        "play_count": playCount == null ? null : playCount,
        "attachment": attachment == null ? null : attachment?.toJson(),
    };
}

class Attachment {
    Attachment({
        this.type,
        this.url,
    });

    final int? type;
    final String? url;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class TargetAuthor {
    TargetAuthor({
        this.id,
        this.type,
        this.url,
        this.userType,
        this.urlToken,
        this.name,
        this.headline,
        this.avatarUrl,
        this.isOrg,
        this.gender,
        this.badge,
        this.followersCount,
        this.isFollowing,
        this.isFollowed,
    });

    final String? id;
    final UserTypeEnum? type;
    final String? url;
    final UserTypeEnum? userType;
    final String? urlToken;
    final String? name;
    final String? headline;
    final String? avatarUrl;
    final bool? isOrg;
    final int? gender;
    final List<PurpleBadge>? badge;
    final int? followersCount;
    final bool? isFollowing;
    final bool? isFollowed;

    factory TargetAuthor.fromJson(Map<String, dynamic> json) => TargetAuthor(
        id: json["id"],
        type: userTypeEnumValues.map[json["type"]],
        url: json["url"],
        userType: userTypeEnumValues.map[json["user_type"]],
        urlToken: json["url_token"],
        name: json["name"],
        headline: json["headline"],
        avatarUrl: json["avatar_url"],
        isOrg: json["is_org"] == null ? null : json["is_org"],
        gender: json["gender"] == null ? null : json["gender"],
        badge: json["badge"] == null ? null : json["badge"] == null ? [] : List<PurpleBadge>.from(json["badge"]!.map((x) => PurpleBadge.fromJson(x))),
        followersCount: json["followers_count"] == null ? null : json["followers_count"],
        isFollowing: json["is_following"] == null ? null : json["is_following"],
        isFollowed: json["is_followed"] == null ? null : json["is_followed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": userTypeEnumValues.reverse[type],
        "url": url,
        "user_type": userTypeEnumValues.reverse[userType],
        "url_token": urlToken,
        "name": name,
        "headline": headline,
        "avatar_url": avatarUrl,
        "is_org": isOrg == null ? null : isOrg,
        "gender": gender == null ? null : gender,
        "badge": badge == null ? null : badge == null ? [] : List<dynamic>.from(badge!.map((x) => x?.toJson())),
        "followers_count": followersCount == null ? null : followersCount,
        "is_following": isFollowing == null ? null : isFollowing,
        "is_followed": isFollowed == null ? null : isFollowed,
    };
}

class PurpleBadge {
    PurpleBadge({
        this.type,
        this.description,
        this.topics,
        this.topicNames,
    });

    final String? type;
    final String? description;
    final List<dynamic>? topics;
    final List<String>? topicNames;

    factory PurpleBadge.fromJson(Map<String, dynamic> json) => PurpleBadge(
        type: json["type"],
        description: json["description"],
        topics: json["topics"] == null ? null : json["topics"] == null ? [] : List<dynamic>.from(json["topics"]!.map((x) => x)),
        topicNames: json["topic_names"] == null ? null : json["topic_names"] == null ? [] : List<String>.from(json["topic_names"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "description": description,
        "topics": topics == null ? null : topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
        "topic_names": topicNames == null ? null : topicNames == null ? [] : List<dynamic>.from(topicNames!.map((x) => x)),
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

    final String? id;
    final String? type;
    final String? url;
    final Member? author;
    final String? title;
    final String? imageUrl;
    final String? commentPermission;
    final String? intro;
    final int? updated;
    final bool? isFollowing;

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
        "author": author?.toJson(),
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

    final String? pic;
    final String? title;
    final String? url;
    final String? category;

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

final previewTypeValues = EnumValues({
    "default": PreviewType.DEFAULT
});

class Question {
    Question({
        this.id,
        this.type,
        this.url,
        this.title,
        this.created,
        this.answerCount,
        this.followerCount,
        this.commentCount,
        this.isFollowing,
        this.excerpt,
        this.detail,
        this.questionType,
        this.author,
        this.boundTopicIds,
        this.relationship,
    });

    final int? id;
    final QuestionType? type;
    final String? url;
    final String? title;
    final int? created;
    final int? answerCount;
    final int? followerCount;
    final int? commentCount;
    final bool? isFollowing;
    final String? excerpt;
    final String? detail;
    final Role? questionType;
    final TargetAuthor? author;
    final List<int>? boundTopicIds;
    final QuestionRelationship? relationship;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        type: questionTypeValues.map[json["type"]],
        url: json["url"],
        title: json["title"],
        created: json["created"],
        answerCount: json["answer_count"],
        followerCount: json["follower_count"],
        commentCount: json["comment_count"],
        isFollowing: json["is_following"],
        excerpt: json["excerpt"],
        detail: json["detail"],
        questionType: roleValues.map[json["question_type"]],
        author: json["author"] == null ? null : TargetAuthor.fromJson(json["author"]),
        boundTopicIds: json["bound_topic_ids"] == null ? null : json["bound_topic_ids"] == null ? [] : List<int>.from(json["bound_topic_ids"]!.map((x) => x)),
        relationship: json["relationship"] == null ? null : QuestionRelationship.fromJson(json["relationship"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": questionTypeValues.reverse[type],
        "url": url,
        "title": title,
        "created": created,
        "answer_count": answerCount,
        "follower_count": followerCount,
        "comment_count": commentCount,
        "is_following": isFollowing,
        "excerpt": excerpt,
        "detail": detail,
        "question_type": roleValues.reverse[questionType],
        "author": author == null ? null : author?.toJson(),
        "bound_topic_ids": boundTopicIds == null ? null : boundTopicIds == null ? [] : List<dynamic>.from(boundTopicIds!.map((x) => x)),
        "relationship": relationship == null ? null : relationship?.toJson(),
    };
}

class QuestionRelationship {
    QuestionRelationship({
        this.isAuthor,
    });

    final bool? isAuthor;

    factory QuestionRelationship.fromJson(Map<String, dynamic> json) => QuestionRelationship(
        isAuthor: json["is_author"],
    );

    Map<String, dynamic> toJson() => {
        "is_author": isAuthor,
    };
}

enum QuestionType { QUESTION }

final questionTypeValues = EnumValues({
    "question": QuestionType.QUESTION
});

class TargetRelationship {
    TargetRelationship({
        this.isThanked,
        this.isNothelp,
        this.voting,
        this.upvotedFolloweeIds,
    });

    final bool? isThanked;
    final bool? isNothelp;
    final int? voting;
    final List<dynamic>? upvotedFolloweeIds;

    factory TargetRelationship.fromJson(Map<String, dynamic> json) => TargetRelationship(
        isThanked: json["is_thanked"],
        isNothelp: json["is_nothelp"],
        voting: json["voting"],
        upvotedFolloweeIds: json["upvoted_followee_ids"] == null ? null : json["upvoted_followee_ids"] == null ? [] : List<dynamic>.from(json["upvoted_followee_ids"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "is_thanked": isThanked,
        "is_nothelp": isNothelp,
        "voting": voting,
        "upvoted_followee_ids": upvotedFolloweeIds == null ? null : upvotedFolloweeIds == null ? [] : List<dynamic>.from(upvotedFolloweeIds!.map((x) => x)),
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

    final String? videoId;
    final String? type;
    final String? url;
    final int? height;
    final int? width;
    final int? duration;
    final Playlist? playlist;
    final bool? showMakerEntrance;

    factory ThumbnailExtraInfo.fromJson(Map<String, dynamic> json) => ThumbnailExtraInfo(
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
        "playlist": playlist?.toJson(),
        "show_maker_entrance": showMakerEntrance,
    };
}

class Playlist {
    Playlist({
        this.ld,
        this.sd,
        this.hd,
    });

    final Hd? ld;
    final Hd? sd;
    final Hd? hd;

    factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        ld: Hd.fromJson(json["ld"]),
        sd: Hd.fromJson(json["sd"]),
        hd: Hd.fromJson(json["hd"]),
    );

    Map<String, dynamic> toJson() => {
        "ld": ld?.toJson(),
        "sd": sd?.toJson(),
        "hd": hd?.toJson(),
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

    final String? url;
    final int? bitrate;
    final int? duration;
    final String? format;
    final int? fps;
    final int? height;
    final int? size;
    final int? width;

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

final fluffyTypeValues = EnumValues({
    "feed": FluffyType.FEED,
    "feed_advert": FluffyType.FEED_ADVERT
});

class UninterestReason {
    UninterestReason({
        this.reasonId,
        this.reasonType,
        this.objectToken,
        this.objectType,
        this.reasonText,
    });

    final int? reasonId;
    final ReasonType? reasonType;
    final String? objectToken;
    final UserTypeEnum? objectType;
    final String? reasonText;

    factory UninterestReason.fromJson(Map<String, dynamic> json) => UninterestReason(
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

final reasonTypeValues = EnumValues({
    "creator": ReasonType.CREATOR,
    "topic": ReasonType.TOPIC
});

enum Verb { TOPIC_ACKNOWLEDGED_ANSWER, TOPIC_ACKNOWLEDGED_ARTICLE, COMMON_CARD }

final verbValues = EnumValues({
    "COMMON_CARD": Verb.COMMON_CARD,
    "TOPIC_ACKNOWLEDGED_ANSWER": Verb.TOPIC_ACKNOWLEDGED_ANSWER,
    "TOPIC_ACKNOWLEDGED_ARTICLE": Verb.TOPIC_ACKNOWLEDGED_ARTICLE
});

class RecommendPaging {
    RecommendPaging({
        this.previous,
        this.next,
        this.isEnd,
    });

    final String? previous;
    final String? next;
    final bool? isEnd;

    factory RecommendPaging.fromJson(Map<String, dynamic> json) => RecommendPaging(
        previous: json["previous"],
        next: json["next"],
        isEnd: json["is_end"],
    );

    Map<String, dynamic> toJson() => {
        "previous": previous,
        "next": next,
        "is_end": isEnd,
    };
}

class EnumValues<T> {
    final Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}
