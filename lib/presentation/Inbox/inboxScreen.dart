import 'package:bail/presentation/Inbox/create_message.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';

class HomePage extends StatefulWidget {
  
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     int _selectedIndex = 0;
     final _controller = SidebarXController(selectedIndex: 0, extended: true);
     final divider = Divider(color: Colors.white.withOpacity(0.3), height: 1);

  // List of pages for each tab
  final List<Widget> _pages = [
    const EmailScreen(),
    const NewMessageScreen(),
    const Center(
      child: Text(''),
    )
   
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      drawer:  SidebarX(
        
        controller: _controller,
         theme: SidebarXTheme(
        
        // margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: const Color(0xFF7F7F7F),
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF7F7F7F).withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [ Color(0xFF7F7F7F),Color.fromARGB(255, 204, 202, 202)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),

      
      extendedTheme: const SidebarXTheme(
        width: 250,
        
        decoration: BoxDecoration(
          color:  Color.fromRGBO(20, 20, 21, 1),
          
        ),

      ),

      footerDivider: divider ,
      headerDivider: divider,
      separatorBuilder: (context, index) {
        return SizedBox(height: 3.h,);
      },

      
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/Asset 7@3x.png'),
          ),
        );
      },
        
        items: const [
          SidebarXItem(icon: Icons.home, label: 'All Inboxes'),
          SidebarXItem(icon: Icons.send, label: 'Outbox'),
        
          SidebarXItem(icon: Icons.people, label: 'Contacts'),
          SidebarXItem(icon: Icons.settings, label: 'Setting'),
          SidebarXItem(icon: Icons.feedback, label: 'Help & feedback'),
        ],
      ),









      
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        useLegacyColorScheme: false,
        elevation: 0,
        iconSize: 3.h,
        selectedLabelStyle: const TextStyle(
          fontSize:0
        ),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        
        selectedItemColor:  const Color(0xFF146FFF),
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            
            icon: ImageIcon(AssetImage('assets/Logos/envelope.png')),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Logos/file-edit.png')),
            label: '',
          ),

            BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Logos/user.png')),
            label: '',
          ),

        ],
      ),
      body:
      
       _pages[_selectedIndex], 
    );
  }
}



