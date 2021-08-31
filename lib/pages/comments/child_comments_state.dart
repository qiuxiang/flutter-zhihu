import '../../api.dart';
import '../comments/comments_state.dart';

class ChildCommentsState extends CommentsState {
  @override
  Future<Map> getComments() {
    return getChildComment(target!['id'], page);
  }
}
