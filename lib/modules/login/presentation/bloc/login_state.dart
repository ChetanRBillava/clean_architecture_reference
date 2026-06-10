class LoginState {
  final bool isLoading, showToast, signupMode, loginSuccess;
  final String toastMessage;

  LoginState({
    this.isLoading = false,
    this.showToast = false,
    this.signupMode = false,
    this.loginSuccess = false,
    this.toastMessage = '',
  });

  LoginState init() {
    return LoginState(
      isLoading: false,
      showToast: false,
      signupMode: false,
      loginSuccess: false,
      toastMessage: '',
    );
  }

  LoginState copyWith({
    bool? isLoading,
    bool? showToast,
    bool? signupMode,
    bool? loginSuccess,
    String? toastMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      showToast: showToast ?? this.showToast,
      signupMode: signupMode ?? this.signupMode,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      toastMessage: toastMessage ?? this.toastMessage,
    );
  }

  List<Object?> get props => [
    isLoading,
    showToast,
    signupMode,
    loginSuccess,
    toastMessage,
  ];
}
