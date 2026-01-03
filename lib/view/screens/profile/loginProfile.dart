import 'package:arcadein_cafe/view/screens/profile/favorites_screen.dart';
import 'package:arcadein_cafe/view/screens/profile/my_order_screen.dart';
import 'package:arcadein_cafe/view/screens/profile/saved_Addresses_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class LoggedInProfile extends StatelessWidget {
  const LoggedInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ProfileHeader(),
          SizedBox(height: 24),

          ProfileStats(),
          SizedBox(height: 32),

          ProfileMenu(),
          SizedBox(height: 24),

          LogoutButton(),
        ],
      ),
    );
  }
}
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.creamBeige,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBrown.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.darkBrown,
            child: Icon(Icons.person, color: Colors.white, size: 36),
          ),
          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Iqra Ilyas',
                style: AppTextStyles.heading3,
              ),
              const SizedBox(height: 4),
              Text(
                'iqra@email.com',
                style: AppTextStyles.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(title: 'Orders', value: '12'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _StatCard(title: 'Favorites', value: '6'),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.creamBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.latte),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.heading2,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.bodyText1,
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        ProfileMenuTile(
          icon: Icons.receipt_long,
          title: 'My Orders',
          onPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyOrdersScreen()));
          },
        ),
        ProfileMenuTile(
          icon: Icons.favorite,
          title: 'Favorite Items',
          onPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritesScreen()));
          },
        ),
        ProfileMenuTile(
          icon: Icons.location_on,
          title: 'Saved Addresses',
          onPress: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SavedAddressesScreen()));

          },
        ),
        ProfileMenuTile(
          icon: Icons.settings,
          title: 'Settings',
          onPress: (){},
        ),
      ],
    );
  }
}
class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: AppColors.darkBrown),
      title: Text(title, style: AppTextStyles.bodyText1),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap:onPress,
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Logout logic
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.redAccent,
          side: const BorderSide(color: Colors.redAccent),
        ),
        child:  Text('Logout',style: AppTextStyles.buttonText.copyWith(color: Colors.red),),
      ),
    );
  }
}



