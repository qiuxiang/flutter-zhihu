import '../../api.dart';
import '../../types.dart';
import '../comments/comments_state.dart';

class ChildCommentsState extends CommentsState {
  ChildCommentElement item;

  @override
  Future<Comment> getComments() {
    return getChildComment(item.id, page);
  }
}
