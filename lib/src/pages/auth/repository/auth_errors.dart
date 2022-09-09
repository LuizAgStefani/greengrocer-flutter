String authErrorsString(String? error) {
  switch (error) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválidos';

    case 'Invalid session token':
      return 'Token inválido';

    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadastrar usuário: Nome Inválido';

    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadastrar usuário: Celular Inválido';

    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadastrar usuário: CPF Inválido';

    default:
      return 'Um erro indefinido ocorreu';
  }
}
