import 'dart:math';

abstract class Helpers {
  static final random = Random();

  static String randomPictureUrl() {
     final randomInt = random.nextInt(1000);
    //return 'https://media-exp1.licdn.com/dms/image/C4D03AQG1nbcg4Esk3Q/profile-displayphoto-shrink_200_200/0/1638008534625?e=1651104000&v=beta&t=8xDhErIjdg6yCaukUkS29G8BF-8W9F_cnRvhJIFiwd8';
     return 'https://picsum.photos/seed/$randomInt/300/300';
  }

  static String dummyProfileImageUrl()=>'https://media-exp1.licdn.com/dms/image/C4D03AQG1nbcg4Esk3Q/profile-displayphoto-shrink_200_200/0/1638008534625?e=1651104000&v=beta&t=8xDhErIjdg6yCaukUkS29G8BF-8W9F_cnRvhJIFiwd8';
    

  static DateTime randomDate() {
    final random = Random();
    final currentDate = DateTime.now();
    return currentDate.subtract(Duration(seconds: random.nextInt(200000)));
  }
}
