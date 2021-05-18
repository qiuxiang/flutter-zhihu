import '../../api.dart';
import '../comments/comments_state.dart';

class ChildCommentsState extends CommentsState {
  Map? item;

  @override
  Future<Map> getComments() {
    return getChildComment(item!['id'], page);
  }
}
