
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/injection/injection.dart';
import '../../state/bloc/auth_bloc.dart';
import '../widget/background_image.dart';
import '../widget/card_sign_in.dart';
import '../widget/text_field_widget.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/singIn';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const BackgroundImage(
              image: 'assets/images/Group 47934.svg',
            ),
            Padding(
              padding: REdgeInsetsDirectional.only(top: 162, bottom: 162, start: 25, end: 25),
              child: CardSignIn(),
            ),
          ],
        ),
      ),
    );
  }
}
