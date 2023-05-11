import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:project_naverda/models/user_token_model.dart';
import 'package:project_naverda/styles/constants.dart';

class SignUpState extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  UserToken _token;
  bool isLoading = false;

  SignUpState(this.name, this.email, this.password, this._token);

  Future<bool> signUp() async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(apiLink),
    );
    isLoading = true;
    notifyListeners();
    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql('''
            mutation Register(\$name: String!, \$email: String!, \$password: String!) {
              register(name: \$name, email: \$email, password: \$password) {
                token
              }
            }
          '''),
          variables: {'name': name, 'email': email, 'password': password},
          onCompleted: (dynamic resultData) {
            print(resultData);
            // Get.toNamed(AppRoute.emailVerifyPage);
          },
        ),
      );

      final token = result.data!['signUp']['token'];
      print(token);

      isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
