import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:project_naverda/models/user_token_model.dart';
import 'package:project_naverda/styles/constants.dart';

class LoginService with ChangeNotifier {
  String email;
  String password;
  UserToken _token;

  LoginService(this.email, this.password, this._token);

  Future<void> login() async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(apiLink),
    );
    print(email);
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
      onCompleted: (dynamic resultData) {
        print(resultData);
      },
    ));

    if (result.hasException) {
      throw result;
    }

    final Map<String, dynamic> tokenData = result.data!['login'];
    _token = UserToken.fromJson(tokenData);
    notifyListeners();
  }

  UserToken get token => _token;
}
