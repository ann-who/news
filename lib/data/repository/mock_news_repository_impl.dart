import 'package:news_app/data/model/article.dart';
import 'package:news_app/domain/repository/news_repository.dart';

class MockNewsRepository implements AbstractNewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    // For debagging purpose
    await Future.delayed(const Duration(milliseconds: 1500));
    return _mockArticles
      ..sort((a, b) => b.publicationDate.compareTo(a.publicationDate));
  }

  @override
  Future<Article> getArticle({required String id}) async {
    // For debagging purpose
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockArticles.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    // For debagging purpose
    await Future.delayed(const Duration(seconds: 1));
    return _mockArticles.where((article) => article.isFeatured).toList();
  }
}

/// Added new flag 'isFeatured' for making difference between desplayed lists
final _mockArticles = [
  Article(
    id: '1108389a-b3db-11ec-b909-0242ac120002',
    title: 'We are processing your request...',
    publicationDate: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl: 'https://ibb.co/SvH799m',
    description: '''Please excuse the interruption.  
Due to Google's efforts to maintain a “safe ads ecosystem” for its advertisers, publishers and users from fraud and bad experiences, Google has placed restrictions on our ad serving that limit our ability to provide free VPN services. 
Regrettably, this is beyond our control.  
To continue to enjoy ForestVPN without interruptions, please upgrade to our Premium version.''',
    isFeatured: false,
  ),
  Article(
    id: '0e8dba30-b3dc-11ec-b909-0242ac120002',
    title: 'What is Lorem Ipsum...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2)),
    imageUrl: 'https://ibb.co/Wz7JMHR',
    description:
        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
    isFeatured: false,
  ),
  Article(
    id: '787fa7fa-b3dc-11ec-b909-0242ac120002',
    title: 'Why do we use it...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    imageUrl: 'https://ibb.co/vz3t6Y0',
    description:
        '''It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).''',
    isFeatured: true,
  ),
  Article(
    id: 'b818ca9a-b3dc-11ec-b909-0242ac120002',
    title: 'Where does it come from...',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    imageUrl: 'https://ibb.co/cxJ0T5Q',
    description:
        '''Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.''',
    isFeatured: true,
  ),
  Article(
    id: 'dedf2d69-ac54-45ff-b46c-393afe7e9579',
    title: 'He had three simple rules by which he lived.',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 8)),
    imageUrl: 'https://ibb.co/SvH799m',
    description:
        '''He had three simple rules by which he lived. The first was to never eat blue food. There was nothing in nature that was edible that was blue. People often asked about blueberries, but everyone knows those are actually purple. He understood it was one of the stranger rules to live by, but it had served him well thus far in the 50+ years of his life.''',
    isFeatured: true,
  ),
  Article(
    id: 'f2efb493-287f-4990-941b-6c455c48015e',
    title: 'The chair sat in the corner where it had been',
    publicationDate: DateTime.now().subtract(const Duration(days: 4)),
    imageUrl: 'https://ibb.co/Wz7JMHR',
    description:
        '''The chair sat in the corner where it had been for over 25 years. The only difference was there was someone actually sitting in it. How long had it been since someone had done that? Ten years or more he imagined. Yet there was no denying the presence in the chair now.''',
    isFeatured: false,
  ),
  Article(
    id: 'cc029c2b-90ba-4cbb-9030-a1cdcdd86f5b',
    title: 'The rain and wind abruptly stopped.',
    publicationDate: DateTime.now().subtract(const Duration(
      days: 4,
      hours: 2,
    )),
    imageUrl: 'https://ibb.co/vz3t6Y0',
    description:
        '''The rain and wind abruptly stopped, but the sky still had the gray swirls of storms in the distance. Dave knew this feeling all too well. The calm before the storm. He only had a limited amount of time before all Hell broke loose, but he stopped to admire the calmness. Maybe it would be different this time, he thought, with the knowledge deep within that it wouldn't.''',
    isFeatured: false,
  ),
  Article(
    id: '028ad0e8-402c-4e1f-b822-5dc80bc70390',
    title: 'The robot clicked disapprovingly.',
    publicationDate: DateTime.now().subtract(const Duration(days: 4, hours: 6)),
    imageUrl: 'https://ibb.co/cxJ0T5Q',
    description:
        '''The robot clicked disapprovingly, gurgled briefly inside its cubical interior and extruded a pony glass of brownish liquid. "Sir, you will undoubtedly end up in a drunkard's grave, dead of hepatic cirrhosis," it informed me virtuously as it returned my ID card. I glared as I pushed the glass across the table.''',
    isFeatured: true,
  ),
  Article(
    id: 'edb2779b-9199-57cc-ae7e-80a415ca2fe5',
    title: 'There was only one way to do things in the Statton house.',
    publicationDate: DateTime.now().subtract(const Duration(days: 5)),
    imageUrl: 'https://ibb.co/SvH799m',
    description:
        '''There was only one way to do things in the Statton house. That one way was to do exactly what the father, Charlie, demanded. He made the decisions and everyone else followed without question. That was until today.''',
    isFeatured: true,
  ),
  Article(
    id: '5e0735dd-9dfb-5128-8991-ab676f646111',
    title: 'He couldn\'t remember exactly where he had read it',
    publicationDate: DateTime.now().subtract(const Duration(days: 5, hours: 1)),
    imageUrl: 'https://ibb.co/Wz7JMHR',
    description:
        '''He couldn't remember exactly where he had read it, but he was sure that he had. The fact that she didn't believe him was quite frustrating as he began to search the Internet to find the article. It wasn't as if it was something that seemed impossible. Yet she insisted on always seeing the source whenever he stated a fact.''',
    isFeatured: true,
  ),
];
