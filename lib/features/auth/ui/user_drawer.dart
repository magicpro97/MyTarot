import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/auth/ui/widget/user_summary_info.dart';

import 'bloc/bloc.dart';

class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.I<AuthBloc>();

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              authBloc.dispatch(CheckingSignIn());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  state is NotSignInState
                      ? _buildGSignInButton(context)
                      : state is LoadingState
                          ? CircularProgressIndicator()
                          : state is SignInFailState
                              ? _buildGSignInButtonWithError(context)
                              : _buildMenuContent(authBloc.user),
                ],
              );
            }),
      ),
    );
  }

  RaisedButton _buildGSignInButton(BuildContext context) {
    final authBloc = GetIt.I<AuthBloc>();
    final buttonGoogleTextStyle = Theme.of(context).buttonTheme.textTheme;
    return RaisedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(FontAwesomeIcons.google),
          Text(" Sign in with Google"),
        ],
      ),
      color: Colors.deepOrange,
      textTheme: buttonGoogleTextStyle,
      onPressed: () => authBloc.dispatch(SignInEvent()),
    );
  }

  Widget _buildMenuContent(FirebaseUser user) => UserSummaryInfo(
        user: user,
      );

  Widget _buildGSignInButtonWithError(BuildContext context) => Column(
        children: <Widget>[
          _buildGSignInButton(context),
          Text("Cannot sign in.")
        ],
      );
}