class EmailScreen extends StatelessWidget {
  const EmailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
    slivers: [
      SliverAppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        pinned: true,
        stretch: true,
        centerTitle: true,
        expandedHeight: 40.h,
        flexibleSpace:  FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.fadeTitle
          ],
          background: Lottie.asset(
            'assets/lottie/rocket.json',
            fit: BoxFit.cover
          ),
        ),
      ),
    
         SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          pinned: true,
          automaticallyImplyLeading : false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(-10.0),
            child: SizedBox(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Center(
              child: SizedBox(
                width: 310, // Set the width of the SearchBar
                child: SearchBar(
                  hintText: 'Search...',
                  leading: const Icon(Icons.search),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Remove border radius
                    ),
                  ),
                  hintStyle: WidgetStateProperty.all(
                   const  TextStyle(color:  Color.fromARGB(255, 0, 0, 0)),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                     const Color.fromARGB(255, 255, 255, 255)),
                  elevation: WidgetStateProperty.all(2.0),
                  padding: WidgetStateProperty.all(
                  const  EdgeInsets.symmetric(horizontal: 16.0, 
                  ),
                  ),
                  onTap: () {
                    
                  },
                  onChanged: (value) {
                  
                  },
                ),
              ),
            ),
          ),
        ),
    
    
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final Conversation = DummyData[index];
              return  Padding(padding: 
              const EdgeInsets.only(
                left: 10, bottom: 0, right: 10
              ),
              child: _buildConversationEntry(
                Conversation.avatarUrl,
                 Conversation.senderName,
                  Conversation.time,
                 Conversation.title,
                  Conversation.description,
                   Conversation.attachmentUrl,
                   Conversation.attachmentName)
              );
            },
            childCount: DummyData.length
          )
        )
    ],
        );
  }
  Widget _buildConversationEntry(
      String avatarUrl,
      String senderName,
      String time,
      String title,
      String description,
      String attachmentUrl,
      String attachmentName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 6),
        onTap: () {
          // Navigator.pushNamed(context, '/message');
        },
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        radius: 2.h, // Adjust the size as needed
        child: ClipOval(
      child: Image.network(
        avatarUrl,
        width: 40, // Adjust size as needed
        height: 40,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 155, 155, 155),
              strokeWidth: 3,
            ),
          );
        },
      ),
        ),
      ),
              const SizedBox(width: 5.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          senderName,
                          style: TextStyle(
                            color: const Color.fromRGBO(248, 250, 252, 0.8),
                            fontSize: 2.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          time,
                          style:  TextStyle(
                            color: const Color.fromRGBO(127, 127, 127, 1),
                            fontSize: 1.6.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style:  TextStyle(
                            color: const Color.fromRGBO(248, 250, 252, 1),
                            fontSize: 1.8.h,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        attachmentUrl.isNotEmpty
                            ? Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(20, 111, 255, 1),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (description.isNotEmpty)
                      Text(
                        description,
                        style: const TextStyle(
                          color: Color.fromRGBO(127, 127, 127, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    if (attachmentUrl.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(53, 55, 57, 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                attachmentUrl,
                                width: 14,
                                height: 14,
                                loadingBuilder: (context, child, progress) {
                                  return progress == null
                                      ? child
                                      : const Center(child: CircularProgressIndicator());
                                },
                              ),
                              const SizedBox(width: 8),
                              Text(
                                attachmentName,
                                style: const TextStyle(
                                  color: Color.fromRGBO(145, 145, 145, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












class Conversation{
  final String avatarUrl;
  final String senderName;
  final String time;
  final String title;
  final String description;
  final String attachmentUrl;
  final String attachmentName;

Conversation({
  required this.avatarUrl,
  required this.senderName,
  required this.time,
  required this.title,
  required this.description,
  required this.attachmentName,
  required this.attachmentUrl,
});
}

final List<Conversation> DummyData= [
    Conversation(
   avatarUrl: 'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   senderName: 'Suzy Lami',
  time: '29 min ago',
  title: 'Weekly update',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),
 
  Conversation(
    avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    senderName: 'Macmillain px',
  time: '50 min ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),


Conversation(
      avatarUrl:  'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
   senderName:  'James Nv',
  time: '4 hr ago',
 title:  'Notice',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-photo/link-icon-right-side_187299-39509.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
 attachmentName:  'weekly-update.teams'
),


  Conversation(
 avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
 senderName: 'Macmillain px',
 time:  '4 hr ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),

 Conversation(
   avatarUrl: 'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   senderName: 'Suzy Lami',
  time: '7 hr ago',
  title: 'Weekly update',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),

 
  Conversation(
    avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    senderName: 'Macmillain px',
  time: '9 hrs ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),


Conversation(
      avatarUrl:  'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
   senderName:  'James Nv',
  time: '15 hr ago',
 title:  'Notice',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-photo/link-icon-right-side_187299-39509.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
 attachmentName:  'weekly-update.teams'
),


  Conversation(
 avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
 senderName: 'Macmillain px',
 time:  '1 day ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),

   Conversation(
   avatarUrl: 'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   senderName: 'Suzy Lami',
  time: '2 days ago',
  title: 'Weekly update',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),
 
  Conversation(
    avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
    senderName: 'Macmillain px',
  time: '4 days ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),


Conversation(
      avatarUrl:  'https://media.istockphoto.com/id/1389361465/photo/profile-portrait-of-smiling-black-man-in-studio.webp?a=1&b=1&s=612x612&w=0&k=20&c=ivVIBsDAYmDXJMo2V6rm886E6utRCKPZY3B0npYx4E4=',
   senderName:  'James Nv',
  time: '4 day ago',
 title:  'Notice',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-photo/link-icon-right-side_187299-39509.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
 attachmentName:  'weekly-update.teams'
),


  Conversation(
 avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YSUyMG1hbiUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
 senderName: 'Macmillain px',
 time:  '5 days ago',
  title: 'Fast Check',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-psd/whatsapp-icon-isolated-3d-render-illustration_47987-9785.jpg?ga=GA1.1.807243258.1738109013&semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),

 Conversation(
   avatarUrl: 'https://media.istockphoto.com/id/1316604492/photo/profile-portrait-of-middle-aged-man-over-grey-background.webp?a=1&b=1&s=612x612&w=0&k=20&c=zKLBo6kzptiN_TioRA__V-67rK0xndvyg7Ldx4bMqQY=',
   senderName: 'Suzy Lami',
  time: '1 week ago',
  title: 'Weekly update',
  description: 'Hello Antoine, you will find as an attachment the Teams link for our weekly update. See you !',
  attachmentUrl: 'https://img.freepik.com/free-vector/instagram-icon_1057-2227.jpg?semt=ais_hybrid',
  attachmentName: 'weekly-update.teams'
),


];