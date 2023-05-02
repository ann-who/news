# News

Приложение новостей

* Для реализации использован немного изменённый репозитеорий <https://github.com/forestvpn/forestvpn_flutter_test/blob/main/lib/repositories/news/mock_news_repository.dart> (добавлено несколько дополнительных статей, у модели Article добавлено поле isFeatured). Доп.статьи взяты из <https://dummyjson.com/posts>. Иконка приложения взята здесь <https://icons8.ru/icon/111271/новости>

* Для управления состоянием использован пакет flutter_bloc

* При получении статей добавлен Future.delayed(), чтобы симитировать подгрузку

* Есть состояния загрузки, обработаны ошибки

## Скриншоты работы приложения

### Главный экран

![screenshot_1](https://user-images.githubusercontent.com/67263836/235592264-9bc00738-0fe6-4353-ad49-e18e6ecab640.jpg)
![screenshot_2](https://user-images.githubusercontent.com/67263836/235592466-924d1a5d-8e59-4697-b8f1-d251733c28ae.jpg)
![screenshot_3](https://user-images.githubusercontent.com/67263836/235592620-b4814fcf-3736-4208-b727-2525da613ab1.jpg)
![screenshot_4](https://user-images.githubusercontent.com/67263836/235593167-8657b089-f0ed-41a9-ac21-a15e91eea209.jpg)

### Детальный экран новости

![screenshot_5](https://user-images.githubusercontent.com/67263836/235593300-c8adaa6b-c5db-4bb3-a957-d18aef7c75ec.jpg)
![screenshot_6](https://user-images.githubusercontent.com/67263836/235594455-e9d85949-82f5-4215-a4ca-d278e96f72c8.jpg)
![screenshot_7](https://user-images.githubusercontent.com/67263836/235594526-b53caca7-5aaa-490e-9887-a4abf3f481df.jpg)
