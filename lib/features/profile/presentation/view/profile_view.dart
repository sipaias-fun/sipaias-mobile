import 'package:flutter/material.dart';
import 'package:sipaias_fun_mobile/cores/extensions/context_extensions.dart';
import 'package:sipaias_fun_mobile/cores/presentation/component/wrapper/wrapper.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_colors.dart';
import 'package:sipaias_fun_mobile/cores/theme/i_sizes.dart';

class MenuItem {
  final String title;
  final String? description;
  final IconData icon;

  MenuItem({required this.title, required this.icon, this.description});
}

class ProfileView extends StatefulWidget {
  static const routeName = '/ProfileView';

  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: _contentBody(context),
    );
  }

  final List<MenuItem> _menuItems = [
    MenuItem(
        title: 'Profile',
        icon: Icons.person,
        description: 'View and edit your profile'),
    MenuItem(
        title: 'Settings',
        icon: Icons.settings,
        description: 'Adjust your preferences'),
    MenuItem(
        title: 'Notifications',
        icon: Icons.notifications,
        description: 'Manage your notifications'),
    MenuItem(
        title: 'Privacy',
        icon: Icons.lock,
        description:
            'Review and adjust your privacy settings to control what information you share'),
    MenuItem(
        title: 'Help', icon: Icons.help, description: 'Get help and support'),
    MenuItem(
        title: 'About', icon: Icons.info, description: 'Learn more about us'),
    MenuItem(
        title: 'Logout',
        icon: Icons.logout,
        description: 'Sign out of your account'),
  ];

  Widget _contentBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.sm),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.padding1),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/avatar.png'), // Replace with your avatar image path
                ),
                SizedBox(width: context.padding2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zico Andreas Aritonang', // Replace with the user's full name
                      style: context.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Palette.emerald600,
                      ),
                    ),
                    SizedBox(height: context.padding1 / 2),
                    Text(
                      'zicoaritonang@gmail.com', // Replace with the user's email or other info
                      style: context.labelMedium?.copyWith(
                        color: Palette.emerald400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: context.padding3),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _menuItems.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle the tap event here
                  print('Tapped on ${_menuItems[index].title}');
                },
                child: Container(
                  padding: EdgeInsets.only(
                    top: context.padding2,
                    bottom: context.padding2,
                    right: context.padding2,
                    left: context.padding1,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Palette.emerald500,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _menuItems[index].icon,
                        color: Palette.emerald600,
                      ),
                      SizedBox(width: context.padding2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _menuItems[index].title,
                              style: context.labelMedium?.copyWith(
                                color: Palette.emerald600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: context.padding1 / 2),
                            Text(
                              '${_menuItems[index].description}.',
                              style: context.labelSmall?.copyWith(
                                color: Palette.emerald400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Palette.emerald400,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
