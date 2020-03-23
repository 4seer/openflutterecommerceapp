// Hashtag repository
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import '../abstract/model/hashtag.dart';

class HashtagRepository {
  List<HashTag> getHashtags() {
    return [
      HashTag(
        id: 1,
        title: 'T-shirts',
      ),
      HashTag(
        id: 2,
        title: 'Crop tops',
      ),
      HashTag(
        id: 3,
        title: 'Sleeveless',
      ),
      HashTag(
        id: 3,
        title: 'Shirts',
      ),
    ];
  }
}
