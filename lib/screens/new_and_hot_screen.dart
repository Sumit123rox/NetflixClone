import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => _NewAndHotScreenState();
}

class _NewAndHotScreenState extends State<NewAndHotScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'New & Hot',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cast, color: Colors.white),
            ),
            SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(color: Colors.blue, width: 25, height: 25),
            ),
            SizedBox(width: 5),
          ],
          bottom: TabBar(
            dividerColor: Colors.transparent,
            isScrollable: false,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            unselectedLabelColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Tab(text: "🍿 Coming Soon"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Tab(text: '🔥 Everyone Watching'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                    description:
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                    logo:
                        "https://upload.wikimedia.org/wikipedia/commons/3/38/Stranger_Things_logo.png",
                    month: "Jun",
                    day: "19",
                  ),
                  SizedBox(height: 20),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                    description:
                        'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                    logo:
                        "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                    month: "Mar",
                    day: "07",
                  ),
                ],
              ),
            ),
            ComingSoonMovieWidget(
              imageUrl:
              'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
              description:
              'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
              logo:
              "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
              month: "Feb",
              day: "20",
            ),
          ],
        ),
      ),
    );
  }
}
