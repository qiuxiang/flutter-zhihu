// To parse this JSON data, do
//
//     final recommend = recommendFromJson(jsonString);

import 'dart:convert';

Recommend recommendFromJson(String str) => Recommend.fromJson(json.decode(str));

String recommendToJson(Recommend data) => json.encode(data.toJson());

class Recommend {
  Recommend({
    this.data,
    this.paging,
    this.freshText,
  });

  final List<Datum> data;
  final Paging paging;
  final String freshText;

  factory Recommend.fromJson(Map<String, dynamic> json) => Recommend(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
        freshText: json["fresh_text"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
        "fresh_text": freshText,
      };
}

class Datum {
  Datum({
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
  });

  final String id;
  final DatumType type;
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: datumTypeValues.map[json["type"]],
        offset: json["offset"],
        verb: verbValues.map[json["verb"]],
        createdTime: json["created_time"],
        updatedTime: json["updated_time"],
        target: Target.fromJson(json["target"]),
        brief: json["brief"],
        uninterestReasons: List<UninterestReason>.from(
            json["uninterest_reasons"]
                .map((x) => UninterestReason.fromJson(x))),
        attachedInfo: json["attached_info"],
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        showActorTime: json["show_actor_time"],
        actionText: json["action_text"],
        actionTextTpl: actionTextTplValues.map[json["action_text_tpl"]],
        actionCard: json["action_card"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": datumTypeValues.reverse[type],
        "offset": offset,
        "verb": verbValues.reverse[verb],
        "created_time": createdTime,
        "updated_time": updatedTime,
        "target": target.toJson(),
        "brief": brief,
        "uninterest_reasons":
            List<dynamic>.from(uninterestReasons.map((x) => x.toJson())),
        "attached_info": attachedInfo,
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
        "show_actor_time": showActorTime,
        "action_text": actionText,
        "action_text_tpl": actionTextTplValues.reverse[actionTextTpl],
        "action_card": actionCard,
        "count": count == null ? null : count,
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

enum UserTypeEnum { TOPIC, PEOPLE }

final userTypeEnumValues =
    EnumValues({"people": UserTypeEnum.PEOPLE, "topic": UserTypeEnum.TOPIC});

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
  });

  final dynamic id;
  final TargetType type;
  final String url;
  final Author author;
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
  final String reshipmentSettings;
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

  factory Target.fromJson(Map<String, dynamic> json) => Target(
        id: json["id"],
        type: targetTypeValues.map[json["type"]],
        url: json["url"] == null ? null : json["url"],
        author: Author.fromJson(json["author"]),
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
            : json["reshipment_settings"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": targetTypeValues.reverse[type],
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
        "reshipment_settings":
            reshipmentSettings == null ? null : reshipmentSettings,
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
      };
}

class Author {
  Author({
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

  final String id;
  final UserTypeEnum type;
  final String url;
  final UserTypeEnum userType;
  final String urlToken;
  final String name;
  final String headline;
  final String avatarUrl;
  final bool isOrg;
  final int gender;
  final List<Badge> badge;
  final int followersCount;
  final bool isFollowing;
  final bool isFollowed;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
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
        badge: json["badge"] == null
            ? null
            : List<Badge>.from(json["badge"].map((x) => Badge.fromJson(x))),
        followersCount:
            json["followers_count"] == null ? null : json["followers_count"],
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
        "badge": badge == null
            ? null
            : List<dynamic>.from(badge.map((x) => x.toJson())),
        "followers_count": followersCount == null ? null : followersCount,
        "is_following": isFollowing == null ? null : isFollowing,
        "is_followed": isFollowed == null ? null : isFollowed,
      };
}

class Badge {
  Badge({
    this.type,
    this.description,
    this.topics,
    this.topicNames,
  });

  final String type;
  final String description;
  final List<dynamic> topics;
  final List<String> topicNames;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        type: json["type"],
        description: json["description"],
        topics: json["topics"] == null
            ? null
            : List<dynamic>.from(json["topics"].map((x) => x)),
        topicNames: json["topic_names"] == null
            ? null
            : List<String>.from(json["topic_names"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "description": description,
        "topics":
            topics == null ? null : List<dynamic>.from(topics.map((x) => x)),
        "topic_names": topicNames == null
            ? null
            : List<dynamic>.from(topicNames.map((x) => x)),
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
  final Author author;
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
        author: Author.fromJson(json["author"]),
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
  final String type;
  final String url;
  final Author author;
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
  final String questionType;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        type: json["type"],
        url: json["url"],
        author: Author.fromJson(json["author"]),
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
        questionType: json["question_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
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
        "question_type": questionType,
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

enum TargetType { ANSWER, ARTICLE, ZVIDEO }

final targetTypeValues = EnumValues({
  "answer": TargetType.ANSWER,
  "article": TargetType.ARTICLE,
  "zvideo": TargetType.ZVIDEO
});

enum DatumType { FEED }

final datumTypeValues = EnumValues({"feed": DatumType.FEED});

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

class Paging {
  Paging({
    this.previous,
    this.next,
    this.isEnd,
  });

  final String previous;
  final String next;
  final bool isEnd;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
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
