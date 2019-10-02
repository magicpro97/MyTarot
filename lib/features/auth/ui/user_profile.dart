import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tarot/features/auth/ui/widget/user_summary_info.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';

class UserProfile extends StatelessWidget {
  static const _TAG = 'UserProfile';

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocListener(
        bloc: authBloc,
        listener: (context, listener) => log(listener.toString(), name: _TAG),
        child: BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              if (state is InitialAuthState || state is NotSignInState) {
                authBloc.dispatch(CheckingSignInEvent());
              }
              return (state is NotSignInState) || (state is InitialAuthState)
                  ? _buildGSignInButton(context)
                  : state is LoadingState
                      ? CircularProgressIndicator()
                      : state is SignInFailState
                          ? _buildGSignInButtonWithError(context)
                  : _buildUserProfile();
            }),
      ),
    );
  }

  Widget _buildGSignInButton(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    final buttonGoogleTextStyle = Theme.of(context).buttonTheme.textTheme;

    return Column(
      children: <Widget>[
        Text("Sign in to explore many more features for you."),
        RaisedButton(
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
        ),
      ],
    );
  }

  Widget _buildUserProfile() => UserSummaryInfo();

  Widget _buildGSignInButtonWithError(BuildContext context) => Column(
        children: <Widget>[
          _buildGSignInButton(context),
          Text("Cannot sign in."),
        ],
      );
}
