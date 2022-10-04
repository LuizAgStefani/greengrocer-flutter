import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final AuthRepository authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();

  UserModel user = UserModel();

  // @override
  // void onInit() {
  //   super.onInit();

  //   validateToken();
  // }

  void saveTokenAndProceedToBase() {
    // Salvar o token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Ir para a base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  // Logar Usuário
  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          backgroundColor: Colors.red,
          isError: true,
        );
      },
    );
  }

  // Validar Token
  Future<void> validateToken() async {
    // Recupar o token que foi salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        signOut();
      },
    );

    // authRepository.validateToken(token);
  }

  // Deslogar usuário
  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  // Cadastrar usuário
  Future<void> signUp() async {
    isLoading.value = true;

    AuthResult result = await authRepository.signUp(user);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          backgroundColor: Colors.red,
          isError: true,
        );
      },
    );
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    isLoading.value = true;

    final result = await authRepository.changePassword(
      email: user.email!,
      currentPassword: currentPassword,
      newPassword: newPassword,
      token: user.token!,
    );

    isLoading.value = false;

    if (result) {
      //Mensagem
      utilsServices.showToast(
        message: 'A senha foi atualizada com sucesso',
        backgroundColor: Colors.green,
        isError: true,
      );

      signOut();
    } else {
      utilsServices.showToast(
        message: 'A senha atual está incorreta',
        backgroundColor: Colors.red,
        isError: true,
      );
    }
  }

  // Resetar Senha
  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }
}
