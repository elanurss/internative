import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internativeapp/core/base/base_view.dart';
import 'package:internativeapp/view/auth/login/viewModel/login_view_model.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../register/view/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
            _scaffold(context, viewModel));
  }

  Scaffold _scaffold(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildAnimatedContainer(context),
                buildTopText(context),
                const SizedBox(height: 20.0),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: buildEmailField(context, viewModel),
                ),
                const SizedBox(height: 10.0),
                buildPasswordField(context, viewModel),
                const SizedBox(height: 40.0),
                buildLogin(context, viewModel),
                const SizedBox(height: 15.0),
                buildRegister(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAnimatedContainer(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Center(
        child: Image.asset(
          ImageConstants.instance.logo,
          width: context.mediaQuery.size.width * .5,
        ),
      ),
    );
  }

  buildLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[900],
            child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: viewModel.isLoading
                    ? null
                    : () => viewModel.fetchLoginUser(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(
                        Icons.login,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: context.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ])),
          ));
    });
  }

  buildRegister(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Icon(
                      Icons.login,
                      size: 30,
                      color: Colors.black,
                    ),
                    Text(
                      "Register",
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ])),
        ));
  }

  Text buildTopText(BuildContext context) {
    return Text(
      "Login",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.black54.withOpacity(0.7),
      ),
    );
  }

  Widget buildPasswordField(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextField(
        obscureText: viewModel.obscureText,
        controller: viewModel.passwordController,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () => viewModel.obscureChange(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                viewModel.obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey[600],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          labelText: "Password",
          icon: buildIconField(Icons.lock, context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    });
  }

  TextFormField buildEmailField(
      BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      controller: viewModel.emailController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        labelText: "Email",
        icon: buildIconField(Icons.email, context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Container buildIconField(IconData icon, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.blue[900],
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
