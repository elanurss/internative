import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewModel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, RegisterViewModel model) =>
            _scaffold(context, model));
  }

  Scaffold _scaffold(BuildContext context, RegisterViewModel viewModel) {
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
                const SizedBox(height: 10.0),
                buildREPasswordField(context, viewModel),
                const SizedBox(height: 40.0),
                buildRegister(context, viewModel),
                const SizedBox(height: 15.0),
                buildLogin(context),
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

  buildLogin(BuildContext context) {
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
                Navigator.pop(context);
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
                      "Login",
                      textAlign: TextAlign.center,
                      style: context.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                  ])),
        ));
  }

  buildRegister(BuildContext context, RegisterViewModel viewModel) {
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
                    : () => viewModel.fetchRegisterUser(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Icon(
                        Icons.login,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: context.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ])),
          ));
    });
  }

  Text buildTopText(BuildContext context) {
    return Text(
      "Sign Up",
      style: context.textTheme.subtitle1!.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.black54.withOpacity(0.7),
      ),
    );
  }

  Widget buildPasswordField(BuildContext context, RegisterViewModel viewModel) {
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

  Widget buildREPasswordField(
      BuildContext context, RegisterViewModel viewModel) {
    return Observer(builder: (_) {
      return TextField(
        obscureText: viewModel.reObscureText,
        controller: viewModel.rePasswordController,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () => viewModel.reObscureChange(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                viewModel.reObscureText
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey[600],
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          labelText: "RE-Password",
          icon: buildIconField(Icons.lock, context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    });
  }

  TextFormField buildEmailField(
      BuildContext context, RegisterViewModel viewModel) {
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
        validator: (girilenVeri) {
          if (!girilenVeri!.contains('@') || !girilenVeri.contains('.com')) {
            return "İnvalid email";
          } else {
            return null;
          }
        });
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
