import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:my_tarot/features/auth/ui/widget/user_summary_info.dart';

import 'bloc/bloc.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = GetIt.I<AuthBloc>();

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              authBloc.dispatch(CheckingSignInEvent());
              return Column(
                mainAxisAlignment: authBloc.user != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  state is NotSignInState
                      ? _buildGSignInButton(context)
                      : state is LoadingState
                          ? CircularProgressIndicator()
                          : state is SignInFailState
                              ? _buildGSignInButtonWithError(context)
                      : _buildUserProfile(authBloc.user),
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

  Widget _buildUserProfile(FirebaseUser user) =>
      UserSummaryInfo(
        user: user,
      );

  Widget _buildGSignInButtonWithError(BuildContext context) => Column(
        children: <Widget>[
          _buildGSignInButton(context),
          Text("Cannot sign in.")
        ],
      );
}
