import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final backgroundColor = const Color(0xFF101010);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: _buildBottomBar(),
      body: ListView(
        children: [
          Image.asset(
            'assets/img/logo.png',
            width: 40,
            height: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          // first section
          _buildThreadCard(
            avatar: 'assets/img/big01.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt \n',
            postImages: [
              'assets/img/asset01.png',
              'assets/img/asset02.png',
            ],
          ),
          _buildThreadCard(
            avatar: 'assets/img/big02.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
            hasInteractions: true,
          ),
          _buildThreadCard(
            avatar: 'assets/img/big03.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
          ),
          _buildThreadCard(
            avatar: 'assets/img/big04.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
          ),
          _buildThreadCard(
            avatar: 'assets/img/big05.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
          ),
          _buildThreadCard(
            avatar: 'assets/img/big06.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
            postImages: [
              'assets/img/asset03.jpg',
              'assets/img/asset04.jpg',
            ],
            hasInteractions: true,
          ),
          _buildThreadCard(
            avatar: 'assets/img/big07.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
          ),
          _buildThreadCard(
            avatar: 'assets/img/big08.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
            postImages: [
              'assets/img/asset05.png',
              'assets/img/asset06.png',
            ],
            hasInteractions: true,
          ),
          _buildThreadCard(
            avatar: 'assets/img/big09.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
          ),
          _buildThreadCard(
            avatar: 'assets/img/big10.png',
            content:
                'Tech rizz. GPT just translated the nutrional mesasurements of this juice for my girlfriend. It\'s a good day to be alive. \n \n #tech #rizz #juice #gpt',
            postImages: [
              'assets/img/asset07.png',
              'assets/img/asset08.png',
            ],
            hasInteractions: true,
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.grey,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              color: Colors.grey,
            ),
            label: '')
      ],
    );
  }

  Widget _buildThreadCard({
    required String avatar,
    required String content,
    List<String>? postImages,
    bool hasInteractions = false,
  }) {
    var circleAvatar = CircleAvatar(
      backgroundImage: AssetImage(avatar),
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hasInteractions
                  ? _buildAvatarwithVerticalDivider(circleAvatar)
                  : circleAvatar,
              const SizedBox(
                width: 12,
              ),
              _buildRightSide(content, postImages),
            ],
          ),
        ),
        // build thread users interactions
        if (hasInteractions)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildUserReactions(),
                const SizedBox(
                  width: 12,
                ),
                const Text('5 replies .', style: TextStyle(color: Colors.grey)),
                const Text(' 2 likes', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey.withOpacity(.3),
        ),
      ],
    );
  }

  Widget _buildAvatarwithVerticalDivider(CircleAvatar circleAvatar) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        circleAvatar,
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 80,
          child: VerticalDivider(
            color: Colors.grey.withOpacity(.3),
            thickness: 1,
          ),
        )
      ],
    );
  }

  Widget _buildRightSide(String content, List<String>? postImages) {
    return Expanded(
      child: Column(
        children: [
          Text(
            content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          if (postImages != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: postImages
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(e),
                        ))
                    .toList(),
              ),
            ),
          _buildThreadActions(),
        ],
      ),
    );
  }

  Widget _buildUserReactions() {
    return SizedBox(
      width: 75,
      height: 60,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            top: 5,
            child: Transform.scale(
              scale: 0.5,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/img/small01.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Transform.scale(
              scale: 0.4,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/img/small02.png'),
              ),
            ),
          ),
          Positioned(
            left: 40,
            top: 0,
            child: Transform.scale(
              scale: .7,
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/img/small03.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreadActions() {
    return Padding(
      padding: EdgeInsets.only(top: 18.0),
      child: Row(
        children: const [
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.comment_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          ),
          // recycle
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.recycling_sharp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
