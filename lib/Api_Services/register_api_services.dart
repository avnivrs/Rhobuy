import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SignUpState extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  bool isLoading = false;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  Future<bool> signUp(GraphQLClient client) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await client.mutate(
        MutationOptions(
          document: gql('''
            mutation SignUp(\$name: String!, \$email: String!, \$password: String!) {
              register(name: \$name, email: \$email, password: \$password) {
                token
              }
            }
          '''),
          variables: {'name': name, 'email': email, 'password': password},
        ),
      );

      final token = result.data!['signUp']['token'];

      // save token to storage
      // ...

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
