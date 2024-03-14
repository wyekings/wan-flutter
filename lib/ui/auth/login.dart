import 'package:flutter/material.dart';
import 'package:wan/widget/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _userNameClear = false;

  bool _passwordClear = false;

  bool _obscureText = true;

  bool get _allTextFilled => _userNameClear && _passwordClear;

  @override
  void initState() {
    _userNameController.addListener(() {
      bool value = _userNameController.text.isNotEmpty;
      if (value != _userNameClear) {
        setState(() {
          _userNameClear = value;
        });
      }
    });
    super.initState();
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _doLogin() {
    var userName = _userNameController.text.trim();
    var password = _passwordController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    );

    const iconBoxConstraints = BoxConstraints(
      minWidth: 40.0,
      minHeight: 40.0,
    );

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: WanAppBar(
          title: '登录',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _userNameWidget(iconBoxConstraints, border),
              const SizedBox(
                height: 10.0,
              ),
              _passwordWidget(iconBoxConstraints, border),
              const SizedBox(
                height: 10.0,
              ),
              _loginWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userNameWidget(
      BoxConstraints iconBoxConstraints, OutlineInputBorder border) {
    return SizedBox(
      height: 50.0,
      child: TextField(
        controller: _userNameController,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            size: 24.0,
          ),
          prefixIconConstraints: iconBoxConstraints,
          suffixIcon: Visibility(
            visible: _userNameClear,
            child: IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                _passwordController.clear();

                /// TextEditingController.clear() not call onChanged
                setState(() => _passwordClear = false);
              },
              icon: const Icon(
                Icons.clear,
                size: 18.0,
                color: Colors.black26,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(0.0),
          hintText: '用户名',
          hintStyle: const TextStyle(fontSize: 14.0),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }

  Widget _passwordWidget(
      BoxConstraints iconBoxConstraints, OutlineInputBorder border) {
    return SizedBox(
      height: 50.0,
      child: TextField(
        controller: _passwordController,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() => _passwordClear = value.isNotEmpty);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            size: 24.0,
          ),
          prefixIconConstraints: iconBoxConstraints,
          suffixIconConstraints: iconBoxConstraints,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 34,
                height: 34,
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    // backgroundColor: Colors.transparent,
                  ),
                  iconSize: 18,
                  onPressed: _toggleObscure,
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black26,
                  ),
                ),
              ),
              Visibility(
                visible: _passwordClear,
                child: SizedBox(
                    width: 34.0,
                    height: 34.0,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        _passwordController.clear();

                        /// TextEditingController.clear() not call onChanged
                        setState(() => _passwordClear = false);
                      },
                      icon: const Icon(
                        Icons.clear,
                        size: 18.0,
                        color: Colors.black26,
                      ),
                    )),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.all(0.0),
          hintText: '密码',
          hintStyle: const TextStyle(fontSize: 14.0),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }

  Widget _loginWidget() {
    return IgnorePointer(
      ignoring: !_allTextFilled,
      child: ElevatedButton(
        onPressed: _doLogin,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: _allTextFilled ? Colors.black87 : Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        child: const Text('登录'),
      ),
    );
  }
}
