class FormValidators {
  static String? validateNom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre nom';
    }
    return null;
  }

  static String? validatePrenom(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre prenom';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  static String? validateMotDePasse(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre motdepasse';
    }
    if (value.length < 8) {
      return 'Le motdepasse doit contenir au moins 8 caracteres';
    }
    return null;
  }
}