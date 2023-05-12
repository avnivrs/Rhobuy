import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:project_naverda/models/user_token_model.dart';
import 'package:project_naverda/styles/constants.dart';

import '../routes/routes.dart';
import '../styles/color.dart';

class LoginService with ChangeNotifier {
  String email;
  String password;
  UserToken _token;
  bool isLoading = false;

  LoginService(this.email, this.password, this._token);

  Future<void> login() async {
    try {
      final GraphQLClient client = GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(apiLink),
      );
      isLoading = true;
      notifyListeners();
      final QueryResult result = await client.mutate(MutationOptions(
        document: gql('''
                mutation Login(\$email: String!, \$password: String!) {
            login(email: \$email, password: \$password) {
              token
            }
          }
      '''),
        variables: {
          'email': email,
          'password': password,
        },
      ));
      isLoading = false;
      notifyListeners();

      if (result.hasException) {
        final List<GraphQLError> errors = result.exception!.graphqlErrors;
        String errorMessage = '';

        for (final error in errors) {
          errorMessage += '${error.message}\n';
        }
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            content: AwesomeSnackbarContent(
              title: 'Login Status',
              color: kGreyColorII,
              message: errorMessage.trim(),
              contentType: ContentType.warning,
            ),
          ),
        );

        print(errorMessage);
      }

      final Map<String, dynamic> tokenData = result.data!['login'];
      _token = UserToken.fromJson(tokenData);
      if (_token.token.isNotEmpty) {
        Get.offAllNamed(AppRoute.homePage);
      }
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      print('fish');
      rethrow;
    }
  }

  UserToken get token => _token;
}
